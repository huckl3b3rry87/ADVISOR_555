function obj=obj_FTP(x,varargin)

% initialize
error=0;
obj=0;

% Define Global Variables
   global Nominal_MPGGE
   global Nominal_CO
   global Nominal_HC
   global Nominal_NOx
   
% update parameter settings
input.modify.param=varargin{1}; % parameter names are stored in the first optional argument
input.modify.value=num2cell(x); % assign corresponding values
[error,resp]=adv_no_gui('modify',input);

% run city/hwy test procedure
if ~error
   input.cycle.param = {'cycle.name','cycle.soc','cycle.socmenu','cycle.SOCiter'}
   input.cycle.value = {'CYC_FTP','on','zero delta',15}
   [error,resp] = adv_no_gui('drive_cycle', input)
end

% assign objective value
if ~error

    % Calcualte the normalized objective function
    obj = -0.7*resp.cycle.mpgge/Nominal_MPGGE + 0.1*resp.cycle.co_gpm/Nominal_CO + 0.1*resp.cycle.hc_gpm/Nominal_HC + 0.1*resp.cycle.nox_gpm/Nominal_NOx;

end

% assign constraint value
if ~error
   assignin('base','con',[max(abs(resp.cycle.delta_soc)); max(resp.cycle.delta_trace); resp.cycle.mpgge;resp.cycle.co_gpm;resp.cycle.hc_gpm;resp.cycle.nox_gpm])
end

return
