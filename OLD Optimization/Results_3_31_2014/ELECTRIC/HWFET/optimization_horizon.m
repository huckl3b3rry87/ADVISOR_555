clear
clc
load small_electric_HWFET_results

format short

figure(1);
mpg = small_electric_hwfet_optimization.GLOBAL.f_min_hist.c(:,2);
iter = small_electric_hwfet_optimization.GLOBAL.f_min_hist.iter;
plot(iter,mpg,'linewidth',8)
xlabel('Iterations')
ylabel('MPG'),grid
%title('Small electric HWFET')
set(gca,'FontSize',15,'fontWeight','bold')
set(findall(gcf,'type','text'),'FontSize',22,'fontWeight','bold')

% cALCULATE THE Improvement
fprintf('\nMPG\n')
First = mpg(1)
Final = mpg(length(mpg))
Percent_improvement = (mpg(length(mpg))-mpg(1))/mpg(length(mpg))*100

% Calcualte the Size of the Prime Movers
fprintf('\nPrime MOver Sizes\n')

fprintf('\nMotor')
trq_m = small_electric_hwfet_optimization.GLOBAL.f_min_hist.x(:,1);
spd_m = small_electric_hwfet_optimization.GLOBAL.f_min_hist.x(:,2);
First = 58*trq_m(1)*spd_m(1)
Last = 58*trq_m(length(trq_m))*spd_m(length(spd_m))
Increase = (Last-First)/Last*100

fprintf('\nBattery Module')
batt = small_electric_hwfet_optimization.GLOBAL.f_min_hist.x(:,3);
First = batt(1)
Last = batt(length(batt))
Increase = (Last-First)/Last*100

% Other Component parameters
fd = small_electric_hwfet_optimization.GLOBAL.f_min_hist.x(:,5);
cap_scale = small_electric_hwfet_optimization.GLOBAL.f_min_hist.x(:,4);

% Initial Component Parameters
mc_trq_scale = trq_m(1);
mc_spd_scale = spd_m(1);
ess_module_num = batt(1);
fd_ratio = fd(1);
cap_scale = cap_scale(1);

% Identify the Design Variables and their ranges 
fprintf('\n\n Component Parameter Ranges\n')
x_L=[   0.5*mc_trq_scale,  0.5*mc_spd_scale, 0.5*ess_module_num,   0.5*cap_scale,   0.5*fd_ratio]'
x_U=[    1.5*mc_trq_scale,  1.5*mc_spd_scale, 1.5*ess_module_num,   1.5*cap_scale,   1.5*fd_ratio]'

% Output the Final Component Parameters
fprintf('\n\n FINAL Component parameters\n')
mc_trq_scale_final = trq_m(length(trq_m));
mc_spd_scale_final = trq_m(length(trq_m));
ess_module_num_final = batt(length(batt));
fd_ratio_final = fd(length(fd));
ess_cap_scale_final = cap_scale(length(cap_scale));

x_F_COMP =[  mc_trq_scale_final, mc_spd_scale_final, ess_module_num_final,    ess_cap_scale_final,  fd_ratio_final]'



