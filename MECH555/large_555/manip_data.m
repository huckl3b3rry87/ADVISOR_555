% Large
clear
clc
Dl = 7.45*8; 
load l_Delta_SOC;
load l_DV;

Dist = 1./(abs(delta_SOC'))*Dl;  % Miles

cd('meta_large')
eval(['save(''','Dist_large_Y',''',','''Dist'');'])
eval(['save(''','DV_large_X',''',','''X_save'');'])
cd ..

%%
eval(['save(''','Neural_Net_LARGE',''',','''NNLargeV'');'])