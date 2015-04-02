% med_MECH_555_EV_in.m  ADVISOR 2003-00-r0116 input file created: 27-Feb-2015 18:36:52

global vinf 

vinf.name='med_MECH_555_EV_in';
vinf.drivetrain.name='ev';
vinf.motor_controller.name='MC_PM8';
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
vinf.variables.value(1)=6;
vinf.variables.default(1)=0;
vinf.variables.name{2}='fd_ratio';
vinf.variables.value(2)=1.2;
vinf.variables.default(2)=1;
