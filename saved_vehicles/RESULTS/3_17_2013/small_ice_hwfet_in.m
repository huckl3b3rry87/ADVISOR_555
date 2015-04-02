% small_ice_hwfet_in.m  ADVISOR 2003-00-r0116 input file created: 17-Mar-2014 17:04:13

global vinf 

vinf.name='small_ice_hwfet_in';
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
vinf.variables.name{1}='veh_cargo_mass';
vinf.variables.value(1)=100;
vinf.variables.default(1)=136;
vinf.variables.name{2}='veh_glider_mass';
vinf.variables.value(2)=756;
vinf.variables.default(2)=592.4218;
vinf.variables.name{3}='veh_FA';
vinf.variables.value(3)=1.8;
vinf.variables.default(3)=2;
vinf.variables.name{4}='veh_CD';
vinf.variables.value(4)=0.22;
vinf.variables.default(4)=0.335;
vinf.variables.name{5}='fc_trq_scale';
vinf.variables.value(5)=3.198;
vinf.variables.default(5)=1;
vinf.variables.name{6}='fd_ratio';
vinf.variables.value(6)=0.74406;
vinf.variables.default(6)=1;
vinf.variables.name{7}='fc_pwr_scale';
vinf.variables.value(7)=2.132;
vinf.variables.default(7)=1.066;
vinf.variables.name{8}='fc_spd_scale';
vinf.variables.value(8)=0.95062;
vinf.variables.default(8)=1;
