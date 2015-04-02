% Script to exercise the DIRECT optimization Algorithm with ADVISOR.
%
% 1) initialize workspace
% 2) define the problem
% 3) run optimizer
% 4) save results
%
clear all
clc
SetAdvisorPath;
% initiate timer
tic

% initialize the workspace
if 1% 1=initialize, 0=don't initial - for continuation runs
 
% %Pass the small parallel vehicle
% input.init.saved_veh_file='sm_par_li_ion_auto_in';
% [a,b]=adv_no_gui('initialize',input);

% Pass the vehicle
input.init.saved_veh_file='PARALLEL_defaults_in';
[error_code,resp]=adv_no_gui('initialize',input);

% Change the Vehicle
input.init.comp_files.comp={'vehicle'};
input.init.comp_files.name= {'VEH_SMCAR'};
input.init.comp_files.ver={''};
input.init.comp_files.type ={''};
[error_code,resp]=adv_no_gui('initialize',input);

        % Modify the Vehicle Parameters
        input.modify.param = {'veh_cargo_mass','veh_glider_mass','veh_FA','veh_CD'};
        input.modify.value = {100,756,1.8,0.22};
        [error_code,resp] = adv_no_gui('modify',input)

% Define the ICE
input.init.comp_files.comp={'fuel_converter'};
input.init.comp_files.name= {'FC_SI41_emis'};
input.init.comp_files.ver={'ic'};
input.init.comp_files.type ={'si'};
[error_code,resp]=adv_no_gui('initialize',input);

        % Modify the trq and spd of the Engine
        input.modify.param = {'fc_trq_scale','fc_spd_scale'};
        input.modify.value = {1.2640,1};
        [error_code,resp] = adv_no_gui('modify',input)

% Change to a Lithium Ion Battery
input.init.comp_files.comp={'energy_storage'};
input.init.comp_files.name= {'ESS_LI7_temp'};
input.init.comp_files.ver={'rint'};
input.init.comp_files.type ={'li'};
[error_code,resp]=adv_no_gui('initialize',input);

        % Modify the number of Battery Modules
        input.modify.param = {'ess_module_num'};
        input.modify.value = {14};
        [error_code,resp] = adv_no_gui('modify',input)

% Change the Motor
input.init.comp_files.comp = {'motor_controller'};
input.init.comp_files.name = {'MC_PM58'};
input.init.comp_files.ver = {''};
input.init.comp_files.type = {''};
[error_code,resp]=adv_no_gui('initialize',input);

        % Scale the trq and spd of the Motor
        input.modify.param = {'mc_trq_scale','mc_spd_scale'}
        input.modify.value = {0.5162,1};
        [a,b] = adv_no_gui('modify',input);

% Define the Accessory Load
input.init.comp_files.comp = {'accessory'};
input.init.comp_files.name = {'ACC_HYBRID'};
input.init.comp_files.ver = {'Const'};
input.init.comp_files.type = {'Const'};
[error_code,resp]=adv_no_gui('initialize',input);

        % Modify the Accesory load
        input.modify.param = {'acc_elec_pwr'};
        input.modify.value = {700};
        [error_code,resp] = adv_no_gui('modify',input)

% Modify the Final Drive Ratio
input.modify.param = {'fd_ratio'};
input.modify.value = {1.3393};
[error_code,resp] = adv_no_gui('modify',input)


end

dv_names={'fc_pwr_scale','mc_trq_scale','ess_module_num','ess_cap_scale','cs_charge_trq','cs_min_trq_frac','cs_off_trq_frac','cs_electric_launch_spd_lo','cs_electric_launch_spd_hi','cs_charge_deplete_bool'};
resp_names={'MPGGE_STEP_small_parallel'};
con_names={'delta_soc','delta_trace','vinf.accel_test.results.time(1)','vinf.accel_test.results.time(2)','vinf.accel_test.results.time(3)','vinf.grade_test.results.grade'};

% define the problem
cont_bool=0;
p_f='obj_STEP';
p_c='con_STEP';

% fc_pwr_scale   mc_trq_scale  ess_module_num   ess_cap_scale   cs_charge_trq   cs_min_trq_frac    cs_off_trq_frac    cs_electric_launch_spd_lo  cs_electric_launch_spd_hi   cs_charge_deplete_bool'};
x_L=[0.5,          0.5,             11,            0.5,             1,              0.05,               0.05,               0,                          10,                        0]';
x_U=[1.5,          1.5,             35,            1.5,            80.9,              1,                  1,                15,                         30,                        1]';

A=[];
b_L=[];
b_U=[];

%  delta_soc   delta_trace   vinf.accel_test.results.time(1)    vinf.accel_test.results.time(2)   vinf.accel_test.results.time(3)   vinf.grade_test.results.grade
c_L=[   0;         0;                    0;                                  0;                                  0;                           6.5];
c_U=[ 0.005;       2;                  12;                                  5.4;                                 23.8;                           100];

I=[];
PriLev=2;
MaxEval=400;
MaxIter=3;
GLOBAL.epsilon=1e-4;
prev_results_filename='small_parallel_STEP_results';

if cont_bool==1
   eval(['load(''',prev_results_filename,''')']) 
   GLOBAL = small_parallel_STEP_optimization.GLOBAL;
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
small_parallel_STEP_optimization = gclSolve(p_f, p_c, x_L, x_U, A, b_L, b_U, c_L, c_U, I, GLOBAL, PriLev, plot_info, dv_names, resp_names, con_names);

% save the results
eval(['save(''',prev_results_filename,''',','''small_parallel_STEP_optimization'');']) 

% save the vehicle
input.save.filename='small_parallel_STEP';
[a,b]=adv_no_gui('save_vehicle',input);

% plot the optimization results
PlotOptimResults(small_parallel_STEP_optimization.GLOBAL.f_min_hist, plot_info)

% end timer
toc