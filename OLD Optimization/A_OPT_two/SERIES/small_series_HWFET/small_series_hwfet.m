% Script to exercise the DIRECT optimization Algorithm with ADVISOR.
%
% 1) initialize workspace
% 2) define the problem
% 3) run optimizer
% 4) save results
%
clear all;
clc
SetAdvisorPath;

% initiate timer
tic

% % initialize the workspace
% if 1% 1=initialize, 0=don't initial - for continuation runs
    
% Pass the vehicle
input.init.saved_veh_file='series_small_in';
[error_code,resp]=adv_no_gui('initialize',input);

% % Change the Vehicle
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
        input.modify.value = {0.8790,1};
        [error_code,resp] = adv_no_gui('modify',input)

% % Change to a Lithium Ion Battery
% input.init.comp_files.comp={'energy_storage'};
% input.init.comp_files.name= {'ESS_LI7_temp'};
% input.init.comp_files.ver={'rint'};
% input.init.comp_files.type ={'li'};
% [error_code,resp]=adv_no_gui('initialize',input);
        
        % Modify the number of Battery Modules
        input.modify.param = {'ess_module_num'};
        input.modify.value = {27};
        [error_code,resp] = adv_no_gui('modify',input)

% % Change the Motor
% input.init.comp_files.comp = {'motor_controller'};
% input.init.comp_files.name = {'MC_PM58'};
% input.init.comp_files.ver = {''};
% input.init.comp_files.type = {''};
% [error_code,resp]=adv_no_gui('initialize',input);

        % Scale the trq and spd of the Motor
        input.modify.param = {'mc_trq_scale','mc_spd_scale'}
        input.modify.value = {1.0440,1};
        [a,b] = adv_no_gui('modify',input);
        
% % Change the Generator
% input.init.comp_files.comp = {'generator'};
% input.init.comp_files.name = {'GC_PM32'};
% input.init.comp_files.ver = {'reg'};
% input.init.comp_files.type = {'reg'};
% [error_code,resp]=adv_no_gui('initialize',input);

        % Scale the trq and spd of the Generator
        input.modify.param = {'gc_trq_scale','gc_spd_scale'}
        input.modify.value = {1.3110,0.8570};
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
[error_code,resp] = adv_no_gui('modify',input)

% %ensure that you are in the middle of the design space!
% % Run Acceleration Test
% input.accel.param={'spds','disable_systems','disp_results'};
% input.accel.value={[0 60; 40 60; 0 85],0,1};
% [error, resp]=adv_no_gui('accel_test',input);
% 
% % Run the Grade Test
% input.grade.param={'duration','speed','grade','disable_systems','ess_init_soc','ess_min_soc'};
% input.grade.value={100,55,6.5,0,0.8,0.4};
% [error, resp]=adv_no_gui('grade_test',input);
% resp.grade.grade
% pause;

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
   
%dv_names={'fc_trq_scale'};
% dv_names={'fc_trq_scale','fc_spd_scale','mc_trq_scale','ess_module_num','gc_trq_scale','fd_ratio'};
dv_names={'fc_trq_scale','fc_spd_scale','mc_trq_scale','ess_module_num','gc_trq_scale','fd_ratio','ess_cap_scale','cs_hi_soc','cs_lo_soc','cs_min_off_time','cs_max_pwr','cs_min_pwr'};

resp_names={'MPGGE_HWFET_small_series'};
con_names={'delta_soc','delta_trace','vinf.accel_test.results.time(1)','vinf.accel_test.results.time(2)','vinf.accel_test.results.time(3)','vinf.grade_test.results.grade'};

% define the problem
cont_bool=0;
p_f='obj_HWFET';
p_c='con_HWFET';

% % fc_trq_scale               fc_spd_scale         mc_trq_scale       ess_module_num        gc_trq_scale       fd_ratio  
% x_L=[0.5*fc_trq_scale]';
% x_U=[1.5*fc_trq_scale]';

% % fc_trq_scale               fc_spd_scale         mc_trq_scale       ess_module_num        gc_trq_scale       fd_ratio  
% x_L=[(0.5*fc_trq_scale), (0.5*fc_spd_scale),     0.5*mc_trq_scale,  0.5*ess_module_num,   0.5*gc_trq_scale,  0.5*fd_ratio]';
% x_U=[(2*fc_trq_scale),   (2*fc_spd_scale+1),    2*mc_trq_scale,    2*ess_module_num,       2*gc_trq_scale,  2*fd_ratio]';
 
max_P = max(fc_max_trq.*fc_map_spd);
% fc_trq_scale               fc_spd_scale         mc_trq_scale              ess_module_num          gc_trq_scale        fd_ratio   ess_cap_scale     cs_hi_soc    cs_lo_soc       cs_min_off_time    cs_max_pwr   cs_min_pwr
x_L=[(0.5*fc_trq_scale), (0.5*fc_spd_scale),    0.5*mc_trq_scale,    round(0.5*ess_module_num),  0.5*gc_trq_scale,   0.5*fd_ratio,    0.5,               0.6,         0.2,            10,             0.5*max_P,  0.5*max_P]';
x_U=[(1.5*fc_trq_scale), (1.5*fc_spd_scale),    1.5*mc_trq_scale,    round(1.5*ess_module_num),  1.5*gc_trq_scale,   1.5*fd_ratio,    1.5,               0.9,        0.4,           10000,           1.5*max_P,   1.5*max_P]';

A=[];
b_L=[];
b_U=[];

%  delta_soc   delta_trace   vinf.accel_test.results.time(1)    vinf.accel_test.results.time(2)   vinf.accel_test.results.time(3)   vinf.grade_test.results.grade
c_L=[   0;         0;                    0;                                  0;                                  0;                           6.5];
c_U=[ 0.005;       2;                   12;                                5.4;                                 23.8;                         100];


I=[];
PriLev=2;
MaxEval=15;
MaxIter=50;
GLOBAL.epsilon=1e-6;
prev_results_filename='small_series_HWFET_results';

if cont_bool==1
   eval(['load(''',prev_results_filename,''')']) 
   GLOBAL = small_series_hwfet_optimization.GLOBAL;
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
small_series_hwfet_optimization = gclSolve(p_f, p_c, x_L, x_U, A, b_L, b_U, c_L, c_U, I, GLOBAL, PriLev, plot_info, dv_names, resp_names, con_names);

% save the results
eval(['save(''',prev_results_filename,''',','''small_series_hwfet_optimization'');']) 

% save the vehicle
input.save.filename='small_series_hwfet';
[a,b]=adv_no_gui('save_vehicle',input);

% plot the optimization results
PlotOptimResults(small_series_hwfet_optimization.GLOBAL.f_min_hist, plot_info)

% end timer
toc