%% Small Electric
clear all
clc
tic

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
[error_code,resp] = adv_no_gui('modify',input);

% Modify the number of Battery Modules
input.modify.param = {'ess_module_num'};
input.modify.value = {100};
[error_code,resp] = adv_no_gui('modify',input);

dv_names={'mc_trq_scale','mc_spd_scale','ess_module_num','ess_cap_scale','fd_ratio'};

%         mc_trq_scale              mc_spd_scale                   ess_module_num
x_L=[0.5*mc_trq_scale,          0.5*mc_spd_scale,               0.5*ess_module_num,        0.5*fd_ratio]';
x_U=[1.5*mc_trq_scale,          1.5*mc_spd_scale,               2*ess_module_num,        1.5*fd_ratio]';
%%
con_names={'delta_soc','delta_trace','vinf.accel_test.results.time(1)','vinf.grade_test.results.grade'};
%       delta_soc   delta_trace   vinf.accel_test.results.time(1)    vinf.grade_test.results.grade
c_L=[     0;             0;                    0;                                         4];
c_U=[     1.1;           2;                    7;                                         6];


resp_names={'Distance Small EV'};

% define the problem
cont_bool=0;
p_f='obj_STEP';
p_c='con_STEP';

A=[];
b_L=[];
b_U=[];

con_names={'delta_soc','delta_trace','vinf.accel_test.results.time(1)','vinf.grade_test.results.grade'};


I=[];
PriLev=2;
MaxEval=40;
MaxIter=39;
GLOBAL.epsilon=1e-4;
prev_results_filename='small_dist_MECH_555';

if cont_bool==1
   eval(['load(''',prev_results_filename,''')']) 
   GLOBAL = small_electric_STEP_optimization.GLOBAL;
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
small_electric_STEP_optimization = gclSolve(p_f, p_c, x_L, x_U, A, b_L, b_U, c_L, c_U, I, GLOBAL, PriLev, plot_info, dv_names, resp_names, con_names);

% save the results
eval(['save(''',prev_results_filename,''',','''small_electric_STEP_optimization'');']) 

% save the vehicle
input.save.filename='small_electric_STEP';
[a,b]=adv_no_gui('save_vehicle',input);

% plot the optimization results
PlotOptimResults(small_electric_STEP_optimization.GLOBAL.f_min_hist, plot_info)

% end timer
toc