% sm_ev_auto_in.m  ADVISOR 2003-00-r0116 input file created: 21-Feb-2014 17:27:28

global vinf 

vinf.name='sm_ev_auto_in';
vinf.drivetrain.name='ev';
vinf.motor_controller.name='MC_AC75';
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
vinf.variables.name{1}='veh_mass';
vinf.variables.value(1)=1054;
vinf.variables.default(1)=1144;
vinf.variables.name{2}='mc_trq_scale';
vinf.variables.value(2)=1;
vinf.variables.default(2)=1;
vinf.variables.name{3}='ess_module_num';
vinf.variables.value(3)=38;
vinf.variables.default(3)=0;
vinf.variables.name{4}='fd_ratio';
vinf.variables.value(4)=1.0476;
vinf.variables.default(4)=1;
