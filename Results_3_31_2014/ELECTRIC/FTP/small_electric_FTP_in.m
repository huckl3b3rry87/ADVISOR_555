% small_electric_FTP_in.m  ADVISOR 2003-00-r0116 input file created: 29-Mar-2014 10:29:02

global vinf 

vinf.name='small_electric_FTP_in';
vinf.drivetrain.name='ev';
vinf.motor_controller.name='MC_PM58';
vinf.energy_storage.name='ESS_LI7_temp';
vinf.energy_storage.ver='rint';
vinf.energy_storage.type='li';
vinf.transmission.name='TX_1SPD';
vinf.transmission.ver='man';
vinf.transmission.type='man';
vinf.wheel_axle.name='WH_SMCAR';
vinf.wheel_axle.ver='Crr';
vinf.wheel_axle.type='Crr';
vinf.vehicle.name='VEH_SMCAR';
vinf.powertrain_control.name='PTC_EV';
vinf.powertrain_control.ver='ev';
vinf.powertrain_control.type='man';
vinf.accessory.name='ACC_HYBRID';
vinf.accessory.ver='Const';
vinf.accessory.type='Const';
vinf.variables.name{1}='ess_module_num';
vinf.variables.value(1)=48.3951;
vinf.variables.default(1)=25;
vinf.variables.name{2}='mc_trq_scale';
vinf.variables.value(2)=1.5103;
vinf.variables.default(2)=1;
vinf.variables.name{3}='fd_ratio';
vinf.variables.value(3)=0.6208;
vinf.variables.default(3)=1;
vinf.variables.name{4}='acc_elec_pwr';
vinf.variables.value(4)=3200;
vinf.variables.default(4)=3200;
vinf.variables.name{5}='ess_cap_scale';
vinf.variables.value(5)=1.4444;
vinf.variables.default(5)=1;
vinf.variables.name{6}='mc_spd_scale';
vinf.variables.value(6)=0.71605;
vinf.variables.default(6)=1;
