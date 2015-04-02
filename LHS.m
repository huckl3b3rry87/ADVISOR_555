%% Electric

clear all
clc
SetAdvisorPath;

%Pass the vehicle
input.init.saved_veh_file='ev_small_in';
[error_code,resp]=adv_no_gui('initialize',input);


% Modify the Vehicle Parameters
input.modify.param = {'veh_cargo_mass','veh_glider_mass','veh_FA','veh_CD'};
input.modify.value = {100,756,1.8,0.22};
[error_code,resp] = adv_no_gui('modify',input);


% Modify the number of Battery Modules
input.modify.param = {'ess_module_num'};
input.modify.value = {44};
[error_code,resp] = adv_no_gui('modify',input);


% Scale the trq and spd of the Motor
input.modify.param = {'mc_trq_scale','mc_spd_scale'};
input.modify.value = {1,1};
[a,b] = adv_no_gui('modify',input);


% Modify the Final Drive Ratio
input.modify.param = {'fd_ratio'};
input.modify.value = {1.0476};
[error_code,resp] = adv_no_gui('modify',input);


%         mc_trq_scale              mc_spd_scale                   ess_module_num   ess_cap_scale
x_L=[0.5*mc_trq_scale,          0.5*mc_spd_scale,             0.5*ess_module_num,       0.5,        0.5*fd_ratio]';
x_U=[1.5*mc_trq_scale,          1.5*mc_spd_scale,              3*ess_module_num,       1.5,        1.5*fd_ratio]';

n = 10000;
dv = 5;
X_temp = lhsdesign(n,dv);

for nn = 1:n
    for pp = 1:dv
        X(nn,pp) = x_L(pp) + X_temp(nn,pp)*(x_U(pp) - x_L(pp));
    end
end
X(:,3) = floor(X(:,3))

            