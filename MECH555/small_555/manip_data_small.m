% Small
clear
clc
Ds = 1.93*21; 
load Delta_SOC;
load DV;

Dist = 1./(abs(delta_SOC'))*Ds;  % MIles

cd('Meta_small')
eval(['save(''','Dist_small_Y',''',','''Dist'');'])
eval(['save(''','DV_small_X',''',','''X_save'');'])
cd ..

%%
eval(['save(''','Neural_Net_SMALL',''',','''NNSmallV'');'])