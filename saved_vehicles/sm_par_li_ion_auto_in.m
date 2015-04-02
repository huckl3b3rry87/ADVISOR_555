% small_parallel_Li_ion_autosized_2_20_14_in.m  ADVISOR 2003-00-r0116 input file created: 20-Feb-2014 21:25:08

global vinf 

vinf.name='small_parallel_Li_ion_autosized_2_20_14_in';
vinf.drivetrain.name='parallel';
vinf.fuel_converter.name='FC_SI41_emis';
vinf.fuel_converter.ver='ic';
vinf.fuel_converter.type='si';
vinf.torque_coupling.name='TC_DUMMY';
vinf.motor_controller.name='MC_AC75';
vinf.energy_storage.name='ESS_LI7_temp';
vinf.energy_storage.ver='rint';
vinf.energy_storage.type='li';
vinf.transmission.name='TX_5SPD';
vinf.transmission.ver='man';
vinf.transmission.type='man';
vinf.wheel_axle.name='WH_SMCAR';
vinf.wheel_axle.ver='Crr';
vinf.wheel_axle.type='Crr';
vinf.vehicle.name='VEH_SMCAR';
vinf.exhaust_aftertreat.name='EX_SI';
vinf.powertrain_control.name='PTC_PAR';
vinf.powertrain_control.ver='par';
vinf.powertrain_control.type='man';
vinf.accessory.name='ACC_HYBRID';
vinf.accessory.ver='Const';
vinf.accessory.type='Const';
vinf.variables.name{1}='fc_trq_scale';
vinf.variables.value(1)=0.697;
vinf.variables.default(1)=1;
vinf.variables.name{2}='mc_trq_scale';
vinf.variables.value(2)=0.56276;
vinf.variables.default(2)=1;
vinf.variables.name{3}='fd_ratio';
vinf.variables.value(3)=1.3393;
vinf.variables.default(3)=1;
vinf.variables.name{4}='veh_mass';
vinf.variables.value(4)=1054;
vinf.variables.default(4)=1055;
vinf.variables.name{5}='ess_module_num';
vinf.variables.value(5)=23;
vinf.variables.default(5)=0;
