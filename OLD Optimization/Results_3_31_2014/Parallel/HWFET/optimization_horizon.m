clear
clc
load small_parallel_HWFET_results

figure(1);
mpg = small_parallel_hwfet_optimization.GLOBAL.f_min_hist.c(:,3);
iter = small_parallel_hwfet_optimization.GLOBAL.f_min_hist.iter;
plot(iter,mpg,'linewidth',8)
xlabel('Iterations')
ylabel('MPG'),grid
%title('Small Parallel HWFET')
set(gca,'FontSize',15,'fontWeight','bold')
set(findall(gcf,'type','text'),'FontSize',22,'fontWeight','bold')

figure(2);
CO = small_parallel_hwfet_optimization.GLOBAL.f_min_hist.c(:,4);
iter = small_parallel_hwfet_optimization.GLOBAL.f_min_hist.iter;
plot(iter,CO,'linewidth',8)
xlabel('Iterations')
ylabel('Carbon Monoxide (g/s)'),grid
%title('Small Parallel HWFET')
set(gca,'FontSize',15,'fontWeight','bold')
set(findall(gcf,'type','text'),'FontSize',22,'fontWeight','bold')

figure(3);
HC = small_parallel_hwfet_optimization.GLOBAL.f_min_hist.c(:,5);
iter = small_parallel_hwfet_optimization.GLOBAL.f_min_hist.iter;
plot(iter,HC,'linewidth',8)
xlabel('Iterations')
ylabel('Hydrocarbons (g/s)'),grid
%title('Small Parallel HWFET')
set(gca,'FontSize',15,'fontWeight','bold')
set(findall(gcf,'type','text'),'FontSize',22,'fontWeight','bold')

figure(4);
NOx = small_parallel_hwfet_optimization.GLOBAL.f_min_hist.c(:,6);
iter = small_parallel_hwfet_optimization.GLOBAL.f_min_hist.iter;
plot(iter,NOx,'linewidth',8)
xlabel('Iterations')
ylabel('Oxides of Nitrogen (g/s)'),grid
%title('Small Parallel HWFET')
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
trq = small_parallel_hwfet_optimization.GLOBAL.f_min_hist.x(:,1);
First = 41*trq(1)
Last = 41*trq(length(trq))
Increase = (Last-First)/Last*100

fprintf('\nMotor')
trq_m = small_parallel_hwfet_optimization.GLOBAL.f_min_hist.x(:,2);
First = 58*trq_m(1)
Last = 58*trq_m(length(trq_m))
Increase = (Last-First)/Last*100

fprintf('\nBattery Module')
batt = small_parallel_hwfet_optimization.GLOBAL.f_min_hist.x(:,3);
First = batt(1)
Last = batt(length(batt))
Increase = (Last-First)/Last*100