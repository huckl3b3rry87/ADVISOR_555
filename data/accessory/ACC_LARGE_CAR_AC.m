% ADVISOR data file:  ACC_LARGE_CAR.m
%
% Data source: Delphi Corporation public web site
%
% Data confirmation:
%
% Notes:
% Defines accessory load data for a specific large car. Uses the rpm
% dependant auxiliary load model
%
% Created on: 18 December 2002
% By:  ADB, NREL, aaron_brooker@nrel.gov
%
% Revision history at end of file.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% FILE ID INFO
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
acc_description='Large car air conditioning compressor load';
acc_version=2003; % version of ADVISOR for which the file was generated
acc_proprietary=0; % 0=> non-proprietary, 1=> proprietary, do not distribute
acc_validation=0; % 0=> no validation, 1=> data agrees with source data, 
% 2=> data matches source data and data collection methods have been verified
disp(['Data loaded: ACC_LARGE_CAR - ',acc_description])
acc_mech_model_name='Mechanical Accessories: Speed Dependant and Variable Electrical'; % The mechanical acc model to be used
acc_elec_model_name='Electrical Accessories: Time Variable'; % The electrical acc model to be used

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% LOSS parameters
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% total mechanical accessory load, drawn from the engine
acc_mech_pwr=0;  % (W), mechanical (usually belt-driven) load on engine
acc_elec_pwr=0; % (W), load on power bus
acc_mech_eff=1; % efficiency of accessory
acc_elec_eff=1; % efficiency of accessory
acc_mech_trq=0; % (Nm), constant torque load on engine

% scripts for variable accessories (low-load files):
% A/C
acc_ac_init = 'large_car_ac';
acc_ac_dutycycle = [0 1
    1 1]; % duty cycle; two column matrix of time in column one and load in column two

% Power Steering
acc_ps_init = 'null_ps';
acc_ps_dutycycle = [0 0
   1 0]; % 0% duty cycle; two column matrix of time in column one and load in column two

% Air Compressor
acc_abc_init = 'null_abc';
acc_abc_dutycycle = [0 0
   1 0]; % 0% duty cycle; two column matrix of time in column one and load in column two

% Engine Fan
acc_ef_init = 'null_ef';
acc_ef_dutycycle = [0 0
   1 0]; % 0% duty cycle; two column matrix of time in column one and load in column two

% Alternator
acc_alt_init = 'null_alt';
acc_acdc_inverter_eff = 1.00;

% Engine Oil Pump
acc_op_init = 'null_op'; 
acc_op_dutycycle= [0 0
   1 0]; % 0% duty cycle; two column matrix of time in column one and load in column two

% Engine Water/Coolant Pump
acc_wp_init = 'null_wp'; 
acc_wp_dutycycle= [0 0
   1 0]; % 0% duty cycle; two column matrix of time in column one and load in column two

vinf.AuxLoads=load('Default_aux.mat');
vinf.AuxLoadsOn=0;

acc_dcdc_eff=1; % dc to dc converter efficiency applied to the 14v loads

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% REVISION HISTORY
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 29-SEP-2001:mpo created file from ACC_CONV.m
% 09-OCT-2001:mpo updated file from ACC_HEAVY_ver_acc_g2.m
% 12-MAR-2002:mpo added water pump information
% 4/18/02:ab updated to load aux loads
