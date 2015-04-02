% Script to exercise the DIRECT optimization Algorithm with ADVISOR.
%
% 1) initialize workspace
% 2) define the problem
% 3) run optimizer
% 4) save results
%


%Pass the small electric vehicle
input.init.saved_veh_file='sm_ev_auto_in';
[error,resp]=adv_no_gui('initialize',input);

% %Modify the vehicle Mass
% input.modify.param = {'veh_mass'};
% input.modify.value = {1054};
% [error_code,resp] = adv_no_gui('modify',input)

%Pass Drive Cycle to the workspace
input.cycle.param = {'cycle.name','cycle.soc'}
input.cycle.value = {'CYC_UDDS','off'}
[error,resp] = adv_no_gui('drive_cycle', input)

