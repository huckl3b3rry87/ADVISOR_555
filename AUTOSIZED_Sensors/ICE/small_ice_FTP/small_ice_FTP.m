clear all
clc
SetAdvisorPath;

% initiate timer
tic

% Pass the vehicle
input.init.saved_veh_file='CONVENTIONAL_defaults_in';
[error_code,resp]=adv_no_gui('initialize',input);

        % Modify the Vehicle Parameters
        input.modify.param = {'veh_cargo_mass','veh_glider_mass','veh_FA','veh_CD','wh_1st_rrc'};
        input.modify.value = {100,914,1.8,0.22,0.006};
        [error_code,resp] = adv_no_gui('modify',input)

        % Modify the trq and spd of the Engine
        input.modify.param = {'fc_trq_scale','fc_spd_scale'};
        input.modify.value = {1.807,1};
        [error_code,resp] = adv_no_gui('modify',input)

        % Modify the Accesory load
        input.modify.param = {'acc_mech_pwr'};
        input.modify.value = {3200};
        [error_code,resp] = adv_no_gui('modify',input)

        % Modify the Final Drive Ratio
        input.modify.param = {'fd_ratio'};
        input.modify.value = {1.3393};
        [error_code,resp] = adv_no_gui('modify',input)

% Determine Nominal Values
input.cycle.param = {'cycle.name','cycle.soc'}
input.cycle.value = {'CYC_FTP','off'}
[error,resp] = adv_no_gui('drive_cycle', input)

   global Nominal_MPGGE
   Nominal_MPGGE = resp.cycle.mpgge;
   global Nominal_CO
   Nominal_CO = resp.cycle.co_gpm;
   global Nominal_HC
   Nominal_HC = resp.cycle.hc_gpm;
   global Nominal_NOx
   Nominal_NOx = resp.cycle.nox_gpm;

% Identify the Design Variables
dv_names={'fc_trq_scale',   'fc_spd_scale',          'fd_ratio'};
x_L=[   0.5*fc_trq_scale,  0.5*fc_spd_scale,        0.5*fd_ratio]';
x_U=[   1.5*fc_trq_scale,  1.5*fc_spd_scale,        1.5*fd_ratio ]';

% Identify the Constraints and their ranges   
con_names={'delta_trace','resp.cycle.mpgge','resp.cycle.co_gpm','resp.cycle.hc_gpm','resp.cycle.nox_gpm','vinf.accel_test.results.time(1)','vinf.accel_test.results.time(2)','vinf.accel_test.results.time(3)','vinf.grade_test.results.grade'};
c_L=[          0;               0;                  0;                0;                     0;                    0;                                  0;                                  0;                           6.5];
c_U=[          2;            1000;               1000;             1000;                  1000;                   12;                                5.4;                                 23.8;                         6.6];

% Define the Problem
PriLev=1;                      % 1 is no graph 2 shows a graph
MaxEval=2000;
MaxIter=1999;
GLOBAL.epsilon=1e-4;

% Define the Objective function Name for the GRAPH
resp_names={'FTP_small_ice'};

p_f='obj_FTP';
p_c='con_FTP';

A=[];
b_L=[];
b_U=[];
I=[];
cont_bool=0;    % Continue from a Previous Run??
prev_results_filename='small_ice_FTP_results';

if cont_bool==1
   eval(['load(''',prev_results_filename,''')']) 
   GLOBAL = small_ice_FTP_optimization.GLOBAL;
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
small_ice_FTP_optimization = gclSolve(p_f, p_c, x_L, x_U, A, b_L, b_U, c_L, c_U, I, GLOBAL, PriLev, plot_info, dv_names, resp_names, con_names);

% save the results
eval(['save(''',prev_results_filename,''',','''small_ice_FTP_optimization'');']) 

% save the vehicle
input.save.filename='small_ice_FTP';
[a,b]=adv_no_gui('save_vehicle',input);

% plot the optimization results
PlotOptimResults(small_ice_FTP_optimization.GLOBAL.f_min_hist, plot_info)

% end timer
toc