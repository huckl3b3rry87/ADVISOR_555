function obj=obj_HWFET(x,varargin)

% initialize
error=0;
obj=0;
   
% update parameter settings
input.modify.param=varargin{1}; % parameter names are stored in the first optional argument
input.modify.value=num2cell(x); % assign corresponding values
[error,resp]=adv_no_gui('modify',input);

% Run Cycle
if ~error   
   input.cycle.param = {'cycle.name','cycle.soc'}
   input.cycle.value = {'CYC_HWFET','off'}
   [error,resp] = adv_no_gui('drive_cycle', input)
end

% assign objective value
if ~error
    
obj = -resp.cycle.mpgge;

end

% assign constraint value
if ~error
   assignin('base','con',[max(resp.cycle.delta_trace);resp.cycle.mpgge])
end

return
