 


clear all
 clc
 SetAdvisorPath;
%Pass the small ice vehicle
input.init.saved_veh_file='PARALLEL_defaults_in';
[error_code,resp]=adv_no_gui('initialize',input);


x = 0.5;

% 
% input.modify.param={'fc_pwr_scale'}; % parameter names are stored in the first optional argument
% input.modify.value= .5 % assign corresponding values num2cell
% [error,resp]=adv_no_gui('modify',input);

input.modify.param={'mc_trq_scale','fc_trq_scale'}
input.modify.value={0.75,1.2}
[error,resp]=adv_no_gui('modify',input);