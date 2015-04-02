% ADVISOR Data file:  FC_CI_CONSTANT.M
%
% Data source: Generated based on FC_CI60_emis  
%
% Data confidence level: Fictitious Data
%
% Notes: This file is provided to let the user to do simplified analysis
% of a CI engine with constant efficiency and constant emissions throughout the 
% range of operation.
%
% Created on:  1/26/01
% By:  Tony Markel, National Renewable Energy Laboratory, Tony_Markel@nrel.gov
%
% Revision history at end of file.
%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% FILE ID INFO
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fc_description='Constant CI Engine Data'; 
fc_version=2003; % version of ADVISOR for which the file was generated
fc_proprietary=0; % 0=> non-proprietary, 1=> proprietary, do not distribute
fc_validation=0; % 1=> no validation, 1=> data agrees with source data, 
% 2=> data matches source data and data collection methods have been verified
fc_fuel_type='Diesel';
fc_disp=1.7;  % (L), engine displacement
fc_emis=1;      % boolean 0=no emis data; 1=emis data
fc_cold=0;      % boolean 0=no cold data; 1=cold data exists
disp(['Data loaded: FC_CI_CONSTANT.M - ',fc_description]);

% diesel default multipliers
fuel_gpkWh=250;
co_gpkWh=2; 
hc_gpkWh=0.25; 
nox_gpkWh=5.0;
pm_gpkWh=0.2;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% SPEED & TORQUE RANGES over which data is defined
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% (rad/s), speed range of the engine (converted from RPM)
fc_map_spd=[1200:100:4200]*pi/30;

% (N*m), torque range of the engine (converted from ft-lbf)
fc_map_trq=[0:5:135]*(1/(3.281*0.224809)); 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% FUEL USE AND EMISSIONS MAPS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% (g/s) , fuel use map indexed vertically by fc_map_spd and 
% horizontally by fc_map_trq
% (g/s), fuel use map indexed vertically by fc_map_spd and 
% horizontally by fc_map_trq
fc_fuel_map_gpkWh=ones(length(fc_map_spd),length(fc_map_trq))*fuel_gpkWh;
% fuel map in g/kWh 

% (g/s), engine out HC emissions indexed vertically by fc_map_spd and
% horizontally by fc_map_trq
fc_hc_map_gpkWh =ones(length(fc_map_spd),length(fc_map_trq))*hc_gpkWh;
% engine out HC in g/kWh

% (g/s), engine out CO emissions indexed vertically by fc_map_spd and
% horizontally by fc_map_trq
fc_co_map_gpkWh =ones(length(fc_map_spd),length(fc_map_trq))*co_gpkWh;
% engine out CO in g/kWh

% (g/s), engine out NOx emissions indexed vertically by fc_map_spd and
% horizontally by fc_map_trq
fc_nox_map_gpkWh =ones(length(fc_map_spd),length(fc_map_trq))*nox_gpkWh;
% engine out NOx in g/kWh

% (g/s), engine out PM emissions indexed vertically by fc_map_spd and
% horizontally by fc_map_trq
fc_pm_map_gpkWh=ones(length(fc_map_spd),length(fc_map_trq))*pm_gpkWh;

% (C), engine exhaust gas temperature indexed vertically by fc_map_spd and
% horizontally by fc_map_trq
fc_extmp_map=[116.4	122.3	128.2	128.7	129.2	132.9	136.7	137.0	137.4	143.2	149.1	152.0	154.9	183.1	211.4	213.3	215.3	217.2	219.2	224.3	229.4	228.1	226.7	229.3	231.8	225.2	218.6	221.6	224.6	226.3	227.9
134.0	139.8	145.4	145.9	149.1	152.9	155.6	155.9	156.8	161.9	167.7	170.6	173.2	201.5	211.4	210.0	212.0	213.9	219.2	224.3	229.4	228.1	226.7	229.3	231.8	225.2	218.6	221.6	224.6	226.3	227.9
151.8	157.2	162.5	165.8	169.1	172.1	174.5	175.2	176.2	181.1	186.4	189.1	191.6	207.6	211.4	209.1	208.6	213.0	219.2	224.3	229.4	228.1	226.7	229.3	231.8	225.2	220.8	223.9	227.2	230.8	234.5
170.3	176.5	184.1	186.8	187.8	190.2	193.8	194.8	195.6	199.9	204.5	207.0	207.9	210.6	213.5	214.4	214.8	221.3	227.3	230.8	235.2	237.0	238.8	241.2	244.5	240.8	237.7	239.1	242.4	245.5	249.0
188.1	197.5	205.7	205.8	204.5	206.9	214.1	215.1	214.5	217.3	221.9	224.5	220.2	222.9	227.1	231.6	232.0	238.4	243.6	247.1	254.0	256.4	258.2	260.0	262.5	258.5	254.7	256.1	257.6	261.3	265.1
205.4	213.4	220.9	221.9	221.2	227.1	234.3	234.2	233.4	236.1	239.4	237.0	232.5	236.3	240.8	245.6	249.1	254.7	259.9	265.8	272.9	275.2	276.9	277.1	277.4	274.9	270.7	272.3	273.7	280.7	284.5
217.8	225.9	233.5	234.3	234.1	242.1	249.5	247.3	245.9	248.4	249.9	245.8	242.8	247.8	252.2	257.7	262.3	269.0	274.4	280.9	286.3	288.4	289.6	289.8	290.1	290.6	286.4	288.4	289.8	299.8	304.0
229.5	237.5	245.5	244.7	244.4	252.2	258.6	255.0	253.4	255.6	255.8	251.9	251.2	257.2	261.7	268.6	273.3	281.4	287.3	293.3	297.6	301.1	302.3	302.5	302.8	304.2	302.1	304.2	305.9	315.9	323.5
241.6	249.1	257.0	255.8	254.8	261.3	267.8	264.1	260.9	261.5	261.7	260.3	259.7	266.7	271.1	279.6	284.2	292.4	300.2	304.7	309.0	313.2	314.9	315.2	315.4	316.9	317.9	319.9	321.9	331.5	341.3
253.6	261.2	266.7	266.4	264.8	265.6	272.0	268.6	270.9	271.0	268.9	268.8	268.1	275.4	280.6	289.3	295.2	303.3	310.5	317.5	320.3	324.6	327.6	327.9	327.6	329.5	330.9	334.9	336.9	344.3	354.0
265.7	270.7	273.2	275.7	274.7	272.1	275.5	275.2	281.6	280.6	276.5	276.9	276.5	283.8	290.0	298.7	306.2	313.8	320.4	329.2	335.0	337.8	340.1	338.6	337.3	342.1	343.5	349.9	351.8	357.7	366.8
278.9	281.4	282.5	283.6	284.7	282.1	279.5	285.9	292.2	288.2	284.1	284.5	284.9	292.2	299.4	308.2	316.9	323.7	330.3	339.4	348.3	349.3	350.6	348.3	346.9	353.6	356.2	362.6	366.8	372.7	379.6
293.1	297.3	299.3	300.0	296.1	292.6	290.0	296.4	298.7	294.6	292.2	296.2	296.7	303.9	311.2	317.6	326.3	333.9	340.6	350.5	359.4	359.8	361.1	358.3	356.5	363.2	368.8	375.3	381.8	387.3	392.9
307.3	311.5	315.6	311.4	307.6	303.1	300.5	306.9	305.1	301.1	300.3	308.0	308.5	315.8	323.0	327.0	335.7	344.2	350.8	361.6	370.5	370.5	371.6	368.8	366.2	373.2	380.3	386.6	392.8	401.0	406.5
321.6	325.2	328.8	322.8	319.0	313.9	311.0	315.8	311.5	307.9	308.4	319.2	320.4	327.6	334.9	337.1	345.1	354.1	361.1	372.2	381.6	381.6	382.0	379.4	377.8	384.0	391.1	397.7	403.9	413.8	420.1
337.2	338.4	342.0	334.9	330.4	325.4	321.5	322.3	318.0	316.0	316.6	327.3	332.2	339.5	346.7	349.0	354.5	363.5	371.3	382.5	392.7	392.7	392.6	391.2	389.6	395.0	401.9	408.5	414.9	424.8	433.8
352.9	352.9	355.2	348.2	341.8	336.8	332.0	328.7	324.4	324.1	324.7	335.5	344.1	351.3	358.6	360.8	363.9	372.9	381.6	392.7	403.8	403.6	403.4	403.1	401.5	406.8	412.7	419.3	426.5	438.1	449.5
368.6	368.6	368.5	361.7	352.9	346.9	341.7	337.0	331.1	331.8	330.6	339.9	350.7	357.8	365.1	367.1	368.4	378.2	387.1	401.1	411.8	412.0	413.2	414.0	413.3	418.6	425.2	433.5	441.6	455.1	466.4
376.9	383.2	382.8	376.0	363.7	356.2	351.0	346.4	338.2	338.9	333.9	339.7	350.6	357.7	365.2	369.1	370.3	381.7	390.5	409.1	419.9	419.0	420.1	421.3	426.8	433.2	439.8	448.6	456.7	471.1	483.3
376.9	397.5	397.1	389.6	374.5	365.6	360.4	355.7	345.4	346.0	337.2	339.6	350.5	357.6	365.4	371.0	372.3	385.1	394.0	416.0	427.9	427.0	427.0	431.1	441.8	447.9	454.5	463.4	471.9	486.2	500.3
376.9	402.6	411.4	400.4	385.2	376.3	369.8	363.0	352.5	350.1	340.5	341.9	350.4	357.7	365.6	371.4	374.2	387.1	397.4	419.4	435.9	435.0	436.2	446.1	456.8	462.8	469.1	478.0	485.8	494.7	503.6
376.9	402.6	425.7	411.2	396.0	387.1	379.2	370.1	359.6	353.4	343.8	345.2	350.2	357.8	365.7	371.6	376.2	389.1	400.9	422.9	443.9	448.5	455.5	462.6	471.8	477.8	477.9	481.8	485.8	494.7	503.6
376.9	402.6	428.3	416.4	406.6	397.2	388.2	377.5	366.5	356.7	347.1	348.5	350.1	358.0	365.9	373.0	381.0	394.0	406.9	429.8	453.3	461.0	468.7	476.4	479.1	478.5	477.9	481.8	485.8	494.7	503.6
376.9	402.6	428.3	416.4	416.1	405.6	396.6	385.8	372.1	362.3	352.5	356.9	358.4	367.6	375.4	384.9	392.8	406.2	419.1	439.6	463.1	470.7	478.4	486.1	479.1	478.5	477.9	481.8	485.8	494.7	503.6
376.9	402.6	428.3	416.4	425.7	414.0	404.9	394.2	377.7	367.9	358.2	365.6	367.1	377.8	385.6	396.7	404.6	418.4	431.3	449.4	472.9	480.4	488.1	487.8	479.1	478.5	477.9	481.8	485.8	494.7	503.6
376.9	402.6	428.3	422.2	435.2	423.0	413.3	401.2	383.3	373.5	363.8	373.7	375.8	387.7	395.8	407.9	416.5	430.4	443.5	461.4	482.7	490.3	496.5	487.8	479.1	478.5	477.9	481.8	485.8	494.7	503.6
376.9	402.6	428.3	431.7	444.8	432.5	421.6	406.8	388.8	379.1	369.4	379.3	384.5	396.4	406.0	418.1	428.3	442.2	455.7	473.6	492.5	496.8	496.5	487.8	479.1	478.5	477.9	481.8	485.8	494.7	503.6
376.9	402.6	428.3	441.3	454.3	442.1	430.0	412.3	394.4	384.7	375.1	384.9	393.2	405.1	416.2	428.3	440.2	454.0	467.9	482.9	497.1	496.8	496.5	487.8	479.1	478.5	477.9	481.8	485.8	494.7	503.6
]'; % in deg. C

% (g/s), engine out total exhaust flow indexed vertically by fc_map_spd and
% horizontally by fc_map_trq
fc_exflow_map=[11.99	12.26	12.54	14.07	15.60	17.24	18.88	20.57	22.26	22.97	23.68	25.04	26.41	31.04	35.68	38.56	41.44	44.32	47.21	51.18	55.15	56.34	57.52	61.23	64.94	67.63	70.33	73.59	76.84	78.88	80.92
12.04	12.36	12.87	14.40	15.86	17.50	19.25	20.95	22.72	23.85	24.55	25.92	27.60	32.23	35.68	38.66	41.54	44.43	47.21	51.18	55.15	56.34	57.52	61.23	64.94	67.63	70.33	73.59	76.84	78.88	80.92
12.19	12.70	13.21	14.66	16.12	17.84	19.63	21.38	23.19	24.42	25.43	27.02	28.79	32.63	35.68	38.69	41.64	44.45	47.21	51.18	55.15	56.34	57.52	61.23	64.94	67.63	70.38	73.63	76.90	78.93	80.99
12.59	13.05	13.44	14.90	16.97	18.74	20.16	21.94	23.79	25.24	26.62	28.37	30.86	33.56	36.14	39.30	42.62	45.41	48.45	52.19	55.68	57.09	58.54	61.82	65.57	68.04	70.83	73.95	77.21	79.12	81.14
13.31	13.38	13.66	16.01	18.84	20.60	20.99	22.78	25.02	26.84	28.22	29.96	34.70	37.40	39.16	41.28	44.60	47.43	50.96	54.69	57.40	58.75	60.17	63.16	66.47	68.83	71.27	74.40	77.53	79.43	81.33
14.26	14.63	15.12	17.89	20.71	21.47	21.83	23.93	26.24	28.10	29.81	33.72	38.54	40.57	42.18	44.20	46.59	49.93	53.47	56.47	59.12	60.47	61.76	64.60	67.46	69.74	72.11	75.11	78.25	79.69	81.59
15.69	16.51	17.10	19.84	22.37	22.68	23.31	26.01	28.41	30.30	32.62	37.45	41.67	43.10	44.70	46.61	48.58	51.71	55.31	57.91	60.23	61.73	62.98	65.67	68.52	70.65	73.02	75.84	78.98	80.00	81.85
17.13	17.93	18.67	21.37	23.91	24.32	25.55	28.84	31.32	33.34	36.26	40.96	44.07	45.19	46.78	48.61	50.57	53.17	56.59	59.07	61.11	62.94	64.20	66.75	69.59	71.67	73.92	76.74	79.72	80.73	82.11
17.49	18.98	19.91	22.70	25.44	26.57	27.79	31.09	34.23	36.99	39.90	43.36	46.48	47.28	48.87	50.60	52.57	55.16	57.86	59.95	61.99	64.02	65.41	67.97	70.65	72.73	74.83	77.65	80.50	81.67	82.81
17.85	19.34	21.12	23.66	26.33	28.78	30.01	33.30	36.02	38.99	42.33	45.76	48.88	49.60	50.96	52.67	54.56	57.16	59.15	61.35	62.87	64.90	66.63	69.19	71.86	73.96	76.16	79.33	82.21	83.71	84.85
18.20	20.06	22.28	24.51	27.11	30.33	32.22	35.20	37.48	40.64	44.30	48.01	51.28	52.00	53.05	54.76	56.56	58.81	60.44	62.96	64.97	66.46	67.90	70.84	73.77	75.35	77.54	81.04	83.92	85.65	86.89
18.43	20.72	23.11	25.51	27.90	31.11	34.33	36.63	38.94	42.61	46.26	49.98	53.68	54.40	55.14	56.83	58.49	60.13	61.76	64.36	66.94	68.26	69.59	72.75	75.67	76.95	78.93	82.45	85.64	87.36	88.93
18.53	20.71	23.03	25.47	28.32	31.80	35.02	37.32	40.11	43.80	47.53	50.84	54.54	55.48	56.21	58.31	59.98	61.69	63.32	66.07	68.65	69.95	71.28	74.55	77.58	78.86	80.32	83.83	87.35	88.98	90.62
18.64	20.81	23.03	25.89	28.74	32.49	35.71	38.01	41.28	44.96	48.74	51.64	55.34	56.51	57.24	59.79	61.46	63.25	64.88	67.78	70.36	71.65	72.98	76.24	79.49	80.87	82.27	85.94	89.61	90.38	92.02
18.75	21.06	23.39	26.31	29.16	33.08	36.40	38.89	42.45	46.14	49.96	52.52	56.14	57.49	58.26	61.13	62.94	64.78	66.44	69.41	72.07	73.36	74.67	77.97	81.61	83.13	84.53	88.21	91.88	92.05	93.41
18.94	21.43	23.76	26.71	29.58	33.50	37.09	40.05	43.61	47.36	51.17	53.74	56.95	58.29	59.29	62.16	64.42	66.26	68.00	70.97	73.78	75.07	76.68	80.10	83.74	85.37	86.80	90.47	94.14	94.32	94.81
19.14	21.71	24.12	27.07	30.00	33.92	37.78	41.22	44.78	48.57	52.39	54.95	57.75	59.09	60.32	63.19	65.91	67.75	69.56	72.53	75.49	77.68	79.88	82.23	85.87	87.50	89.06	92.74	96.34	96.44	96.52
19.33	21.90	24.48	27.44	30.56	34.55	38.50	42.11	45.77	49.60	53.68	56.45	59.01	60.36	61.91	64.97	67.98	70.05	71.91	74.52	77.55	79.90	82.68	85.29	87.99	89.63	91.01	94.57	98.05	98.33	98.41
19.43	22.25	24.88	27.84	31.21	35.28	39.23	42.84	46.60	50.43	55.05	58.30	60.86	62.21	64.17	67.34	70.35	72.72	74.59	76.58	79.62	81.56	84.30	87.08	89.94	91.19	92.56	96.29	99.77	100.14	100.30
19.43	22.65	25.28	28.29	31.87	36.00	39.95	43.57	47.43	51.25	56.43	60.15	62.71	64.06	66.43	69.70	72.72	75.40	77.27	78.80	81.69	83.63	85.93	88.76	91.71	92.74	94.12	97.88	101.49	101.86	102.19
19.43	22.79	25.67	28.94	32.52	36.66	40.68	44.39	48.25	52.50	57.80	61.67	64.56	66.20	68.69	71.98	75.09	77.78	79.94	81.48	83.75	85.69	87.72	90.53	93.49	94.51	95.67	99.43	103.07	102.82	102.56
19.43	22.79	26.07	29.60	33.18	37.32	41.41	45.21	49.08	53.88	59.18	63.04	66.41	68.47	70.95	74.24	77.45	80.15	82.62	84.15	85.82	88.00	90.29	92.58	95.26	96.29	96.60	99.84	103.07	102.82	102.56
19.43	22.79	26.14	29.92	33.84	38.00	42.15	46.02	49.91	55.25	60.56	64.42	68.26	70.73	73.21	76.34	79.35	81.89	84.57	85.96	87.11	89.26	91.67	94.09	96.13	96.37	96.60	99.84	103.07	102.82	102.56
19.43	22.79	26.14	29.92	34.54	38.76	42.90	46.78	50.81	56.15	61.46	64.93	68.78	71.02	73.54	77.06	80.08	82.13	84.80	87.04	88.18	89.99	92.41	94.82	96.13	96.37	96.60	99.84	103.07	102.82	102.56
19.43	22.79	26.14	29.92	35.24	39.51	43.66	47.54	51.71	57.05	62.32	65.38	69.23	71.20	73.71	77.79	80.80	82.36	85.04	88.11	89.26	91.05	93.14	94.96	96.13	96.37	96.60	99.84	103.07	102.82	102.56
19.43	22.79	26.14	30.34	35.94	40.24	44.42	48.36	52.61	57.94	63.18	65.91	69.68	71.43	73.88	78.29	81.52	82.89	85.27	88.42	90.33	92.12	93.78	94.96	96.13	96.37	96.60	99.84	103.07	102.82	102.56
19.43	22.79	26.14	31.04	36.64	40.94	45.17	49.26	53.51	58.80	64.04	66.77	70.13	71.88	74.06	78.47	82.25	83.62	85.51	88.65	91.41	92.84	93.78	94.96	96.13	96.37	96.60	99.84	103.07	102.82	102.56
19.43	22.79	26.14	31.74	37.34	41.64	45.93	50.16	54.40	59.66	64.90	67.63	70.58	72.33	74.23	78.64	82.97	84.34	85.75	88.83	91.90	92.84	93.78	94.96	96.13	96.37	96.60	99.84	103.07	102.82	102.56
]';

% (m^3/s), engine out total volume exhaust flow indexed vertically by fc_map_spd and
% horizontally by fc_map_trq
fc_exflow_vol_map=[0.0133	0.0138	0.0143	0.0161	0.0178	0.0199	0.0220	0.0240	0.0260	0.0272	0.0284	0.0303	0.0321	0.0406	0.0490	0.0533	0.0575	0.0617	0.0660	0.0723	0.0786	0.0802	0.0817	0.0874	0.0931	0.0957	0.0983	0.1035	0.1087	0.1119	0.1152
0.0139	0.0145	0.0153	0.0171	0.0190	0.0211	0.0235	0.0255	0.0278	0.0296	0.0308	0.0326	0.0350	0.0435	0.0490	0.0530	0.0572	0.0615	0.0660	0.0723	0.0786	0.0802	0.0817	0.0874	0.0931	0.0957	0.0983	0.1035	0.1087	0.1119	0.1152
0.0147	0.0155	0.0163	0.0183	0.0202	0.0225	0.0249	0.0272	0.0296	0.0315	0.0332	0.0354	0.0380	0.0445	0.0490	0.0529	0.0569	0.0614	0.0660	0.0723	0.0786	0.0802	0.0817	0.0874	0.0931	0.0957	0.0988	0.1040	0.1093	0.1130	0.1168
0.0158	0.0166	0.0174	0.0194	0.0222	0.0246	0.0267	0.0291	0.0316	0.0339	0.0361	0.0386	0.0421	0.0461	0.0499	0.0544	0.0591	0.0638	0.0690	0.0747	0.0804	0.0828	0.0851	0.0904	0.0964	0.0993	0.1027	0.1077	0.1130	0.1165	0.1203
0.0173	0.0178	0.0185	0.0217	0.0256	0.0280	0.0291	0.0314	0.0346	0.0375	0.0397	0.0422	0.0487	0.0527	0.0557	0.0594	0.0640	0.0688	0.0749	0.0807	0.0859	0.0884	0.0908	0.0957	0.1010	0.1038	0.1067	0.1117	0.1167	0.1204	0.1242
0.0192	0.0201	0.0212	0.0251	0.0290	0.0304	0.0314	0.0343	0.0376	0.0406	0.0433	0.0487	0.0553	0.0586	0.0615	0.0651	0.0690	0.0748	0.0809	0.0863	0.0915	0.0940	0.0963	0.1008	0.1053	0.1084	0.1113	0.1163	0.1213	0.1252	0.1290
0.0217	0.0233	0.0245	0.0284	0.0321	0.0330	0.0345	0.0383	0.0417	0.0447	0.0484	0.0550	0.0610	0.0637	0.0666	0.0703	0.0738	0.0796	0.0859	0.0909	0.0955	0.0983	0.1006	0.1049	0.1095	0.1131	0.1159	0.1210	0.1260	0.1301	0.1338
0.0242	0.0258	0.0274	0.0313	0.0349	0.0361	0.0385	0.0432	0.0466	0.0499	0.0544	0.0609	0.0657	0.0683	0.0711	0.0750	0.0785	0.0838	0.0899	0.0948	0.0989	0.1026	0.1048	0.1091	0.1136	0.1173	0.1205	0.1257	0.1307	0.1348	0.1387
0.0253	0.0280	0.0298	0.0339	0.0378	0.0401	0.0425	0.0472	0.0516	0.0559	0.0604	0.0656	0.0704	0.0728	0.0757	0.0798	0.0833	0.0886	0.0939	0.0982	0.1023	0.1065	0.1091	0.1134	0.1177	0.1215	0.1252	0.1303	0.1355	0.1397	0.1440
0.0264	0.0291	0.0322	0.0360	0.0399	0.0438	0.0463	0.0509	0.0553	0.0599	0.0650	0.0703	0.0751	0.0774	0.0802	0.0843	0.0880	0.0933	0.0977	0.1027	0.1058	0.1099	0.1133	0.1176	0.1221	0.1261	0.1302	0.1367	0.1420	0.1464	0.1507
0.0275	0.0307	0.0343	0.0379	0.0418	0.0467	0.0500	0.0545	0.0586	0.0635	0.0689	0.0748	0.0799	0.0822	0.0847	0.0888	0.0928	0.0976	0.1015	0.1073	0.1118	0.1148	0.1177	0.1226	0.1274	0.1313	0.1354	0.1432	0.1485	0.1531	0.1573
0.0285	0.0323	0.0361	0.0399	0.0437	0.0486	0.0536	0.0578	0.0620	0.0674	0.0729	0.0787	0.0846	0.0869	0.0892	0.0933	0.0975	0.1014	0.1053	0.1115	0.1175	0.1201	0.1228	0.1279	0.1327	0.1365	0.1405	0.1484	0.1549	0.1595	0.1640
0.0294	0.0333	0.0371	0.0409	0.0453	0.0508	0.0557	0.0599	0.0646	0.0701	0.0760	0.0819	0.0878	0.0906	0.0929	0.0975	0.1016	0.1060	0.1100	0.1168	0.1228	0.1253	0.1279	0.1331	0.1381	0.1418	0.1456	0.1535	0.1614	0.1659	0.1704
0.0303	0.0342	0.0381	0.0425	0.0469	0.0530	0.0579	0.0621	0.0673	0.0728	0.0791	0.0851	0.0909	0.0942	0.0965	0.1017	0.1058	0.1107	0.1146	0.1220	0.1281	0.1304	0.1330	0.1382	0.1434	0.1475	0.1518	0.1603	0.1685	0.1721	0.1766
0.0312	0.0354	0.0396	0.0441	0.0485	0.0549	0.0601	0.0645	0.0699	0.0755	0.0822	0.0882	0.0941	0.0978	0.1002	0.1057	0.1100	0.1151	0.1192	0.1270	0.1334	0.1357	0.1382	0.1434	0.1500	0.1544	0.1587	0.1674	0.1756	0.1786	0.1828
0.0324	0.0369	0.0410	0.0457	0.0502	0.0565	0.0622	0.0671	0.0726	0.0786	0.0853	0.0913	0.0972	0.1009	0.1038	0.1093	0.1141	0.1193	0.1238	0.1316	0.1387	0.1410	0.1440	0.1502	0.1567	0.1612	0.1655	0.1742	0.1827	0.1857	0.1889
0.0335	0.0382	0.0425	0.0472	0.0518	0.0582	0.0644	0.0698	0.0752	0.0817	0.0884	0.0944	0.1004	0.1041	0.1075	0.1130	0.1183	0.1234	0.1284	0.1362	0.1439	0.1482	0.1524	0.1569	0.1634	0.1679	0.1723	0.1810	0.1899	0.1933	0.1966
0.0346	0.0393	0.0440	0.0487	0.0537	0.0602	0.0667	0.0722	0.0777	0.0845	0.0914	0.0976	0.1036	0.1072	0.1113	0.1172	0.1228	0.1287	0.1338	0.1418	0.1498	0.1543	0.1599	0.1651	0.1701	0.1746	0.1792	0.1885	0.1976	0.2019	0.2052
0.0352	0.0409	0.0457	0.0504	0.0558	0.0625	0.0690	0.0745	0.0801	0.0868	0.0943	0.1008	0.1068	0.1104	0.1154	0.1219	0.1275	0.1344	0.1396	0.1477	0.1556	0.1592	0.1647	0.1703	0.1772	0.1815	0.1861	0.1962	0.2052	0.2100	0.2138
0.0352	0.0426	0.0474	0.0522	0.0580	0.0648	0.0713	0.0768	0.0825	0.0892	0.0972	0.1040	0.1100	0.1136	0.1195	0.1265	0.1322	0.1402	0.1453	0.1535	0.1614	0.1650	0.1695	0.1760	0.1847	0.1884	0.1930	0.2033	0.2129	0.2177	0.2223
0.0352	0.0432	0.0491	0.0544	0.0601	0.0670	0.0736	0.0791	0.0848	0.0920	0.1000	0.1069	0.1132	0.1175	0.1235	0.1307	0.1368	0.1449	0.1511	0.1592	0.1672	0.1708	0.1752	0.1834	0.1921	0.1958	0.1999	0.2102	0.2199	0.2220	0.2240
0.0352	0.0432	0.0508	0.0565	0.0622	0.0691	0.0759	0.0815	0.0872	0.0948	0.1029	0.1098	0.1164	0.1215	0.1276	0.1348	0.1415	0.1495	0.1568	0.1649	0.1731	0.1787	0.1852	0.1917	0.1995	0.2033	0.2041	0.2120	0.2199	0.2220	0.2240
0.0352	0.0432	0.0511	0.0575	0.0644	0.0713	0.0782	0.0839	0.0896	0.0977	0.1058	0.1127	0.1196	0.1256	0.1317	0.1389	0.1460	0.1538	0.1618	0.1701	0.1779	0.1844	0.1913	0.1982	0.2031	0.2036	0.2041	0.2120	0.2199	0.2220	0.2240
0.0352	0.0432	0.0511	0.0575	0.0667	0.0738	0.0807	0.0864	0.0920	0.1002	0.1083	0.1152	0.1221	0.1281	0.1342	0.1429	0.1500	0.1571	0.1651	0.1747	0.1826	0.1883	0.1953	0.2022	0.2031	0.2036	0.2041	0.2120	0.2199	0.2220	0.2240
0.0352	0.0432	0.0511	0.0575	0.0690	0.0762	0.0831	0.0888	0.0945	0.1026	0.1108	0.1176	0.1245	0.1305	0.1366	0.1469	0.1540	0.1604	0.1684	0.1793	0.1872	0.1929	0.1993	0.2029	0.2031	0.2036	0.2041	0.2120	0.2199	0.2220	0.2240
0.0352	0.0432	0.0511	0.0589	0.0713	0.0786	0.0856	0.0913	0.0969	0.1051	0.1133	0.1201	0.1270	0.1329	0.1390	0.1502	0.1580	0.1641	0.1717	0.1827	0.1918	0.1976	0.2027	0.2029	0.2031	0.2036	0.2041	0.2120	0.2199	0.2220	0.2240
0.0352	0.0432	0.0511	0.0612	0.0736	0.0809	0.0880	0.0937	0.0994	0.1076	0.1158	0.1226	0.1295	0.1354	0.1414	0.1526	0.1620	0.1681	0.1750	0.1860	0.1964	0.2006	0.2027	0.2029	0.2031	0.2036	0.2041	0.2120	0.2199	0.2220	0.2240
0.0352	0.0432	0.0511	0.0635	0.0759	0.0832	0.0905	0.0962	0.1019	0.1101	0.1183	0.1251	0.1319	0.1378	0.1437	0.1550	0.1660	0.1721	0.1783	0.1885	0.1986	0.2006	0.2027	0.2029	0.2031	0.2036	0.2041	0.2120	0.2199	0.2220	0.2240
]';

% adjust ex gas temperature map to estimate temperature drop across manifold & turbo 
%  assume delta T is equal to 10% of the temp diff between gas temp and 20 C ambient
fc_extmp_map=fc_extmp_map + (fc_extmp_map - 20)*0.1;

% convert g/kWh maps to g/s maps
[T,w]=meshgrid(fc_map_trq, fc_map_spd);
fc_map_kW=T.*w/1000;
fc_fuel_map=fc_fuel_map_gpkWh.*fc_map_kW/3600;
fc_hc_map=fc_hc_map_gpkWh.*fc_map_kW/3600;
fc_co_map=fc_co_map_gpkWh.*fc_map_kW/3600;
fc_nox_map=fc_nox_map_gpkWh.*fc_map_kW/3600;
fc_pm_map=fc_pm_map_gpkWh.*fc_map_kW/3600;

% (g/s), engine out O2 indexed vertically by fc_map_spd and
% horizontally by fc_map_trq
fc_o2_map=zeros(size(fc_fuel_map));

if 0
% create BS** maps for plotting purposes
[T,w]=meshgrid(fc_map_trq(2:end),fc_map_spd);
fc_map_kW=T.*w/1000;
fc_fuel_map_gpkWh=fc_fuel_map(:,2:end)./fc_map_kW*3600;
fc_co_map_gpkWh=fc_co_map(:,2:end)./fc_map_kW*3600;
fc_hc_map_gpkWh=fc_hc_map(:,2:end)./fc_map_kW*3600;
fc_nox_map_gpkWh=fc_nox_map(:,2:end)./fc_map_kW*3600;
fc_pm_map_gpkWh=fc_pm_map(:,2:end)./fc_map_kW*3600;

% replace zero torque column values
fc_fuel_map_gpkWh=[fc_fuel_map_gpkWh(:,1)*1.1 fc_fuel_map_gpkWh];
fc_co_map_gpkWh=[fc_co_map_gpkWh(:,1)*1.1 fc_co_map_gpkWh];
fc_nox_map_gpkWh=[fc_nox_map_gpkWh(:,1)*1.1 fc_nox_map_gpkWh];
fc_hc_map_gpkWh=[fc_hc_map_gpkWh(:,1)*1.1 fc_hc_map_gpkWh];
fc_pm_map_gpkWh=[fc_pm_map_gpkWh(:,1)*1.1 fc_pm_map_gpkWh];
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Cold Engine Maps
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fc_cold_tmp=20; %deg C
fc_fuel_map_cold=zeros(size(fc_fuel_map));
fc_hc_map_cold=zeros(size(fc_fuel_map));
fc_co_map_cold=zeros(size(fc_fuel_map));
fc_nox_map_cold=zeros(size(fc_fuel_map));
fc_pm_map_cold=zeros(size(fc_fuel_map));
%Process Cold Maps to generate Correction Factor Maps
names={'fc_fuel_map','fc_hc_map','fc_co_map','fc_nox_map','fc_pm_map'};
for i=1:length(names)
    %cold to hot raio, e.g. fc_fuel_map_c2h = fc_fuel_map_cold ./ fc_fuel_map
    eval([names{i},'_c2h=',names{i},'_cold./(',names{i},'+eps);'])
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% LIMITS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% (N*m), max torque curve of the engine indexed by fc_map_spd 
temp_max_speed=[0 1200:200:4200]*pi/30;
temp_max_torque=[0 87.7 105.9 137.2 135.5 137.3 138.0 137.6 137.5 135.7 135.3 132.3 124.3 107.4 103.0 99.6 96.0]*(1/(3.281*0.224809));
fc_max_trq=interp1(temp_max_speed,temp_max_torque,fc_map_spd,'linear');%	N*m
clear temp_max_speed temp_max_torque

% (N*m), closed throttle torque of the engine (max torque that can be absorbed)
% indexed by fc_map_spd -- correlation from JDMA
fc_ct_trq=4.448/3.281*(-fc_disp)*61.02/24 * ...
   (9*(fc_map_spd/max(fc_map_spd)).^2 + 14 * (fc_map_spd/max(fc_map_spd)));


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% DEFAULT SCALING
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% (--), used to scale fc_map_spd to simulate a faster or slower running engine 
fc_spd_scale=1.0;
% (--), used to scale fc_map_trq to simulate a higher or lower torque engine
fc_trq_scale=1.0;
fc_pwr_scale=fc_spd_scale*fc_trq_scale;   % --  scale fc power


% user definable mass scaling function
fc_mass_scale_fun=inline('(x(1)*fc_trq_scale+x(2))*(x(3)*fc_spd_scale+x(4))*(fc_base_mass+fc_acc_mass)+fc_fuel_mass','x','fc_spd_scale','fc_trq_scale','fc_base_mass','fc_acc_mass','fc_fuel_mass');
fc_mass_scale_coef=[1 0 1 0]; % coefficients of mass scaling function


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% STUFF THAT SCALES WITH TRQ & SPD SCALES (MASS AND INERTIA)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fc_inertia=(1.9/(0.224809*12*3.28))*fc_pwr_scale;   % (kg*m^2), rotational inertia of the engine 
fc_max_pwr=(max(fc_map_spd.*fc_max_trq)/1000)*fc_pwr_scale; % kW     peak engine power

fc_base_mass=1.8*fc_max_pwr;            % (kg), mass of the engine block and head (base engine)
                                        %       assuming a mass penalty of 1.8 kg/kW from S. Sluder (ORNL) estimate of 300 lb 
fc_acc_mass=0.8*fc_max_pwr;             % kg    engine accy's, electrics, cntrl's - assumes mass penalty of 0.8 kg/kW (from 1994 OTA report, Table 3)
fc_fuel_mass=0.6*fc_max_pwr;            % kg    mass of fuel and fuel tank (from 1994 OTA report, Table 3)
fc_mass=fc_base_mass+fc_acc_mass+fc_fuel_mass; % kg  total engine/fuel system mass
fc_ext_sarea=0.3*(fc_max_pwr/100)^0.67;       % m^2    exterior surface area of engine


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% OTHER DATA
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fc_fuel_den=843;                        % (g/l), density of the fuel from Scott Sluder (ORNL, 1/19/99)
% fc_fuel_den=835;                      % (g/l), density of the fuel (from original TDI map from publication) 
% fc_fuel_den=850;                      % (g/l), density of fuel from handbook
fc_fuel_lhv=18456*2.205/0.9478;         % (J/g), =42937, lower heating value of the fuel from Scott Sluder (ORNL, 1/19/99)
% fc_fuel_lhv=43000;                    % (J/g), lower heating value of the fuel from handbook

%the following was added for the new thermal modeling of the engine 12/17/98 ss and sb
fc_tstat=99;                  % C      engine coolant thermostat set temperature (typically 95 +/- 5 C)
fc_cp=1000;                    % J/kgK  ave cp of engine (iron=500, Al or Mg = 1000)
fc_h_cp=500;                  % J/kgK  ave cp of hood & engine compartment (iron=500, Al or Mg = 1000)
fc_hood_sarea=1.5;            % m^2    surface area of hood/eng compt.
fc_emisv=0.8;                 %        eff emissivity of engine ext surface to hood int surface
fc_hood_emisv=0.9;            %        emissivity hood ext
fc_h_air_flow=0.0;            % kg/s   heater air flow rate (140 cfm=0.07)
fc_cl2h_eff=0.7;              % --     ave cabin heater HX eff (based on air side)
fc_c2i_th_cond=500;           % W/K    conductance btwn engine cyl & int
fc_i2x_th_cond=500;           % W/K    conductance btwn engine int & ext
fc_h2x_th_cond=10;            % W/K    conductance btwn engine & engine compartment

%the following variable is not used directly in modelling and should always be equal to one
%it's used for initialization purposes
fc_eff_scale=1;

% clean up workspace
clear fc_exflow_map_gpkWh fc_co2_map_gpkWh fc_map_kW T w

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% REVISION HISTORY
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 1/26/01:tm file created from fc_ci60_emis
% 01/31/01: vhj added fc_cold=0, added cold map variables, added +eps to avoid dividing by zero
% 02/26/01: vhj added variable definition of fc_o2_map (used in NOx absorber emis.)
% 07/30/01: mpo moved definition of fc_o2_map down in file until after fc_fuel_map is defined
% 7/30/01:tm added user definable mass scaling function mass=f(fc_spd_scale,fc_trq_scale,fc_base_mass,fc_acc_mass,fc_fuel_mass)

