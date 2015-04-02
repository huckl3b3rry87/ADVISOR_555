% small_parallel_hwfet_in.m  ADVISOR 2003-00-r0116 input file created: 17-Mar-2014 00:27:43

global vinf 

vinf.name='small_parallel_hwfet_in';
vinf.drivetrain.name='parallel';
vinf.fuel_converter.name='FC_SI41_emis';
vinf.fuel_converter.ver='ic';
vinf.fuel_converter.type='si';
vinf.torque_coupling.name='TC_DUMMY';
vinf.motor_controller.name='MC_PM58';
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
vinf.variables.value(5)=0.84267;
vinf.variables.default(5)=1;
vinf.variables.name{6}='fc_spd_scale';
vinf.variables.value(6)=1;
vinf.variables.default(6)=1;
vinf.variables.name{7}='ess_module_num';
vinf.variables.value(7)=18.6667;
vinf.variables.default(7)=25;
vinf.variables.name{8}='mc_trq_scale';
vinf.variables.value(8)=0.45884;
vinf.variables.default(8)=1;
vinf.variables.name{9}='mc_spd_scale';
vinf.variables.value(9)=1;
vinf.variables.default(9)=1;
vinf.variables.name{10}='fd_ratio';
vinf.variables.value(10)=0.74406;
vinf.variables.default(10)=1;
vinf.variables.name{11}='cs_charge_trq';
vinf.variables.value(11)=21.0583;
vinf.variables.default(11)=15.25;
vinf.variables.name{12}='cs_min_trq_frac';
vinf.variables.value(12)=0.70556;
vinf.variables.default(12)=0.4;
vinf.variables.name{13}='cs_off_trq_frac';
vinf.variables.value(13)=0.34444;
vinf.variables.default(13)=0;
vinf.variables.name{14}='cs_electric_launch_spd_lo';
vinf.variables.value(14)=7.5;
vinf.variables.default(14)=0;
vinf.variables.name{15}='cs_electric_launch_spd_hi';
vinf.variables.value(15)=26.6667;
vinf.variables.default(15)=0;
vinf.variables.name{16}='cs_charge_deplete_bool';
vinf.variables.value(16)=0.16667;
vinf.variables.default(16)=0;
vinf.variables.name{17}='ess_cap_scale';
vinf.variables.value(17)=1.4444;
vinf.variables.default(17)=1;
vinf.variables.name{18}='fc_pwr_scale';
vinf.variables.value(18)=0.84267;
vinf.variables.default(18)=1.264;
