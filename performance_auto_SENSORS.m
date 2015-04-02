%% Performance - one person (70 kg) and 30 kg of luggage


%% Parallel
clear all
clc
SetAdvisorPath;
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



% Run Acceleration Test
input.accel.param={'spds','disable_systems','disp_results'};
input.accel.value={[0 60; 40 60; 0 85],0,1};
[error, resp]=adv_no_gui('accel_test',input);

% Run the Grade Test
input.grade.param={'duration','speed','grade','disable_systems','ess_init_soc','ess_min_soc'};
input.grade.value={100,55,6.5,0,0.8,0.4};
[error, resp]=adv_no_gui('grade_test',input);
resp.grade.grade

%% Series
clear all
clc
SetAdvisorPath;
% Pass the vehicle
input.init.saved_veh_file='SERIES_defaults_in';
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
        input.modify.value = {0.8790,1};
        [error_code,resp] = adv_no_gui('modify',input)

% Change to a Lithium Ion Battery
input.init.comp_files.comp={'energy_storage'};
input.init.comp_files.name= {'ESS_LI7_temp'};
input.init.comp_files.ver={'rint'};
input.init.comp_files.type ={'li'};
[error_code,resp]=adv_no_gui('initialize',input);
        
        % Modify the number of Battery Modules
        input.modify.param = {'ess_module_num'};
        input.modify.value = {27};
        [error_code,resp] = adv_no_gui('modify',input)

% Change the Motor
input.init.comp_files.comp = {'motor_controller'};
input.init.comp_files.name = {'MC_PM58'};
input.init.comp_files.ver = {''};
input.init.comp_files.type = {''};
[error_code,resp]=adv_no_gui('initialize',input);

        % Scale the trq and spd of the Motor
        input.modify.param = {'mc_trq_scale','mc_spd_scale'}
        input.modify.value = {1.0440,1};
        [a,b] = adv_no_gui('modify',input);
        
% Change the Generator
input.init.comp_files.comp = {'generator'};
input.init.comp_files.name = {'GC_PM32'};
input.init.comp_files.ver = {'reg'};
input.init.comp_files.type = {'reg'};
[error_code,resp]=adv_no_gui('initialize',input);

        % Scale the trq and spd of the Motor
        input.modify.param = {'gc_trq_scale','gc_spd_scale'}
        input.modify.value = {1.3110,0.8570};
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
input.modify.value = {1.0476};
[error_code,resp] = adv_no_gui('modify',input)

% save the vehicle
input.save.filename='small_series_hwfet_test';
[a,b]=adv_no_gui('save_vehicle',input);
%%
% Run Acceleration Test
input.accel.param={'spds','disable_systems','disp_results'};
input.accel.value={[0 60; 40 60; 0 85],0,1};
[error, resp]=adv_no_gui('accel_test',input);

% Run the Grade Test
input.grade.param={'duration','speed','grade','disable_systems','ess_init_soc','ess_min_soc'};
input.grade.value={100,55,6.5,0,0.8,0.4};
[error, resp]=adv_no_gui('grade_test',input);
resp.grade.grade

%% Call the FTP Drive Cycle
   input.cycle.param = {'cycle.name','cycle.soc','cycle.socmenu','cycle.SOCiter'}
   input.cycle.value = {'CYC_FTP','on','zero delta',15}
   [error,resp] = adv_no_gui('drive_cycle', input)
   
%% Call the HWFET Drive Cycle
   input.cycle.param = {'cycle.name','cycle.soc','cycle.socmenu','cycle.SOCiter'}
   input.cycle.value = {'CYC_HWFET','on','zero delta',15}
   [error,resp] = adv_no_gui('drive_cycle', input)
   
%% Call the Step Drive Cycle
   input.cycle.param = {'cycle.name','cycle.soc','cycle.socmenu','cycle.SOCiter'}
   input.cycle.value = {'CYC_const_65','on','zero delta',15}
   [error,resp] = adv_no_gui('drive_cycle', input)
   
%% Electric

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
        input.modify.value = {100,756,1.8,0.22};
        [error_code,resp] = adv_no_gui('modify',input)

% Change to a Lithium Ion Battery
input.init.comp_files.comp={'energy_storage'};
input.init.comp_files.name= {'ESS_LI7_temp'};
input.init.comp_files.ver={'rint'};
input.init.comp_files.type ={'li'};
[error_code,resp]=adv_no_gui('initialize',input);

        % Modify the number of Battery Modules
        input.modify.param = {'ess_module_num'};
        input.modify.value = {33};
        [error_code,resp] = adv_no_gui('modify',input)

% Change the Motor
input.init.comp_files.comp = {'motor_controller'};
input.init.comp_files.name = {'MC_PM58'};
input.init.comp_files.ver = {''};
input.init.comp_files.type = {''};
[error_code,resp]=adv_no_gui('initialize',input);

        % Scale the trq and spd of the Motor
        input.modify.param = {'mc_trq_scale','mc_spd_scale'}
        input.modify.value = {1,1};
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
input.modify.value = {1.0476};
[error_code,resp] = adv_no_gui('modify',input)



% Run Acceleration Test
input.accel.param={'spds','disable_systems','disp_results'};
input.accel.value={[0 60; 40 60; 0 85],0,1};
[error, resp]=adv_no_gui('accel_test',input);

% Run the Grade Test
input.grade.param={'duration','speed','grade','disable_systems','ess_init_soc','ess_min_soc'};
input.grade.value={100,55,6.5,0,0.8,0.4};
[error, resp]=adv_no_gui('grade_test',input);
resp.grade.grade

%% ICE

clear all
clc
SetAdvisorPath;
% Pass the vehicle
input.init.saved_veh_file='CONVENTIONAL_defaults_in';
[error_code,resp]=adv_no_gui('initialize',input);

% Define the Vehicle
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
        input.modify.value = {1.5990,1};
        [error_code,resp] = adv_no_gui('modify',input)

% Define the Accessory Load
input.init.comp_files.comp = {'accessory'};
input.init.comp_files.name = {'ACC_CONV'};
input.init.comp_files.ver = {'Const'};
input.init.comp_files.type = {'Const'};
[error_code,resp]=adv_no_gui('initialize',input);

        % Modify the Accesory load
        input.modify.param = {'acc_mech_pwr'};
        input.modify.value = {700};
        [error_code,resp] = adv_no_gui('modify',input)

% Modify the Final Drive Ratio
input.modify.param = {'fd_ratio'};
input.modify.value = {1.3393};
[error_code,resp] = adv_no_gui('modify',input)



% Run Acceleration Test
input.accel.param={'spds','disable_systems','disp_results'};
input.accel.value={[0 60; 40 60; 0 85],0,1};
[error, resp]=adv_no_gui('accel_test',input);

% Run the Grade Test
input.grade.param={'duration','speed','grade','disable_systems'};
input.grade.value={100,55,6.5,0};
[error, resp]=adv_no_gui('grade_test',input);
resp.grade.grade


%% Call the FTP Drive Cycle
   input.cycle.param = {'cycle.name','cycle.soc'}
   input.cycle.value = {'CYC_FTP','off'}
   [error,resp] = adv_no_gui('drive_cycle', input)
   
%% Call the HWFET Drive Cycle
   input.cycle.param = {'cycle.name','cycle.soc'}
   input.cycle.value = {'CYC_HWFET','off'}
   [error,resp] = adv_no_gui('drive_cycle', input)
   
%% Call the Step Drive Cycle
   input.cycle.param = {'cycle.name','cycle.soc'}
   input.cycle.value = {'CYC_const_65','off'}
   [error,resp] = adv_no_gui('drive_cycle', input)
   
%% Show Outputs 
   mpgge
   hc_gpm
   co_gpm
   nox_gpm
   pm_gpm
   delta_trace
   DeltaSOC
%% Trace Miss
% help trace_miss_analysis
tma = trace_miss_analysis([0 1 2 3], [0 1 4 6], [0 1 2 3.5]);
 
% returns the percent of cycle time that trace is missing by greater than 2 mph
per_gr_2mph( tma )
