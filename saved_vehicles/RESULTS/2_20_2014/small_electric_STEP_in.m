% small_electric_STEP_in.m  ADVISOR 2003-00-r0116 input file created: 22-Feb-2014 21:23:27

global vinf 

vinf.name='small_electric_STEP_in';
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
vinf.variables.name{2}='ess_module_num';
vinf.variables.value(2)=32.5;
vinf.variables.default(2)=0;
vinf.variables.name{3}='fd_ratio';
vinf.variables.value(3)=1.0476;
vinf.variables.default(3)=1;
vinf.variables.name{4}='mc_trq_scale';
vinf.variables.value(4)=1.1667;
vinf.variables.default(4)=1;
vinf.variables.name{5}='mc_spd_scale';
vinf.variables.value(5)=1.1667;
vinf.variables.default(5)=1;
vinf.variables.name{6}='ess_cap_scale';
vinf.variables.value(6)=1;
vinf.variables.default(6)=1;
