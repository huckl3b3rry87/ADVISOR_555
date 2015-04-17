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

% Pass the vehicle
input.init.saved_veh_file='CONVENTIONAL_defaults_in';
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
        [error_code,resp] = adv_no_gui('modify',input)

% % Define the ICE
% input.init.comp_files.comp={'fuel_converter'};
% input.init.comp_files.name= {'FC_SI41_emis'};
% input.init.comp_files.ver={'ic'};
% input.init.comp_files.type ={'si'};
% [error_code,resp]=adv_no_gui('initialize',input);

        % Modify the trq and spd of the Engine
        input.modify.param = {'fc_trq_scale','fc_spd_scale'};
        input.modify.value = {1.5990,1};
        [error_code,resp] = adv_no_gui('modify',input)

% % Define the Accessory Load
% input.init.comp_files.comp = {'accessory'};
% input.init.comp_files.name = {'ACC_CONV'};
% input.init.comp_files.ver = {'Const'};
% input.init.comp_files.type = {'Const'};
% [error_code,resp]=adv_no_gui('initialize',input);
% 
%         % Modify the Accesory load
%         input.modify.param = {'acc_mech_pwr'};
%         input.modify.value = {700};
%         [error_code,resp] = adv_no_gui('modify',input)

% Modify the Final Drive Ratio
input.modify.param = {'fd_ratio'};
input.modify.value = {1.3393};
[error_code,resp] = adv_no_gui('modify',input)

% Run it through the drive cycle
   input.cycle.param = {'cycle.name','cycle.soc'}
   input.cycle.value = {'CYC_HWFET','off'}
   [error,resp] = adv_no_gui('drive_cycle', input)
   
% Name the variables of interest
Fuel_Economy = resp.cycle.mpgge;
Carbon_Monoxide = resp.cycle.co_gpm;
Hydro_Carbons = resp.cycle.hc_gpm;
Oxides_de_Nitrogen = resp.cycle.nox_gpm;

% Make an initial file for data
save('ICE_data.mat','Fuel_Economy','Carbon_Monoxide','Hydro_Carbons','Oxides_de_Nitrogen')

dv_names={'fc_trq_scale','fc_spd_scale','fd_ratio'};
resp_names={'MPGGE_HWFET_small_ice'};
con_names={'delta_trace','vinf.accel_test.results.time(1)','vinf.accel_test.results.time(2)','vinf.accel_test.results.time(3)','vinf.grade_test.results.grade'};

global E
E = 1;

% define the problem
cont_bool=0;
p_f='obj_HWFET';
p_c='con_HWFET';

% fc_trq_scale             fc_spd_scale             fd_ratio};
x_L=[0.5*fc_trq_scale,  0.5*fc_spd_scale,        0.5*fd_ratio]';
x_U=[1.5*fc_trq_scale,  1.5*fc_spd_scale,        1.5*fd_ratio ]';



A=[];
b_L=[];
b_U=[];
%  delta_trace   vinf.accel_test.results.time(1)    vinf.accel_test.results.time(2)   vinf.accel_test.results.time(3)   vinf.grade_test.results.grade
c_L=[ 0;                   0;                                0;                                    0;                           6.5];
c_U=[ 2;                  12;                               5.4;                                 23.8;                           6.6];

I=[];
PriLev=2;
MaxEval= 5;
MaxIter= 50;
GLOBAL.epsilon=1e-6;
prev_results_filename='small_ice_HWFET_results';

% 
if cont_bool==1
   eval(['load(''',prev_results_filename,''')']) 
   GLOBAL = small_ice_hwfet_optimization.GLOBAL;
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
small_ice_hwfet_optimization = gclSolve(p_f, p_c, x_L, x_U, A, b_L, b_U, c_L, c_U, I, GLOBAL, PriLev, plot_info, dv_names, resp_names, con_names);

% save the results
eval(['save(''',prev_results_filename,''',','''small_ice_hwfet_optimization'');']) 

% save the vehicle
input.save.filename='small_ice_hwfet';
[a,b]=adv_no_gui('save_vehicle',input);

% plot the optimization results
PlotOptimResults(small_ice_hwfet_optimization.GLOBAL.f_min_hist, plot_info)

% end timer
toc