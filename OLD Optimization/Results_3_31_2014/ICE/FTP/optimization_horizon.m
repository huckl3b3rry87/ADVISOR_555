clear
clc
load small_ice_FTP_results

figure(1);
mpg = small_ice_FTP_optimization.GLOBAL.f_min_hist.c(:,2);
iter = small_ice_FTP_optimization.GLOBAL.f_min_hist.iter;
plot(iter,mpg,'linewidth',8)
xlabel('Iterations')
ylabel('MPG'),grid
title('Small ice FTP')
set(gca,'FontSize',15,'fontWeight','bold')
set(findall(gcf,'type','text'),'FontSize',22,'fontWeight','bold')

figure(2);
CO = small_ice_FTP_optimization.GLOBAL.f_min_hist.c(:,3);
iter = small_ice_FTP_optimization.GLOBAL.f_min_hist.iter;
plot(iter,CO,'linewidth',8)
xlabel('Iterations')
ylabel('Carbon Monoxide (g/s)'),grid
title('Small ice FTP')
set(gca,'FontSize',15,'fontWeight','bold')
set(findall(gcf,'type','text'),'FontSize',22,'fontWeight','bold')

figure(3);
HC = small_ice_FTP_optimization.GLOBAL.f_min_hist.c(:,4);
iter = small_ice_FTP_optimization.GLOBAL.f_min_hist.iter;
plot(iter,HC,'linewidth',8)
xlabel('Iterations')
ylabel('Hydrocarbons (g/s)'),grid
title('Small ice FTP')
set(gca,'FontSize',15,'fontWeight','bold')
set(findall(gcf,'type','text'),'FontSize',22,'fontWeight','bold')

figure(4);
NOx = small_ice_FTP_optimization.GLOBAL.f_min_hist.c(:,5);
iter = small_ice_FTP_optimization.GLOBAL.f_min_hist.iter;
plot(iter,NOx,'linewidth',8)
xlabel('Iterations')
ylabel('Oxides of Nitrogen (g/s)'),grid
title('Small ice FTP')
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
trq = small_ice_FTP_optimization.GLOBAL.f_min_hist.x(:,1);
spd = small_ice_FTP_optimization.GLOBAL.f_min_hist.x(:,2);
First = 41*trq(1)*spd(1)
Last = 41*trq(length(trq))*spd(length(spd))
Increase = (Last-First)/Last*100


% Other Component parameters
fd = small_ice_FTP_optimization.GLOBAL.f_min_hist.x(:,3);

% Initial Component Parameters
fc_trq_scale = trq(1);
fc_spd_scale = spd(1);
fd_ratio = fd(1);

% Identify the Design Variables and their ranges 
fprintf('\n\n Control and Component Parameter Ranges\n')
dv_names={'fc_trq_scale',     'fc_spd_scale',     'fd_ratio'};
x_L=[    0.5*fc_trq_scale,  0.5*fc_spd_scale,    0.5*fd_ratio]'
x_U=[    1.5*fc_trq_scale,  1.5*fc_spd_scale,   1.5*fd_ratio]'

% Output the Final Component Parameters
fprintf('\n\n FINAL Component parameters\n')
fc_trq_scale_final = trq(length(trq));
fc_spd_scale_final = spd(length(spd));
fd_ratio_final = fd(length(fd));

x_F_COMP =[    fc_trq_scale_final,  fc_spd_scale_final,  fd_ratio_final]'

