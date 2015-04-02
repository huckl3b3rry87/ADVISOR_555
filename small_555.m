%% Small Electric
clear all
clc


SetAdvisorPath;
%Pass the vehicle
input.init.saved_veh_file='EV_defaults_in';
[error_code,resp]=adv_no_gui('initialize',input);

% Define the Vehicle
input.init.comp_files.comp={'vehicle'};
input.init.comp_files.name= {'VEH_SMCAR'};
input.init.comp_files.ver={''};
input.init.comp_files.type ={''};
[error_code,resp]=adv_no_gui('initialize',input);

% Modify the Vehicle Parameters
input.modify.param = {'veh_cargo_mass','veh_glider_mass','veh_FA','veh_CD'};
input.modify.value = {280,396,1.7,0.18};
[error_code,resp] = adv_no_gui('modify',input)

% Change to a Lithium Ion Battery
input.init.comp_files.comp={'energy_storage'};
input.init.comp_files.name= {'ESS_LI7_temp'};
input.init.comp_files.ver={'rint'};
input.init.comp_files.type ={'li'};
[error_code,resp]=adv_no_gui('initialize',input);

% Change the Motor
input.init.comp_files.comp = {'motor_controller'};
input.init.comp_files.name = {'MC_PM58'};
input.init.comp_files.ver = {''};
input.init.comp_files.type = {''};
[error_code,resp]=adv_no_gui('initialize',input);

% Define the Accessory Load
input.init.comp_files.comp = {'accessory'};
input.init.comp_files.name = {'ACC_HYBRID'};
input.init.comp_files.ver = {'Const'};
input.init.comp_files.type = {'Const'};
[error_code,resp]=adv_no_gui('initialize',input);

% Modify the Accesory load
input.modify.param = {'acc_elec_pwr'};
input.modify.value = {400};
[error_code,resp] = adv_no_gui('modify',input)

dv_names={'mc_trq_scale','mc_spd_scale','ess_module_num','ess_cap_scale','fd_ratio'};

%         mc_trq_scale              mc_spd_scale                   ess_module_num
x_L=[0.5*mc_trq_scale,          0.5*mc_spd_scale,             0.5*ess_module_num,        0.5*fd_ratio]';
x_U=[1.5*mc_trq_scale,          1.5*mc_spd_scale,             1.5*ess_module_num,        1.5*fd_ratio]';

%       delta_soc   delta_trace   vinf.accel_test.results.time(1)    vinf.grade_test.results.grade
c_L=[     0;             0;                    0;                                         5];
c_U=[     1;             2;                    7;                                         5];

n = 30000;
dv = 4;
X_temp = lhsdesign(n,dv);

for nn = 1:n
    for pp = 1:dv
        X(nn,pp) = x_L(pp) + X_temp(nn,pp)*(x_U(pp) - x_L(pp));
    end
end
X(:,3) = floor(X(:,3));

rr = 1;
for nn = 1:n
    x = [X(nn,1); X(nn,2); X(nn,3); X(nn,4)];
    
    % update parameter settings
    input.modify.param={'mc_trq_scale','mc_spd_scale','ess_module_num','fd_ratio'}; % parameter names are stored in the first optional argument
    input.modify.value=num2cell(x); % assign corresponding values
    [error,~]=adv_no_gui('modify',input);
    
    if ~error
        input.cycle.param = {'cycle.name','cycle.soc'};
        input.cycle.value = {'CYC_WVUINTER','off'}; % Really the ann arbor cycle
        [error1,resp] = adv_no_gui('drive_cycle', input);
    end
    
    if ~error1 && ~isempty(resp.cycle.delta_soc) && ~isempty(resp.cycle.delta_trace)
        con(1) = resp.cycle.delta_soc;
        con(2) = resp.cycle.delta_trace;
    else
        con(1) = 1000;
        con(2) = 1000;
    end
    
    % Run Acceleration Test
    input.accel.param={'spds','disable_systems','disp_results'};
    input.accel.value={[0 20],0,1};
    [error2, acc_time]=adv_no_gui('accel_test',input);
    if ~error2 && ~isempty(acc_time.accel.times)
        con(3) = acc_time.accel.times;
    else
        con(3) = 1000;
    end
    
    % Run the Grade Test
    input.grade.param={'duration','speed','grade','disable_systems','ess_init_soc','ess_min_soc'};
    input.grade.value={100,15,5,0,1,0.3};
    [error3, grade]=adv_no_gui('grade_test',input);
    if ~error3 && ~isempty(grade.grade.grade)
        con(4) = grade.grade.grade;
    else
        con(4) = 1000;
    end
    
    % Save Sim Variables
    constraints(nn,:) = con;
    MPG_all(nn) = resp.cycle.mpgge;
   
    % Check constraints
    for L = 1:4
        if (c_L(L) > abs(con(L)) || c_U(L) < abs(con(L)))  % abs for the delta soc
            fail_con(L) = 1;
        else
            fail_con(L) = 0;
        end
    end
    
    if any(error1 == 1 || error2 == 1 || error3 == 1 || max(fail_con))
        FAIL(nn) = 1;
    else
        FAIL(nn) = 0;
        X_save(rr,:) = x;
        MPG(rr) = resp.cycle.mpgge;
        delta_SOC(rr) = resp.cycle.delta_soc;
        acc_times(rr,:) = acc_time;
        rr = rr + 1;
    end
end

if rr > 1
eval(['save(''','MPG',''',','''MPG'');'])
eval(['save(''','Delta_SOC',''',','''delta_SOC'');'])
eval(['save(''','DV',''',','''X_save'');'])
end