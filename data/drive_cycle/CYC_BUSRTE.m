% ADVISOR data file:  CYC_BUSRTE.m
%
% Data source:
% Measured by Keith Wipke, NREL, on a 16th Street Mall bus in Denver, CO.
%
% Data confirmation:
%
% Notes:
% This is a 1.65-mile round trip, with the bus stopping at every block and
% reaching a peak speed of about 18 mph on most of its 28 start/stops.
% 
% Created on: 12-Jun-1998
% By:  SS of NREL
%
% Revision history at end of file.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% FILE ID INFO
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
cyc_description='1.65-mile(2.65-km) bus route with 28 stops';
cyc_version=2003; % version of ADVISOR for which the file was generated
cyc_proprietary=0; % 0=> non-proprietary, 1=> proprietary, do not distribute
cyc_validation=0; % 0=> no validation, 1=> data agrees with source data, 
% 2=> data matches source data and data collection methods have been verified
disp(['Data loaded: CYC_BUSRTE - ',cyc_description])


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% SPEED AND KEY POSITION vs. time
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% load variable 'cyc_mph', 2 column matrix with time in the first column
load CYC_BUSRTE.mat
% keep key in 'on' position throughout cycle ('1' in the 2nd column => 'on')
vc_key_on=[cyc_mph(:,1) ones(size(cyc_mph,1),1)];


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% OTHER DATA		
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%													
% Size of 'window' used to filter the trace with centered-in-time averaging;
% higher numbers mean more smoothing and less rigorous following of the trace.
% Used when cyc_filter_bool=1
cyc_avg_time=3;  % (s)
cyc_filter_bool=0;	% 0=> no filtering, follow trace exactly; 1=> smooth trace
cyc_grade=0;	%no grade associated with this cycle
cyc_elevation_init=0; %the initial elevation in meters.

if size(cyc_grade,1)<2
   % convert cyc_grade to a two column matrix, grade vs. dist
   cyc_grade=[0 cyc_grade; 1 cyc_grade]; % use this for a constant roadway grade
end

% A constant zero delta in cargo-mass:
% First column is distance (m) second column is mass (kg) 
cyc_cargo_mass=[0 0
   1 0]; 

if size(cyc_cargo_mass,1)<2
   % convert cyc_grade to a two column matrix, grade vs. dist
   cyc_cargo_mass=[0 cyc_cargo_mass; 1 cyc_cargo_mass]; % use this for a constant roadway grade
end

if exist('cyc_coast_gb_shift_delay')
    gb_shift_delay=cyc_coast_gb_shift_delay; % restore the original gb_shift_delay which may have been changed by cyc_coast
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% REVISION HISTORY
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 30-Jun-1998 (MRC):  cosmetic changes
% 3/15/99:ss updated *_version to 2.1 from 2.0
% 9/15/99:mc added km to cyc_description
% 11/3/99:ss updated version to 2.21
% 8/20/01: mpo added special case code to reset gb_shift_delay if changed by cyc_coast
