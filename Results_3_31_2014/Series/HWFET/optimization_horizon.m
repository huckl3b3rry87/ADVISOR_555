clc
clear
format short
load small_series_HWFET_results

figure(1);
mpg = small_series_hwfet_optimization.GLOBAL.f_min_hist.c(:,3);
iter = small_series_hwfet_optimization.GLOBAL.f_min_hist.iter;
plot(iter,mpg,'linewidth',8)
xlabel('Iterations')
ylabel('MPG'),grid
%title('Small series HWFET')
set(gca,'FontSize',15,'fontWeight','bold')
set(findall(gcf,'type','text'),'FontSize',22,'fontWeight','bold')

figure(2);
CO = small_series_hwfet_optimization.GLOBAL.f_min_hist.c(:,4);
iter = small_series_hwfet_optimization.GLOBAL.f_min_hist.iter;
plot(iter,CO,'linewidth',8)
xlabel('Iterations')
ylabel('Carbon Monoxide (g/s)'),grid
%title('Small series HWFET')
set(gca,'FontSize',15,'fontWeight','bold')
set(findall(gcf,'type','text'),'FontSize',22,'fontWeight','bold')

figure(3);
HC = small_series_hwfet_optimization.GLOBAL.f_min_hist.c(:,5);
iter = small_series_hwfet_optimization.GLOBAL.f_min_hist.iter;
plot(iter,HC,'linewidth',8)
xlabel('Iterations')
ylabel('Hydrocarbons (g/s)'),grid
%title('Small series HWFET')
set(gca,'FontSize',15,'fontWeight','bold')
set(findall(gcf,'type','text'),'FontSize',22,'fontWeight','bold')

figure(4);
NOx = small_series_hwfet_optimization.GLOBAL.f_min_hist.c(:,6);
iter = small_series_hwfet_optimization.GLOBAL.f_min_hist.iter;
plot(iter,NOx,'linewidth',8)
xlabel('Iterations')
ylabel('Oxides of Nitrogen (g/s)'),grid
%title('Small series HWFET')
set(gca,'FontSize',15,'fontWeight','bold')
set(findall(gcf,'type','text'),'FontSize',22,'fontWeight','bold')

% cALCULATE THE Improvement
fprintf('\nMPG\n')
First = mpg(1)
Final = mpg(length(mpg))
Percent_improvement = (mpg(length(mpg))-mpg(1))/mpg(length(mpg))*100

fprintf('\nCO\n')
First = CO(1)
Final = CO(length(CO))
Percent_improvement = (CO(length(CO))-CO(1))/CO(length(CO))*100

fprintf('\nHC\n')
First = HC(1)
Final = HC(length(HC))
Percent_improvement = (HC(length(HC))-HC(1))/HC(length(HC))*100


fprintf('\nNOx\n')
First = NOx(1)
Final = NOx(length(NOx))
Percent_improvement = (NOx(length(NOx))-NOx(1))/NOx(length(NOx))*100

% Calcualte the Size of the Prime Movers
fprintf('\nPrime MOver Sizes\n')

fprintf('\nICE')
trq = small_series_hwfet_optimization.GLOBAL.f_min_hist.x(:,1);
spd = small_series_hwfet_optimization.GLOBAL.f_min_hist.x(:,2);
First = 41*trq(1)*spd(1)
Last = 41*trq(length(trq))*spd(length(spd))
Increase = (Last-First)/Last*100

fprintf('\nMotor')
trq_m = small_series_hwfet_optimization.GLOBAL.f_min_hist.x(:,3);
First = 58*trq_m(1)
Last = 58*trq_m(length(trq_m))
Increase = (Last-First)/Last*100

fprintf('\nGenerator')
trq_g = small_series_hwfet_optimization.GLOBAL.f_min_hist.x(:,5);
First = 32*trq_g(1)
Last = 32*trq_g(length(trq_g))
Increase = (Last-First)/Last*100

fprintf('\nBattery Module')
batt = small_series_hwfet_optimization.GLOBAL.f_min_hist.x(:,4);
First = batt(1)
Last = batt(length(batt))
Increase = (Last-First)/Last*100

% Other Component parameters
fd = small_series_hwfet_optimization.GLOBAL.f_min_hist.x(:,6);
cap_scale = small_series_hwfet_optimization.GLOBAL.f_min_hist.x(:,7);

% Initial Component Parameters
fc_trq_scale = trq(1);
fc_spd_scale = spd(1);
mc_trq_scale = trq_m(1);
ess_module_num = batt(1);
gc_trq_scale = trq_g(1);
fd_ratio = fd(1);
cap_scale = cap_scale(1);
% Control Parameters
hi_soc = small_series_hwfet_optimization.GLOBAL.f_min_hist.x(:,8);
lo_soc = small_series_hwfet_optimization.GLOBAL.f_min_hist.x(:,9);
max_pwr = small_series_hwfet_optimization.GLOBAL.f_min_hist.x(:,10);
min_pwr = small_series_hwfet_optimization.GLOBAL.f_min_hist.x(:,11);

% Inital Control parameters
cs_hi_soc = hi_soc(1);
cs_lo_soc = lo_soc(1);
cs_max_pwr = max_pwr(1);
cs_min_pwr = min_pwr(1);

% Identify the Design Variables and their ranges 
fprintf('\n\n Control and Component Parameter Ranges\n')
dv_names={'fc_trq_scale',     'fc_spd_scale',    'mc_trq_scale',    'ess_module_num',      'gc_trq_scale',     'fd_ratio',  'ess_cap_scale',    'cs_hi_soc',  'cs_lo_soc',      'cs_max_pwr',   'cs_min_pwr'};
x_L=[    0.5*fc_trq_scale,  0.5*fc_spd_scale,  0.5*mc_trq_scale,  0.5*ess_module_num,   0.5*gc_trq_scale,   0.5*fd_ratio,       0.5,               0.6,         0.2,        0.5*cs_max_pwr,   0.5*cs_min_pwr]'
x_U=[    1.5*fc_trq_scale,  1.5*fc_spd_scale,  1.5*mc_trq_scale,  1.5*ess_module_num,   1.5*gc_trq_scale,   1.5*fd_ratio,       1.5,                1,          0.6,        1.5*cs_max_pwr,   1.5*cs_min_pwr]'

% Output the Final Component Parameters
fprintf('\n\n FINAL Component parameters\n')
fc_trq_scale_final = trq(length(trq));
fc_spd_scale_final = spd(length(spd));
mc_trq_scale_final = trq_m(length(trq_m));
ess_module_num_final = batt(length(batt));
gc_trq_scale_final = trq_g(length(trq_g));
fd_ratio_final = fd(length(fd));
ess_cap_scale_final = cap_scale(length(cap_scale));

x_F_COMP =[    fc_trq_scale_final,  fc_spd_scale_final,  mc_trq_scale_final,  ess_module_num_final,   gc_trq_scale_final,   fd_ratio_final,       ess_cap_scale_final]'

% Output the Final Control Parameters
fprintf('\n Final control parameters\n')
cs_hi_soc_final = hi_soc(length(hi_soc));
cs_lo_soc_final = lo_soc(length(lo_soc));
cs_max_pwr_final = max_pwr(length(max_pwr));
cs_min_pwr_final = min_pwr(length(min_pwr));

x_F_CONT = [cs_hi_soc_final,  cs_lo_soc_final,   cs_max_pwr_final,   cs_min_pwr_final]'

