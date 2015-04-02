% small_ice_STEP_in.m  ADVISOR 2003-00-r0116 input file created: 22-Feb-2014 21:56:04

global vinf 

vinf.name='small_ice_STEP_in';
vinf.drivetrain.name='conventional';
vinf.fuel_converter.name='FC_SI41_emis';
vinf.fuel_converter.ver='ic';
vinf.fuel_converter.type='si';
vinf.transmission.name='TX_5SPD';
vinf.transmission.ver='man';
vinf.transmission.type='man';
vinf.wheel_axle.name='WH_SMCAR';
vinf.wheel_axle.ver='Crr';
vinf.wheel_axle.type='Crr';
vinf.vehicle.name='VEH_SMCAR';
vinf.exhaust_aftertreat.name='EX_SI';
vinf.powertrain_control.name='PTC_CONV';
vinf.powertrain_control.ver='conv';
vinf.powertrain_control.type='man';
vinf.accessory.name='ACC_CONV';
vinf.accessory.ver='Const';
vinf.accessory.type='Const';
vinf.variables.name{1}='veh_mass';
vinf.variables.value(1)=1054;
vinf.variables.default(1)=984;
vinf.variables.name{2}='fc_spd_scale';
vinf.variables.value(2)=0.66667;
vinf.variables.default(2)=1;
vinf.variables.name{3}='fc_pwr_scale';
vinf.variables.value(3)=1;
vinf.variables.default(3)=1.3333;
vinf.variables.name{4}='fc_trq_scale';
vinf.variables.value(4)=1.5;
vinf.variables.default(4)=1;
