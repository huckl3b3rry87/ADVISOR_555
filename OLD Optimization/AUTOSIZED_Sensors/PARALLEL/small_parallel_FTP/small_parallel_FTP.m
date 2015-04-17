
clear all
clc
SetAdvisorPath;
tic
 
 
% Pass the vehicle
input.init.saved_veh_file='parallel_small_in';
[error_code,resp]=adv_no_gui('initialize',input);

        % Modify the Vehicle Parameters
        input.modify.param = {'veh_cargo_mass','veh_glider_mass','veh_FA','veh_CD','wh_1st_rrc'};
        input.modify.value = {100,914,1.8,0.22,0.006};
        [error_code,resp] = adv_no_gui('modify',input);

        % Modify the trq and spd of the Engine
        input.modify.param = {'fc_trq_scale','fc_spd_scale'};
        input.modify.value = {1.343,1};
        [error_code,resp] = adv_no_gui('modify',input);

        % Modify the number of Battery Modules
        input.modify.param = {'ess_module_num'};
        input.modify.value = {15};
        [error_code,resp] = adv_no_gui('modify',input);

        % Scale the trq and spd of the Motor
        input.modify.param = {'mc_trq_scale','mc_spd_scale'};
        input.modify.value = {0.345,1};
        [a,b] = adv_no_gui('modify',input);

        % Modify the Final Drive Ratio
        input.modify.param = {'fd_ratio'};
        input.modify.value = {1.3393};
        [error_code,resp] = adv_no_gui('modify',input);
        
        % Modify the Accesory load
        input.modify.param = {'acc_elec_pwr'};
        input.modify.value = {3200};
        [error_code,resp] = adv_no_gui('modify',input);
        
% Determine Nominal Values
   input.cycle.param = {'cycle.name','cycle.soc','cycle.socmenu','cycle.SOCiter'}
   input.cycle.value = {'CYC_HWFET','on','zero delta',15}
   [error,resp] = adv_no_gui('drive_cycle', input)
   global Nominal_MPGGE
   Nominal_MPGGE = resp.cycle.mpgge;
   global Nominal_CO
   Nominal_CO = resp.cycle.co_gpm;
   global Nominal_HC
   Nominal_HC = resp.cycle.hc_gpm;
   global Nominal_NOx
   Nominal_NOx = resp.cycle.nox_gpm;

% Identify the Design Variables and their ranges    
dv_names={ 'fc_trq_scale',  'mc_trq_scale',    'ess_module_num',     'fd_ratio',  'ess_cap_scale',     'cs_charge_trq',   'cs_min_trq_frac',   'cs_off_trq_frac',   'cs_electric_launch_spd_lo',  'cs_electric_launch_spd_hi',  'cs_charge_deplete_bool'};
x_L=[    0.5*fc_trq_scale, 0.5*mc_trq_scale,  0.5*ess_module_num,   0.5*fd_ratio,      0.5,           0.5*cs_charge_trq,         0.4,                 0.1,                     0,                           10,                          0]';
x_U=[    1.5*fc_trq_scale, 1.5*mc_trq_scale,  1.5*ess_module_num,   1.5*fd_ratio,      1.5,           1.5*cs_charge_trq,         0.9,                 0.5,                     15,                          30,                          1]';

% Identify the Constraints and their ranges   
con_names={'delta_soc','delta_trace','resp.cycle.mpgge','resp.cycle.co_gpm','resp.cycle.hc_gpm','resp.cycle.nox_gpm','vinf.accel_test.results.time(1)','vinf.accel_test.results.time(2)','vinf.accel_test.results.time(3)','vinf.grade_test.results.grade'};
c_L=[          0;         0;               0;                  0;                0;                     0;                    0;                                  0;                                  0;                           6.5];
c_U=[       0.005;        2;            1000;               1000;             1000;                  1000;                   12;                                5.4;                                 23.8;                         6.6];

% Define the Problem
PriLev=1;                      % 1 is no graph 2 shows a graph
MaxEval=2000;
MaxIter=1999;
GLOBAL.epsilon=1e-4;

% Define the Objective function Name for the GRAPH
resp_names={'MPGGE_FTP_small_parallel'};

p_f='obj_FTP';
p_c='con_FTP';

A=[];
b_L=[];
b_U=[];
I=[];
cont_bool=0;    % Continue from a Previous Run??
prev_results_filename='small_parallel_FTP_results';

if cont_bool==1
   eval(['load(''',prev_results_filename,''')']) 
   GLOBAL = small_parallel_FTP_optimization.GLOBAL;
   GLOBAL.MaxEval = MaxEval;
   GLOBAL.MaxIter = MaxIter;
else
   GLOBAL.MaxEval = MaxEval;
   GLOBAL.MaxIter = MaxIter;
end

plot_info.var_label=dv_names;
plot_info.var_ub=num2cell(x_U);
plot_info.var_lb=num2cell(x_L);
plot_info.con_label=con_names;
plot_info.con_ub=num2cell(c_U);
plot_info.con_lb=num2cell(c_L);
plot_info.fun_label=resp_names;

% start the optimization
small_parallel_FTP_optimization = gclSolve(p_f, p_c, x_L, x_U, A, b_L, b_U, c_L, c_U, I, GLOBAL, PriLev, plot_info, dv_names, resp_names, con_names);

% save the results
eval(['save(''',prev_results_filename,''',','''small_parallel_FTP_optimization'');']) 

% save the vehicle
input.save.filename='small_parallel_FTP';
[a,b]=adv_no_gui('save_vehicle',input);

% plot the optimization results
PlotOptimResults(small_parallel_FTP_optimization.GLOBAL.f_min_hist, plot_info)

% end timer
toc