% small_series_autosized_3_28_2014_in.m  ADVISOR 2003-00-r0116 input file created: 28-Mar-2014 23:55:46

global vinf 

vinf.name='small_series_autosized_3_28_2014_in';
vinf.drivetrain.name='series';
vinf.fuel_converter.name='FC_SI41_emis';
vinf.fuel_converter.ver='ic';
vinf.fuel_converter.type='si';
vinf.generator.name='GC_PM32';
vinf.generator.ver='reg';
vinf.generator.type='reg';
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
vinf.exhaust_aftertreat.name='EX_SI';
vinf.powertrain_control.name='PTC_SER';
vinf.powertrain_control.ver='ser';
vinf.powertrain_control.type='man';
vinf.accessory.name='ACC_HYBRID';
vinf.accessory.ver='Const';
vinf.accessory.type='Const';
vinf.variables.name{1}='fc_trq_scale';
vinf.variables.value(1)=1.058;
vinf.variables.default(1)=1;
vinf.variables.name{2}='gc_trq_scale';
vinf.variables.value(2)=1.578;
vinf.variables.default(2)=1;
vinf.variables.name{3}='gc_spd_scale';
vinf.variables.value(3)=0.857;
vinf.variables.default(3)=1;
vinf.variables.name{4}='mc_trq_scale';
vinf.variables.value(4)=1.159;
vinf.variables.default(4)=1;
vinf.variables.name{5}='ess_module_num';
vinf.variables.value(5)=31;
vinf.variables.default(5)=0;
vinf.variables.name{6}='fd_ratio';
vinf.variables.value(6)=1.0476;
vinf.variables.default(6)=1;
