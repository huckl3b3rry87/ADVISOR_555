function obj=obj_STEP(x,varargin)

% initialize
error=0;
obj=0;

% update parameter settings
input.modify.param={'mc_trq_scale','mc_spd_scale','ess_module_num','fd_ratio'}; % parameter names are stored in the first optional argument
input.modify.value=num2cell(x); % assign corresponding values
[error,~]=adv_no_gui('modify',input);

% run city/hwy test procedure
if ~error
    input.cycle.param = {'cycle.name','cycle.soc','cycle.number'};
    input.cycle.value = {'CYC_WVUINTER','off',21}; % Really the ann arbor cycle
    [error1,resp] = adv_no_gui('drive_cycle', input);
end

f=1;

% assign objective value
if ~error1
    obj= abs(resp.cycle.delta_soc);  
end

% assign constraint value
if ~error1
   assignin('base','con', [abs(resp.cycle.delta_soc);max(resp.cycle.delta_trace)])
end

return
