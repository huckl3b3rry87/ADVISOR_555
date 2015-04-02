% SERIES_defaults_in.m  ADVISOR 3.0 rev a  input file created: 21-Dec-2000 15:04:55

global vinf 

vinf.name='SERIES_defaults_in';
vinf.drivetrain.name='series';
vinf.fuel_converter.name='FC_SI41_emis';
vinf.fuel_converter.ver='ic';
vinf.fuel_converter.type='si';
vinf.generator.name='GC_ETA95';
vinf.generator.ver='reg';
vinf.generator.type='reg';
vinf.motor_controller.name='MC_AC75';
vinf.energy_storage.name='ESS_PB25';
vinf.energy_storage.ver='rint';
vinf.energy_storage.type='pb';
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
vinf.variables.name{1}='gc_trq_scale';
vinf.variables.value(1)=0.51157;
vinf.variables.default(1)=1;
