% FCell_FCX_r3_in.m  ADVISOR 2003  input file created: 07-Apr-2003 17:55:25

global vinf 

vinf.name='FCell_FCX_r3_in';
vinf.drivetrain.name='fuel_cell';
vinf.fuel_converter.name='FC_ANL50H2';
vinf.fuel_converter.ver='fcell';
vinf.fuel_converter.type='net';
vinf.motor_controller.name='MC_PM49';
vinf.energy_storage.name='ESS_UC2_Maxwell';
vinf.energy_storage.ver='rc';
vinf.energy_storage.type='cap';
vinf.transmission.name='TX_1SPD';
vinf.transmission.ver='man';
vinf.transmission.type='man';
vinf.wheel_axle.name='WH_P205_60R16_MED_RR';
vinf.wheel_axle.ver='J2452';
vinf.wheel_axle.type='J2452';
vinf.vehicle.name='VEH_EVPlus';
vinf.exhaust_aftertreat.name='EX_FUELCELL_NULL';
vinf.powertrain_control.name='PTC_FUELCELL';
vinf.powertrain_control.ver='fc';
vinf.powertrain_control.type='man';
vinf.accessory.name='ACC_HYBRID';
vinf.accessory.ver='Const';
vinf.accessory.type='Const';
vinf.variables.name{1}='ess_module_num';
vinf.variables.value(1)=150;
vinf.variables.default(1)=0;
vinf.variables.name{2}='wh_1st_rrc';
vinf.variables.value(2)=0.012;
vinf.variables.default(2)=0.009;
vinf.variables.name{3}='ess_parallel_mod_num';
vinf.variables.value(3)=2;
vinf.variables.default(3)=1;
vinf.variables.name{4}='fc_pwr_scale';
vinf.variables.value(4)=1.56;
vinf.variables.default(4)=1;
vinf.variables.name{5}='fc_trq_scale';
vinf.variables.value(5)=1.56;
vinf.variables.default(5)=1;
vinf.variables.name{6}='fc_eff_scale';
vinf.variables.value(6)=0.91667;
vinf.variables.default(6)=1;
vinf.variables.name{7}='cs_max_pwr_fall_rate';
vinf.variables.value(7)=-40000;
vinf.variables.default(7)=-3000;
vinf.variables.name{8}='cs_max_pwr_rise_rate';
vinf.variables.value(8)=40000;
vinf.variables.default(8)=2000;
vinf.variables.name{9}='mc_max_crrnt';
vinf.variables.value(9)=600;
vinf.variables.default(9)=400;
vinf.variables.name{10}='cs_min_pwr';
vinf.variables.value(10)=1000;
vinf.variables.default(10)=7500;
vinf.variables.name{11}='cs_charge_pwr';
vinf.variables.value(11)=8000;
vinf.variables.default(11)=1000;
vinf.variables.name{12}='cs_min_off_time';
vinf.variables.value(12)=0;
vinf.variables.default(12)=90;
vinf.variables.name{13}='cs_fc_on';
vinf.variables.value(13)=1;
vinf.variables.default(13)=0;
vinf.variables.name{14}='cs_hi_soc';
vinf.variables.value(14)=1;
vinf.variables.default(14)=0.8;
vinf.variables.name{15}='cs_lo_soc';
vinf.variables.value(15)=0.2;
vinf.variables.default(15)=0.4;
vinf.variables.name{16}='veh_mass';
vinf.variables.value(16)=1820;
vinf.variables.default(16)=1779;
vinf.variables.name{17}='mc_spd_scale';
vinf.variables.value(17)=1.25;
vinf.variables.default(17)=1;
vinf.variables.name{18}='veh_cg_height';
vinf.variables.value(18)=0.33;
vinf.variables.default(18)=0.4;
vinf.variables.name{19}='fd_ratio';
vinf.variables.value(19)=1.06;
vinf.variables.default(19)=1;
vinf.variables.name{20}='mc_overtrq_factor';
vinf.variables.value(20)=1.15;
vinf.variables.default(20)=1;
