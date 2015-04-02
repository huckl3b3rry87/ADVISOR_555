%% Performance



%% Parallel
clear all
clc
SetAdvisorPath;
%Pass the vehicle
input.init.saved_veh_file='PARALLEL_defaults_in';
[error_code,resp]=adv_no_gui('initialize',input);

%Change to a Lithium Ion Battery
input.init.comp_files.comp={'energy_storage'};
input.init.comp_files.name= {'ESS_LI7_temp'};
input.init.comp_files.ver={'rint'};
input.init.comp_files.type ={'li'};
[error_code,resp]=adv_no_gui('initialize',input);

%Modify the Vehicle Mass
input.modify.param = {'veh_mass'};
input.modify.value = {1054};
[error_code,resp] = adv_no_gui('modify',input)

% Run Acceleration Test
input.accel.param={'spds','disable_systems','disp_results'};
input.accel.value={[0 60; 40 60; 0 85],0,1};
[error, resp]=adv_no_gui('accel_test',input);

% Run the Grade Test
input.grade.param={'duration','speed','grade','disable_systems','ess_init_soc','ess_min_soc'};
input.grade.value={100,55,6.5,0,0.6,0.4};
[error, resp]=adv_no_gui('grade_test',input);
resp.grade.grade


%% Series
clear all
clc
SetAdvisorPath;
% Pass the vehicle
input.init.saved_veh_file='SERIES_defaults_in';
[error_code,resp]=adv_no_gui('initialize',input);

% Change to a Lithium Ion Battery
input.init.comp_files.comp={'energy_storage'};
input.init.comp_files.name= {'ESS_LI7_temp'};
input.init.comp_files.ver={'rint'};
input.init.comp_files.type ={'li'};
[error_code,resp]=adv_no_gui('initialize',input);

% Change the motor
input.init.comp_files.comp = {'motor_controller'};
input.init.comp_files.name = {'MC_PM100_UQM'};
input.init.comp_files.ver = {''};
input.init.comp_files.type = {''};
[error_code,resp]=adv_no_gui('initialize',input);

%Modify the Vehicle Mass
input.modify.param = {'veh_mass'};
input.modify.value = {1054};
[error_code,resp] = adv_no_gui('modify',input)

% Run Acceleration Test
input.accel.param={'spds','disable_systems','disp_results'};
input.accel.value={[0 60; 40 60; 0 85],0,1};
[error, resp]=adv_no_gui('accel_test',input);

% Run the Grade Test
input.grade.param={'duration','speed','grade','disable_systems','ess_init_soc','ess_min_soc'};
input.grade.value={100,55,6.5,0,0.6,0.4};
[error, resp]=adv_no_gui('grade_test',input);
resp.grade.grade

%% Electric

clear all
clc
SetAdvisorPath;
%Pass the vehicle
input.init.saved_veh_file='EV_defaults_in';
[error_code,resp]=adv_no_gui('initialize',input);

%Change to a Lithium Ion Battery
input.init.comp_files.comp={'energy_storage'};
input.init.comp_files.name= {'ESS_LI7_temp'};
input.init.comp_files.ver={'rint'};
input.init.comp_files.type ={'li'};
[error_code,resp]=adv_no_gui('initialize',input);

% Change the motor
input.init.comp_files.comp = {'motor_controller'};
input.init.comp_files.name = {'MC_PM100_UQM'};
input.init.comp_files.ver = {''};
input.init.comp_files.type = {''};
[error_code,resp]=adv_no_gui('initialize',input);

%Modify the Vehicle Mass
input.modify.param = {'veh_mass'};
input.modify.value = {1054};
[error_code,resp] = adv_no_gui('modify',input)

% Run Acceleration Test
input.accel.param={'spds','disable_systems','disp_results'};
input.accel.value={[0 60; 40 60; 0 85],0,1};
[error, resp]=adv_no_gui('accel_test',input);

% Run the Grade Test
input.grade.param={'duration','speed','grade','disable_systems','ess_init_soc','ess_min_soc'};
input.grade.value={100,55,6.5,0,0.6,0.4};
[error, resp]=adv_no_gui('grade_test',input);
resp.grade.grade

%% ICE

clear all
clc
SetAdvisorPath;
%Pass the vehicle
input.init.saved_veh_file='CONVENTIONAL_defaults_in';
[error_code,resp]=adv_no_gui('initialize',input);

%Modify the Vehicle Mass
input.modify.param = {'veh_mass'};
input.modify.value = {1054};
[error_code,resp] = adv_no_gui('modify',input)

% Run Acceleration Test
input.accel.param={'spds','disable_systems','disp_results'};
input.accel.value={[0 60; 40 60; 0 85],0,1};
[error, resp]=adv_no_gui('accel_test',input);

% Run the Grade Test
input.grade.param={'duration','speed','grade','disable_systems','ess_init_soc','ess_min_soc'};
input.grade.value={100,55,6.5,0,0.6,0.4};
[error, resp]=adv_no_gui('grade_test',input);
resp.grade.grade

%% TESTING
clear all
clc
SetAdvisorPath;

% Pass the vehicle
input.init.saved_veh_file='SERIES_defaults_in';
[error_code,resp]=adv_no_gui('initialize',input);

%% Change the motor
clc
input.init.com_files.comp = {'motor_controller'};
input.init.com_files.name = {'MC_PM100_UQM'};
input.init.com_files.ver = [];
input.init.com_files.type = [];
[error_code,resp]=adv_no_gui('initialize',input);