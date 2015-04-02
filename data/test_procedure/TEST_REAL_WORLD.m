% ADVISOR data file:  TEST_REAL_WORLD.m
%
% Data source:
%
% Data confirmation:
%
% Notes:
% This test runs either a 2-day or a 16-day set of cycles/soaks
% which is intended to capture real-world driving.  Based on 
% available statistics from CARB.
%
% Created on: 17-Jun-99
% By:  VHJ of NREL, valerie_johnson@nrel.gov
%
% Revision history at end of file.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function fig = TEST_REAL_WORLD(option)
% Setup figure for real world test

lblue=[.7 .9 1];

global vinf

%Initializations
drivetrain=vinf.drivetrain.name;
eval('h=vinf.test.days; test4exist=1;','test4exist=0;');
clear h
if ~test4exist; %set up the defaults
   vinf.test.days=2;
   vinf.test.FTP=0;
end

if strcmp(drivetrain,'ev')
   h0 = figure('Color',lblue, ...
      'MenuBar','none', ...
      'NumberTitle','off', ...
      'Name','Real World Test Procedure Setup', ...
      'Position',[461 273 350 244]);
   %Title
   h1 = uicontrol('Parent',h0, ...
      'BackgroundColor',lblue, ...
      'FontSize',14, ...
      'FontWeight','bold', ...
      'HorizontalAlignment','left', ...
      'Position',[29 341 325 25], ...
      'String','Real World Test Procedure Setup', ...
      'Style','text');
   h1 = uicontrol('Parent',h0, ...
      'BackgroundColor',[0.7 0.9 1], ...
      'HorizontalAlignment','left', ...
      'Position',[46 127 281 22], ...
      'String','Real World Test Procedure is not valid for EVs.', ...
      'Style','text');
   h1 = uicontrol('Parent',h0, ...
      'Callback','close(gcbf);SimSetupFig', ...
      'Position',[140 14 62 33], ...
      'String','Back');

elseif nargin==0
   dy=130;
   
   % big window
   %center figure on screen
   figsize=[390 394+dy];
   screensize=get(0,'screensize'); %this should be in pixels(the default)
   left=round(screensize(3)/2-figsize(1)/2);
   bottom=round(screensize(4)/2-figsize(2)/2);
   position=[left bottom figsize];
   
   
   h0 = figure('Color',lblue, ...
      'MenuBar','none', ...
      'Name','Real World Test Procedure Setup', ...
      'NumberTitle','off', ...
      'PaperUnits','points', ...
      'Position',position, ...
      'Visible','off',...
      'Tag','RW_setup_figure');
   
   adv_menu('real world setup');
   
   %Title
   h1 = uicontrol('Parent',h0, ...
      'BackgroundColor',lblue, ...
      'FontSize',14, ...
      'FontWeight','bold', ...
      'HorizontalAlignment','left', ...
      'Position',[29 361+dy 325 25], ...
      'String','Real World Test Procedure Setup', ...
      'Style','text');
   %Time estimate note
   h1 = uicontrol('Parent',h0, ...
      'BackgroundColor',lblue, ...
      'HorizontalAlignment','left', ...
      'Position',[29 335+dy 360 27], ...
      'String',['Approximate run times:',sprintf('	'),'2/14 minutes conv, 2/16-day (11/77X UDDS run)' sprintf(' '),...
         		 '6/50 min for hybrid, 2/16-day (24/200X UDDS run)'], ...
      'Style','text');
   
   %2-day or 16-day choice
   h1 = uicontrol('Parent',h0, ...
      'BackgroundColor',lblue, ...
      'FontWeight','bold', ...
      'HorizontalAlignment','left', ...
      'Position',[34 307+dy 225 19], ...
      'String','Choose Time Period (required input):', ...
      'Style','text');
   h1 = uicontrol('Parent',h0, ...
      'BackgroundColor',lblue, ...
      'Callback','TEST_REAL_WORLD(''2day'')',...
      'Position',[44 284+dy 120 19], ...
      'String','2-day set of cycles', ...
      'Style','radiobutton', ...
      'Tag','2 day button');
   if vinf.test.days==2, set(h1,'value',1), else set(h1,'value',1), end
   h1 = uicontrol('Parent',h0, ...
      'BackgroundColor',lblue, ...
      'Callback','TEST_REAL_WORLD(''16day'')',...
      'Position',[44 259+dy 120 19], ...
      'String','16-day set of cycles', ...
      'Style','radiobutton', ...
      'Tag','16 day button');
   if vinf.test.days==16, set(h1,'value',1), else set(h1,'value',0), end
   %Ambient Temperature
   h1 = uicontrol('Parent',h0, ...
      'BackgroundColor',lblue, ...
      'HorizontalAlignment','left',...
      'FontWeight','bold',...
      'Position',[34 237+dy 195 19], ...
      'String','Specify Ambient Temperature (C)', ...
      'Style','text');
   h1 = uicontrol('Parent',h0, ...
      'BackgroundColor',[1 1 1], ...
      'Callback','TEST_REAL_WORLD(''amb temp'')', ...
      'Position',[229 239+dy 30 19], ...
      'String','20', ...
      'Style','edit', ...
      'Tag','ambtmp');
   %Axes
   h1 = axes('Parent',h0, ...
      'Units','pixels', ...
      'CameraUpVector',[0 1 0], ...
      'Color',[1 1 1], ...
      'Position',[73 165+dy 295 65], ...
      'Tag','Axes', ...
      'XColor',[0 0 0], ...
      'YColor',[0 0 0], ...
      'ZColor',[0 0 0],...
      'Fontsize',8);
   
   %FTP comparison
   dy2=18;
   h1 = uicontrol('Parent',h0, ...
      'BackgroundColor',lblue, ...
      'FontWeight','bold', ...
      'HorizontalAlignment','left', ...
      'Position',[34 233+dy2 125 19], ...
      'String','Optional comparison:', ...
      'Style','text');
   h1 = uicontrol('Parent',h0, ...
      'BackgroundColor',lblue, ...
      'Callback','TEST_REAL_WORLD(''FTP'')', ...
      'Position',[44 213+dy2 104 19], ...
      'String','Compare to FTP?', ...
      'Style','checkbox', ...
      'Value',vinf.test.FTP,...
      'Tag','FTP_box');
   h1 = uicontrol('Parent',h0, ...
      'Callback','TEST_REAL_WORLD(''FTP specify soak'')',...
      'BackgroundColor',lblue, ...
      'HorizontalAlignment','left',...
      'Position',[64 190+dy2 182 19], ...
      'String','Specify Length of Cold Soak (hrs)?', ...
      'Style','checkbox',...
      'Value',vinf.test.FTP,...
      'Tag','FTP specify soak'); 
   h1 = uicontrol('Parent',h0, ...
      'BackgroundColor',[1 1 1], ...
      'Callback','TEST_REAL_WORLD(''FTP soak time'')', ...
      'Position',[251 190+dy2 30 19], ...
      'String','12', ...
      'Style','edit', ...
      'Tag','FTP_soaktime');
   
   
   %Add'l Vars
   h1 = uicontrol('Parent',h0, ...
      'BackgroundColor',lblue, ...
      'HorizontalAlignment','left', ...
      'Position',[30 176 319 24], ...
      'String','Default tracking of fuel economy, emissions, and miles travelled.', ...
      'Style','text');
   h1 = uicontrol('Parent',h0, ...
      'BackgroundColor',lblue, ...
      'FontWeight','bold', ...
      'HorizontalAlignment','left', ...
      'Position',[33 160 193 19], ...
      'String','Additional Variables to Track:', ...
      'Style','text');
   %Left side
   h1 = uicontrol('Parent',h0, ...
      'BackgroundColor',lblue, ...
      'HorizontalAlignment','left', ...
      'Position',[52 137 98 19], ...
      'String','Available Variables', ...
      'Style','text');
   h1 = uicontrol('Parent',h0, ...
      'BackgroundColor',[1 1 1], ...
      'Position',[32 56 136 79], ...
      'String',gui_options('real world input vars'), ...
      'Style','listbox', ...
      'Tag','avail vars', ...
      'Value',1);
   %Add/delete
   h1 = uicontrol('Parent',h0, ...
      'BackgroundColor',[.75 .75 .75], ...
      'Callback','TEST_REAL_WORLD(''add'')', ...
      'Position',[176 103 43 22], ...
      'String','Add-->');
   h1 = uicontrol('Parent',h0, ...
      'BackgroundColor',[.75 .75 .75], ...
      'Callback','TEST_REAL_WORLD(''delete'')', ...
      'Position',[176 72 44 22], ...
      'String','Delete');
   %Right side
   h1 = uicontrol('Parent',h0, ...
      'BackgroundColor',lblue, ...
      'HorizontalAlignment','left', ...
      'Position',[250 138 98 19], ...
      'String','Variables to track', ...
      'Style','text');
   h1 = uicontrol('Parent',h0, ...
      'BackgroundColor',[1 1 1], ...
      'Position',[228 56 141 80], ...
      'Style','listbox', ...
      'Tag','track vars');
   eval('h=vinf.test.vars; test4exist=1;','test4exist=0;');
   clear h
   if test4exist, set(h1, 'string',vinf.test.vars),end
   
   %Help, Back, Run buttons
   h1 = uicontrol('Parent',h0, ...
      'Callback','load_in_browser(''RW_procedure.html'');', ...
      'Position',[164 10 62 33], ...
      'String','Help');
   h1 = uicontrol('Parent',h0, ...
      'Callback','close(gcbf);SimSetupFig', ...
      'Position',[240 10 62 33], ...
      'String','Back');
   h1 = uicontrol('Parent',h0, ...
      'Callback','TEST_REAL_WORLD(''get vars'');close(gcbf);RW_execute;', ...
      'Position',[317 10 62 33], ...
      'String','Run');
   
   TEST_REAL_WORLD('FTP');
   TEST_REAL_WORLD('2day');
   vinf.test.contvars='';
   TEST_REAL_WORLD('amb temp')
   TEST_REAL_WORLD('FTP soak time')

   %set everything normalized and set the figure size and center it
   h=findobj('type','uicontrol');
   g=findobj('type','axes');
   set([h; g],'units','normalized')
   set(gcf,'Visible','on');
         
end

 
if nargin>0
   switch option
   case '2day'
      button2=get(findobj('tag','2 day button'),'value');
      if button2
         vinf.test.days=2;
         set(findobj('tag','2 day button'),'value',1)
         set(findobj('tag','16 day button'),'value',0)
         load RW_2cycle
      else
         vinf.test.days=16;
         set(findobj('tag','16 day button'),'value',1)
         set(findobj('tag','2 day button'),'value',0)
         load RW_16cycle
      end
      plot(Ccyc_mph(:,1)/(3600*24),Ccyc_mph(:,2)*units('mph2kmph'));
      xlabel('Time (days)','Fontsize',8);
      if strcmp(vinf.units,'us')
         ylabel('Speed (mph)','Fontsize',8);
      else
         ylabel('Speed (kph)','Fontsize',8);
      end
      %title(['Speed trace for 2-day set of cycles'],'Fontsize',8);
      axis([0 inf 0 120]); zoom on;
   case '16day'
      button16=get(findobj('tag','16 day button'),'value');
      if button16
         vinf.test.days=16;
         set(findobj('tag','16 day button'),'value',1)
         set(findobj('tag','2 day button'),'value',0)
         load RW_16cycle
      else
         vinf.test.days=2;
         set(findobj('tag','2 day button'),'value',1)
         set(findobj('tag','16 day button'),'value',0)
         load RW_2cycle
      end
      plot(Ccyc_mph(:,1)/(3600*24),Ccyc_mph(:,2)*units('mph2kmph'));
      xlabel('Time (days)','Fontsize',8);
      if strcmp(vinf.units,'us')
         ylabel('Speed (mph)','Fontsize',8);
      else
         ylabel('Speed (kph)','Fontsize',8);
      end
      %title(['Speed trace for 16-day set of cycles'],'Fontsize',8);
      axis([0 inf 0 120]); zoom on;
   case 'FTP'
      if get(findobj('tag','FTP_box'),'value')==1
         vinf.test.FTP=1;
         set(findobj('tag','FTP specify soak'),'enable','on');
      else
         vinf.test.FTP=0;
         set(findobj('tag','FTP specify soak'),'enable','off','value',0);
      end
      TEST_REAL_WORLD('FTP specify soak')
   case 'amb temp'   
      vinf.test.ambtmp=str2num(get(findobj('tag','ambtmp'),'string'));
   case 'FTP specify soak'   
      if get(findobj('tag','FTP specify soak'),'value')==1
         vinf.test.FTPsoak=1;
         set(findobj('tag','FTP_soaktime'),'enable','on');
      else
         vinf.test.FTPsoak=0;
         set(findobj('tag','FTP_soaktime'),'enable','off');
      end
      
   case 'FTP soak time'   
      vinf.test.soaktime=str2num(get(findobj('tag','FTP_soaktime'),'string'));
   case 'add'
      %get info from directory listing side
      h1=findobj('tag','avail vars');
      varnames=get(h1,'string');
      varnum=get(h1,'value');
      
      %get info from data files side
      h2=findobj('tag','track vars');
      selected_vars=get(h2,'string');
      
      %add new filename to list
      if isempty(selected_vars);%if this is the first var just replace the string
         selected_vars=varnames(varnum);
      elseif isempty(strmatch(varnames(varnum),selected_vars) )
         % if this is not the first file, add it to the list (if not already there)
         selected_vars(max(size(selected_vars))+1)=varnames(varnum);
      end
      
      %reset the string in the data files
      set(h2,'string',selected_vars)
      TEST_REAL_WORLD('get vars');
   case 'delete'
      global varnames
      %get information on file to delete
      h1=findobj('tag','track vars');
      varnum=get(h1,'value');
      varnames=get(h1,'string');
      
      %if only one filename then delete the filename
      if length(varnames)==1
         varnames='';
      %if last filename then just shorten filenames by 1   
      elseif length(varnames)==varnum
         varnames=varnames(1:varnum-1);
         set(h1,'value',varnum-1);
      %if first filename, and more than just one filename then shift filenames by 1   
      elseif length(varnames)~=1 & varnum==1
         varnames=varnames(2:length(varnames));
      %for all other cases
  		else
           varnames=varnames([1:varnum-1 varnum+1:max(size(varnames))]);
      end
       
      set(h1,'string',varnames)
      TEST_REAL_WORLD('get vars');
   case 'get vars'
      global vinf
      %set variable list to vinf.test.vars
      h1=findobj('tag','track vars');
      varnames=get(h1,'string');
      vinf.test.vars=varnames;
      contvars='';
      for i=1:length(varnames)
         contvars{i}=['C' varnames{i}];
      end
      vinf.test.contvars=contvars;
   end
end

%Revision history
% 6/17/99: vhj file created
% 6/24/99: vhj called 'get vars' from 'add' and 'delete'
% 7/07/99: ss  adjusted figure position to be centered on screen.
% 9/03/99: vhj deleted 'Toolbar' in figure--incompatible with 5.2
% 9/08/99: vhj EV not available as option
% 9/09/99: vhj normalized figure
% 9/16/99: vhj units conversions, estimate for run time, initialize vinf.test.contvars='';
% 9/23/99: vhj added TEST_REAL_WORLD(''get vars''); to RUN command
%10/11/99: vhj updated run times for hybrid cases
%11/29/99: vhj added ambient temperature settings and length of cold soak for FTP comparision
% 5/31/00: ss changed calls from gui_execute to SimSetupFig.
% 7/10/99:ss all references to FUDS are now UDDS
%08/09/00: vhj fixed spacing problem, line 97