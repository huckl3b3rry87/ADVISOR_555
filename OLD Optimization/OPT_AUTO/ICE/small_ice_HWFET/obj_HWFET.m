function obj=obj_HWFET(x,varargin)

% initialize
error=0;
obj=0;

% update parameter settings
input.modify.param=varargin{1}; % parameter names are stored in the first optional argument
input.modify.value=num2cell(x); % assign corresponding values
[error,resp]=adv_no_gui('modify',input);

% run city/hwy test procedure
if ~error
%    input.procedure.param={'test.name'};
%    input.procedure.value={'TEST_CITY_HWY'};
%    [error,resp]=adv_no_gui('test_procedure',input);
   
   input.cycle.param = {'cycle.name','cycle.soc'}
   input.cycle.value = {'CYC_HWFET','off'}
   [error,resp] = adv_no_gui('drive_cycle', input)
end

% assign objective value
if ~error
  obj= -0.7*resp.cycle.mpgge + 0.1*resp.cycle.co_gpm + 0.1*resp.cycle.hc_gpm + 0.1*resp.cycle.nox_gpm; % -1* to maximize objective
% obj=-1*resp.procedure.mpgge; % -1* to maximize objective

% Name the variables of interest

global E


% eval(sprintf('Fuel_Economy%d = resp.cycle.mpgge',EVALUATION));
% eval(sprintf('Carbon_Monoxide%d = resp.cycle.co_gpm',EVALUATION));
% eval(sprintf('Hydro_Carbons%d = resp.cycle.hc_gpm',EVALUATION));
% eval(sprintf('Oxides_de_Nitrogen%d = resp.cycle.nox_gpm',EVALUATION));
% 
% % Append the data
% save('ICE_data.mat','Fuel_Economy','Carbon_Monoxide','Hydro_Carbons','Oxides_de_Nitrogen','-append')
% 
eval(sprintf('Fuel_Economy%d = resp.cycle.mpgge',E));
eval(sprintf('Carbon_Monoxide%d = resp.cycle.co_gpm',E));
eval(sprintf('Hydro_Carbons%d = resp.cycle.hc_gpm',E));
eval(sprintf('Oxides_de_Nitrogen%d = resp.cycle.nox_gpm',E));

% % Append the data
% save('ICE_data.mat','Fuel_Economy%d''num2str(E)','Carbon_Monoxide','Hydro_Carbons','Oxides_de_Nitrogen','-append')
save('ICE_data.mat',sprintf('Fuel_Economy%d',E),'-append')

% Append the data
% save('ICE_data.mat',eval(sprintf('Fuel_Economy%d = resp.cycle.mpgge',EVALUATION)),eval(sprintf('Carbon_Monoxide%d = resp.cycle.co_gpm',EVALUATION)),eval(sprintf('Hydro_Carbons%d = resp.cycle.hc_gpm',EVALUATION)),eval(sprintf('Oxides_de_Nitrogen%d = resp.cycle.nox_gpm',EVALUATION)),'-append')

E = E + 1;

end

% assign constraint value
if ~error
   assignin('base','con',[max(resp.cycle.delta_trace)])
end

return
