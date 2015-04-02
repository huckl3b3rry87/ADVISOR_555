% small_electric_hwfet_in.m  ADVISOR 2003-00-r0116 input file created: 30-Mar-2015 18:04:35

global vinf 

vinf.name='small_electric_hwfet_in';
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
vinf.variables.name{1}='veh_cargo_mass';
vinf.variables.value(1)=100;
vinf.variables.default(1)=280;
vinf.variables.name{2}='veh_glider_mass';
vinf.variables.value(2)=756;
vinf.variables.default(2)=396;
vinf.variables.name{3}='veh_FA';
vinf.variables.value(3)=1.8;
vinf.variables.default(3)=1.7;
vinf.variables.name{4}='veh_CD';
vinf.variables.value(4)=0.22;
vinf.variables.default(4)=0.18;
vinf.variables.name{5}='ess_module_num';
vinf.variables.value(5)=44;
vinf.variables.default(5)=25;
vinf.variables.name{6}='fd_ratio';
vinf.variables.value(6)=1.0476;
vinf.variables.default(6)=1;
vinf.variables.name{7}='ess_cap_scale';
vinf.variables.value(7)=1.3333;
vinf.variables.default(7)=1;
