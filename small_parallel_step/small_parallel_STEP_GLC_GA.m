% Script to optimize component sizes and control in ADVISOR using the Matlab optimization toolbox

% 1) initialize workspace
% 2) define the problem
% 3) run optimizer
% 4) save results


tic
 
%Pass the small ice vehicle
input.init.saved_veh_file='PARALLEL_defaults_in';
[error_code,resp]=adv_no_gui('initialize',input);

%Modify the vehicle Mass
input.modify.param = {'veh_mass'};
input.modify.value = {1054};
[error_code,resp] = adv_no_gui('modify',input)


dv_names={'fc_pwr_scale','ess_module_num'};
resp_names={'MPGGE_STEP_small_parallel'};
con_names={'delta_soc','delta_trace','vinf.accel_test.results.time(1)','vinf.accel_test.results.time(2)','vinf.accel_test.results.time(3)','vinf.grade_test.results.grade'};

% define the problem
FUN='obj_STEP';
NONLCON='con_STEP';

% fc_pwr_scale   mc_trq_scale  ess_module_num   ess_cap_scale   cs_charge_trq   cs_min_trq_frac    cs_off_trq_frac    cs_electric_launch_spd_lo  cs_electric_launch_spd_hi   cs_charge_deplete_bool'};
X0 =[1,20]';
LB =[0.5,11]';
UB =[1.5,35]';

A=[];
B=[];
Aeq=[];
Beq=[];


c_L=[-0.005; -2; 0; 0; 0; 5];
c_U=[0.005; 2; 11.2; 4.4; 20; 6];


% %  delta_soc   delta_trace   vinf.accel_test.results.time(1)    vinf.accel_test.results.time(2)   vinf.accel_test.results.time(3)   vinf.grade_test.results.grade
% c_L=[   0;         0;                    0;                                  0;                                  0;                            5];
% c_U=[ 0.005;       2;                    6;                               4.4;                                 20;                           100];


myoptions=optimset('ga');
myoptions=optimset(myoptions,'Display','iter');%'off'
myoptions=optimset(myoptions,'LargeScale','on');%'on'
myoptions=optimset(myoptions,'DiffMinChange',1e-8);%1e-8
myoptions=optimset(myoptions,'DiffMaxChange',0.1);%0.1
myoptions=optimset(myoptions,'TolFun',1e-6); %1e-6
myoptions=optimset(myoptions,'TolX',1e-6); %1e-6
myoptions=optimset(myoptions,'TolCon',1e-6);%1e-6

% prev_results_filename='small_parallel_STEP_results';

% start the optimization
[X,FVAL,EXITFLAG,OUTPUT]=ga(FUN,X0,A,B,Aeq,Beq,LB,UB,NONLCON,myoptions,dv_names,resp_names,con_names,c_L,c_U)

% save the results
% eval(['save(''',prev_results_filename,''',','''small_parallel_STEP_optimization'');']) 

% save the vehicle
input.save.filename='small_parallel_STEP';
[a,b]=adv_no_gui('save_vehicle',input);

% % plot the optimization results
% PlotOptimResults(small_parallel_STEP_optimization.GLOBAL.f_min_hist, plot_info)

% end timer
toc