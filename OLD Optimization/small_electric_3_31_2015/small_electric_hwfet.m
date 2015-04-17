%% Electric

clear all
clc
SetAdvisorPath;
% initiate timer
tic

%Pass the vehicle
input.init.saved_veh_file='ev_small_in';
[error_code,resp]=adv_no_gui('initialize',input);

% % Define the Vehicle
% input.init.comp_files.comp={'vehicle'};
% input.init.comp_files.name= {'VEH_SMCAR'};
% input.init.comp_files.ver={''};
% input.init.comp_files.type ={''};
% [error_code,resp]=adv_no_gui('initialize',input);

        % Modify the Vehicle Parameters
        input.modify.param = {'veh_cargo_mass','veh_glider_mass','veh_FA','veh_CD'};
        input.modify.value = {100,756,1.8,0.22};
        [error_code,resp] = adv_no_gui('modify',input);

% % Change to a Lithium Ion Battery
% input.init.comp_files.comp={'energy_storage'};
% input.init.comp_files.name= {'ESS_LI7_temp'};
% input.init.comp_files.ver={'rint'};
% input.init.comp_files.type ={'li'};
% [error_code,resp]=adv_no_gui('initialize',input);

        % Modify the number of Battery Modules
        input.modify.param = {'ess_module_num'};
        input.modify.value = {44};
        [error_code,resp] = adv_no_gui('modify',input);

% % Change the Motor
% input.init.comp_files.comp = {'motor_controller'};
% input.init.comp_files.name = {'MC_PM58'};
% input.init.comp_files.ver = {''};
% input.init.comp_files.type = {''};
% [error_code,resp]=adv_no_gui('initialize',input);

        % Scale the trq and spd of the Motor
        input.modify.param = {'mc_trq_scale','mc_spd_scale'};
        input.modify.value = {1,1};
        [a,b] = adv_no_gui('modify',input);

% % Define the Accessory Load
% input.init.comp_files.comp = {'accessory'};
% input.init.comp_files.name = {'ACC_HYBRID'};
% input.init.comp_files.ver = {'Const'};
% input.init.comp_files.type = {'Const'};
% [error_code,resp]=adv_no_gui('initialize',input);
% 
%         % Modify the Accesory load
%         input.modify.param = {'acc_elec_pwr'};
%         input.modify.value = {700};
%         [error_code,resp] = adv_no_gui('modify',input)

% Modify the Final Drive Ratio
input.modify.param = {'fd_ratio'};
input.modify.value = {1.0476};
[error_code,resp] = adv_no_gui('modify',input);


dv_names={'mc_trq_scale','mc_spd_scale','ess_module_num','ess_cap_scale','fd_ratio'};
resp_names={'MPGGE___small_electric'};
con_names={'delta_soc','delta_trace','vinf.accel_test.results.time(1)','vinf.accel_test.results.time(2)','vinf.accel_test.results.time(3)','vinf.grade_test.results.grade'};

% define the problem
cont_bool=0;
p_f='obj';
p_c='const';

%         mc_trq_scale              mc_spd_scale                   ess_module_num   ess_cap_scale   
x_L=[0.5*mc_trq_scale,          0.5*mc_spd_scale,             0.5*ess_module_num,       0.5,        0.5*fd_ratio]';
x_U=[1.5*mc_trq_scale,          1.5*mc_spd_scale,             1.5*ess_module_num,       1.5,        1.5*fd_ratio]';

A=[];
b_L=[];
b_U=[];

%       delta_soc   delta_trace   vinf.accel_test.results.time(1)    vinf.accel_test.results.time(2)   vinf.accel_test.results.time(3)   vinf.grade_test.results.grade
c_L=[     0;             0;                    0;                                  0;                                  0;                           6.5];
c_U=[    -1;            2;                   12;                                 5.4;                                 23.8;                         6.6];

I=[];
PriLev=2;
MaxEval=6;
MaxIter=5;
GLOBAL.epsilon=1e-6;
prev_results_filename='small_electric___results';

if cont_bool==1
   eval(['load(''',prev_results_filename,''')']) 
   GLOBAL = small_electric___optimization.GLOBAL;
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
small_electric___optimization = gclSolve(p_f, p_c, x_L, x_U, A, b_L, b_U, c_L, c_U, I, GLOBAL, PriLev, plot_info, dv_names, resp_names, con_names);

% save the results
eval(['save(''',prev_results_filename,''',','''small_electric___optimization'');']) 

% save the vehicle
input.save.filename='small_electric__';
[a,b]=adv_no_gui('save_vehicle',input);

% plot the optimization results
PlotOptimResults(small_electric___optimization.GLOBAL.f_min_hist, plot_info)

% end timer
toc