function fig = RW_results(option)

if nargin==0
   global vinf
   
   %Colors
   blue=[.4 .7 1];
   green=[0 .9 .45];
   yellow=[1 1 .635];
   red=[1 0 0];
   pink=[1 .5 .5];
   
   %Big figure
   %center figure on screen
   figsize=[637 513];
   screensize=get(0,'screensize'); %this should be in pixels(the default)
   left=round(screensize(3)/2-figsize(1)/2);
   bottom=round(screensize(4)/2-figsize(2)/2);
   position=[left bottom figsize];
   
   h0 = figure('Color',blue, ...
      'MenuBar','none', ...
      'Name','Real World Test Results', ...
      'NumberTitle','off', ...
      'PaperPosition',[18 180 576 432], ...
      'PaperUnits','points', ...
      'Position',position, ...
      'ResizeFcn','gui_size', ...
      'Tag','rw_results_figure', ...
      'Visible','off');
   
   adv_menu('real world results');
   
   %Title
   h1 = uicontrol('Parent',h0, ...
      'BackgroundColor',blue, ...
      'FontSize',12, ...
      'FontWeight','bold', ...
      'Position',[165 451 318 34], ...
      'String','Real World Test Procedure Results', ...
      'Style','text');
   h1 = uicontrol('Parent',h0, ...
      'BackgroundColor',[0 0 0], ...
      'Position',[138 458 374 5], ...
      'Style','frame');
   
   %Real world final results
   h1 = uicontrol('Parent',h0, ...
      'BackgroundColor',[0.75 0.75 0.75], ...
      'FontWeight','bold', ...
      'Position',[75 425 132 16], ...
      'String','Real World Final Results', ...
      'Style','text');
   h1 = uicontrol('Parent',h0, ...
      'BackgroundColor',green, ...
      'Position',[208 377 320 69], ...
      'Style','frame');
   if strcmp(vinf.units,'metric')
      str='Fuel Consumption';
   else
      str='Fuel Economy';
   end
   h1 = uicontrol('Parent',h0, ...
      'BackgroundColor',green, ...
      'HorizontalAlignment','left', ...
      'Position',[260 419 83 21], ...
      'String',str, ...
      'Style','text');
   if strcmp(vinf.units,'metric')
      str='Emissions (grams/km)';
   else
      str='Emissions (grams/mile)';
   end
   h1 = uicontrol('Parent',h0, ...
      'BackgroundColor',green, ...
      'HorizontalAlignment','left', ...
      'Position',[362 419 129 21], ...
      'String',str, ...
      'Style','text');
   %Distance
   if strcmp(vinf.units,'metric')
      str='Kilometers';
   else
      str='Miles';
   end
   h1 = uicontrol('Parent',h0, ...
      'BackgroundColor',green, ...
      'HorizontalAlignment','left', ...
      'Position',[218 399 44 20], ...
      'String',str, ...
      'Style','text');
   h1 = uicontrol('Parent',h0, ...
      'BackgroundColor',green, ...
      'FontWeight','bold', ...
      'Position',[212 381 48 21], ...
      'String',num2str(evalin('base','round(rw_miles*units(''miles2km'')*10)/10')), ...
      'Style','text');
   %Gas Equivalent Fuel economy/consumption
   if strcmp(vinf.units,'metric')
      str='L/100kmGE';
   else
      str='MPGGE';
   end
   h1 = uicontrol('Parent',h0, ...
      'BackgroundColor',green, ...
      'HorizontalAlignment','left', ...
      'Position',[275 399 47 20], ...
      'String',str, ...
      'Style','text');
   h1 = uicontrol('Parent',h0, ...
      'BackgroundColor',green, ...
      'FontWeight','bold', ...
      'Position',[275 381 47 21], ...
      'String',num2str(evalin('base','round(rw_mpgge*10)/10')), ...
      'Style','text');
   if evalin('base','exist(''rw_mpgge'')')
      if strcmp(vinf.units,'metric')&evalin('base','rw_mpgge~=0')
         set(h1,'string',evalin('base','round((1/rw_mpgge)*units(''gpm2lp100km'')*10)/10'));
      else
         set(h1,'string',evalin('base','round(rw_mpgge*10)/10'));
      end
   end
   %Emissions
   h1 = uicontrol('Parent',h0, ...
      'BackgroundColor',green, ...
      'Position',[325 399 41 20], ...
      'String','HC', ...
      'Style','text', ...
      'Tag','StaticText18');
   h1 = uicontrol('Parent',h0, ...
      'BackgroundColor',green, ...
      'FontWeight','bold', ...
      'Position',[325 381 48 21], ...
      'String',num2str(evalin('base','round(rw_hc*units(''gpm2gpkm'')*1000)/1000')), ...
      'Style','text');
   h1 = uicontrol('Parent',h0, ...
      'BackgroundColor',green, ...
      'Position',[376 399 40 20], ...
      'String','CO', ...
      'Style','text');
   h1 = uicontrol('Parent',h0, ...
      'BackgroundColor',green, ...
      'FontWeight','bold', ...
      'Position',[376 381 47 21], ...
      'String',num2str(evalin('base','round(rw_co*units(''gpm2gpkm'')*1000)/1000')), ...
      'Style','text');
   h1 = uicontrol('Parent',h0, ...
      'BackgroundColor',green, ...
      'Position',[426 399 41 20], ...
      'String','NOx', ...
      'Style','text');
   h1 = uicontrol('Parent',h0, ...
      'BackgroundColor',green, ...
      'FontWeight','bold', ...
      'Position',[426 381 48 21], ...
      'String',num2str(evalin('base','round(rw_nox*units(''gpm2gpkm'')*1000)/1000')), ...
      'Style','text');
   h1 = uicontrol('Parent',h0, ...
      'BackgroundColor',green, ...
      'Position',[477 399 40 20], ...
      'String','PM', ...
      'Style','text');
   h1 = uicontrol('Parent',h0, ...
      'BackgroundColor',green, ...
      'FontWeight','bold', ...
      'Position',[477 381 47 21], ...
      'String',num2str(evalin('base','round(rw_pm*units(''gpm2gpkm'')*1000)/1000')), ...
      'Style','text');
   
   %FTP comparison
   %results are: dist_total, hc_gpm, co_gpm,nox_gpm,pm_gpm,mpgge
   h1 = uicontrol('Parent',h0, ...
      'BackgroundColor',[0.75 0.75 0.75], ...
      'FontWeight','bold', ...
      'Position',[75 355 32 16], ...
      'String','FTP', ...
      'Style','text');
   h1 = uicontrol('Parent',h0, ...
      'Callback','ResultsFig',...
      'BackgroundColor',[0.75 0.75 0.75], ...
      'Position',[110 355 95 16], ...
      'String','FTP Results Figure', ...
      'Style','pushbutton',...
      'Enable','off');
   if vinf.test.FTP, set(h1,'enable','on'); end
   h1 = uicontrol('Parent',h0, ...
      'BackgroundColor',green, ...
      'Position',[208 342 320 33], ...
      'Style','frame');
   %Distance
   h1 = uicontrol('Parent',h0, ...
      'BackgroundColor',green, ...
      'FontWeight','bold', ...
      'Position',[212 348 48 21], ...
      'String','n/a', ...
      'Style','text');
   if vinf.test.FTP, set(h1, 'string', num2str(evalin('base','round(dist*units(''miles2km'')*10)/10'))), end
   %Gas Equivalent Fuel economy/consumption
   h1 = uicontrol('Parent',h0, ...
      'BackgroundColor',green, ...
      'FontWeight','bold', ...
      'Position',[275 348 47 21], ...
      'String','n/a', ...
      'Style','text');
   if vinf.test.FTP
      if strcmp(vinf.units,'metric')&evalin('base','mpgge~=0')
         set(h1,'string',evalin('base','round((1/mpgge)*units(''gpm2lp100km'')*10)/10'));
      else
         set(h1,'string',evalin('base','round(mpgge*10)/10'));
      end
   end
   %Emissions
   h1 = uicontrol('Parent',h0, ...
      'BackgroundColor',green, ...
      'FontWeight','bold', ...
      'Position',[325 348 48 21], ...
      'String','n/a', ...
      'Style','text');
   if vinf.test.FTP, set(h1, 'string', num2str(evalin('base','round(hc_gpm*units(''gpm2gpkm'')*1000)/1000'))), end
   h1 = uicontrol('Parent',h0, ...
      'BackgroundColor',green, ...
      'FontWeight','bold', ...
      'Position',[376 348 47 21], ...
      'String','n/a', ...
      'Style','text');
   if vinf.test.FTP, set(h1, 'string', num2str(evalin('base','round(co_gpm*units(''gpm2gpkm'')*1000)/1000'))), end
   h1 = uicontrol('Parent',h0, ...
      'BackgroundColor',green, ...
      'FontWeight','bold', ...
      'Position',[426 348 48 21], ...
      'String','n/a', ...
      'Style','text');
   if vinf.test.FTP, set(h1, 'string', num2str(evalin('base','round(nox_gpm*units(''gpm2gpkm'')*1000)/1000'))), end
   h1 = uicontrol('Parent',h0, ...
      'BackgroundColor',green, ...
      'FontWeight','bold', ...
      'Position',[477 348 47 21], ...
      'String','n/a', ...
      'Style','text');
   if vinf.test.FTP, set(h1, 'string', num2str(evalin('base','round(pm_gpm*units(''gpm2gpkm'')*1000)/1000'))), end
   
   %Plotting
   h1 = uicontrol('Parent',h0, ...
      'BackgroundColor',blue, ...
      'HorizontalAlignment','left', ...
      'Position',[487 291 76 18], ...
      'String','Output Plots', ...
      'Style','text');
   h1 = uicontrol('Parent',h0, ...
      'Position',[484 269 117 19], ...
      'Callback','RW_results(''output plot'')', ...
      'String',gui_options('real world output vars'), ...
      'Style','popupmenu', ...
      'Tag','Output plot');
   h1 = uicontrol('Parent',h0, ...
      'BackgroundColor',blue, ...
      'HorizontalAlignment','left', ...
      'Position',[487 233 120 18], ...
      'String','Continuous Time Plots', ...
      'Style','text');
   h1 = uicontrol('Parent',h0, ...
      'Callback','RW_results(''time plot'')', ...
      'Position',[485 213 117 19], ...
      'String',' ',...
      'Style','popupmenu', ...
      'Tag','Time plot');
   if ~strcmp(vinf.test.contvars,'')& ~strcmp(vinf.test.contvars,'[]')
      set(h1,'string',vinf.test.contvars)
   else
      set(h1,'enable','off');
   end
%   h1 = uicontrol('Parent',h0, ...
%      'Callback','gui_plot_control', ...
%      'Position',[485 173 70 21], ...
%      'String','Plot Control');
   
   
   
   %Axis
   h1 = axes('Parent',h0, ...
      'Units','pixels', ...
      'CameraUpVector',[0 1 0], ...
      'Color',[1 1 1], ...
      'Position',[56 64 394 240], ...
      'Tag','Axes', ...
      'XColor',[0 0 0], ...
      'YColor',[0 0 0], ...
      'ZColor',[0 0 0]);
      
   %Help/Exit/Back buttons
   h1 = uicontrol('Parent',h0, ...
      'BackgroundColor',[0 0 0], ...
      'Position',[470 17 155 74], ...
      'Style','frame');
   h1 = uicontrol('Parent',h0, ...
      'Callback','close(gcbf)', ...
      'Position',[551 23 70 29], ...
      'String','Exit');
   h1 = uicontrol('Parent',h0, ...
      'Callback','close(gcbf);TEST_REAL_WORLD;', ...
      'Position',[476 23 70 29], ...
      'String','Back');
   h1 = uicontrol('Parent',h0, ...
      'Callback','load_in_browser(''RW_procedure.html'');', ...
      'Position',[551 57 70 28], ...
      'String','Help');
   h1 = uicontrol('Parent',h0, ...
      'Callback','close(gcbf);SimSetupFig', ...
      'Position',[476 57 70 28], ...
      'String','Back Two');
   
   RW_results('output plot');   
   
   %set everything normalized and set the figure size and center it
   h=findobj('type','uicontrol');
   g=findobj('type','axes');
   set([h; g],'units','normalized')
   eval('h=vinf.gui_size; test4exist=1;','test4exist=0;')
   if test4exist
      set(gcf,'units','pixels','position',vinf.gui_size);
   else
      screensize=get(0,'screensize'); %this should be in pixels(the default)
      if screensize(3)>=1024
         vinf.gui_size=[124 81 768 576];
         set(gcf,'units','pixels','position',vinf.gui_size);
      else
         set(gcf,'units','normalized')
         set(gcf,'position',[.03 .05 .95 .85]);
         set(gcf,'units','pixels');
      end
   end
   %set the figure back on after everything is drawn
   set(gcf,'visible','on');
   
end

if nargin>0
   switch option
   case 'time plot'
      var_to_plot=gui_current_str('Time plot');
      tag=get(gca,'tag');
      colornum=0;
      
      if ishold
         global plotvars
         if ~isempty(plotvars)
            plotvars={plotvars,var_to_plot};
         else   
            plotvars={var_to_plot};   
        end
         
         h=get(gca,'children');
         %figure out number of lines already plotted
         for i=1:length(h)
            if strcmp(get(h(i),'type'),'line')
               colornum=colornum+1;
            end
         end
      end
      
      colorselection=['b','r','g','m','y','k','c'];
      colornum=colornum+1;
      color=colorselection(colornum);
      
      plotnum=size(evalin('base',var_to_plot),2);
      if plotnum>1
         evalin('base',['plot(t_vec/(3600*24),',var_to_plot,')']);
         for i=1:plotnum
            set(gca,'userdata',strvcat(get(gca,'userdata'),[strrep(var_to_plot,'_','\_') '(',num2str(i),')']));
         end
      else
         evalin('base',['plot(t_vec/(3600*24),',var_to_plot,',''',color,''')']);
         set(gca,'userdata',strvcat(get(gca,'userdata'),strrep(var_to_plot,'_','\_')));
      end
      
      ylabel(strrep(var_to_plot,'_','\_'));
      set(gca,'tag',tag);
      xlabel('Time (days)');
      
      legend off;
      legend(get(gca,'userdata'));

   case 'output plot'
      var_to_plot=gui_current_str('Output plot');
      tag=get(gca,'tag');
      colornum=0;
      
      if ishold
         global plotvars
         if ~isempty(plotvars)
            plotvars={plotvars,var_to_plot};
         else   
            plotvars={var_to_plot};   
        end
         
         h=get(gca,'children');
         %figure out number of lines already plotted
         for i=1:length(h)
            if strcmp(get(h(i),'type'),'line')
               colornum=colornum+1;
            end
         end
      end
      
      colorselection=['b','r','g','m','y','k','c'];
      colornum=colornum+1;
      color=colorselection(colornum);
      
      if strcmp(var_to_plot,'trip_tot_emis_hc')|strcmp(var_to_plot,'trip_tot_emis_co')|...
            strcmp(var_to_plot,'trip_tot_emis_nox')|strcmp(var_to_plot,'trip_tot_emis_pm')|...
            strcmp(var_to_plot,'trip_tot_emis_hc_gpkm')|strcmp(var_to_plot,'trip_tot_emis_co_gpkm')|...
            strcmp(var_to_plot,'trip_tot_emis_nox_gpkm')|strcmp(var_to_plot,'trip_tot_emis_pm_gpkm')
         evalin('base',['plot(',var_to_plot,',''',color,'d'')']);
         set(gca,'userdata',strvcat(get(gca,'userdata'),strrep(var_to_plot,'_','\_')));
         xlabel('Trip #');
         ylabel(strrep(var_to_plot,'_','\_'));
      elseif strcmp(var_to_plot,'cum_soak_dur')
         evalin('base',['plot(pct_trips,',var_to_plot,',''',color,''')']);
         evalin('base','hold on; load CARB_soak');
         evalin('base',['plot(soak(:,1),soak(:,2),''r:'')']);
         set(gca,'userdata',strvcat(get(gca,'userdata'),strrep(var_to_plot,'_','\_')));
         set(gca,'userdata',strvcat(get(gca,'userdata'),'CARB'));
         xlabel('Percentage of Trips');
         ylabel([strrep(var_to_plot,'_','\_') ' (hrs)']);
         evalin('base','hold off;');
         axis([0 100 0 40]);
      elseif strcmp(var_to_plot,'cum_trip_mi')
         evalin('base',['plot(pct_trips,',var_to_plot,',''',color,''')']);
         evalin('base','hold on; load CARB_miles');
         evalin('base',['plot(miles(:,1),miles(:,2),''r:'')']);
         set(gca,'userdata',strvcat(get(gca,'userdata'),strrep(var_to_plot,'_','\_')));
         set(gca,'userdata',strvcat(get(gca,'userdata'),'CARB'));
         xlabel('Percentage of Trips');
         ylabel(strrep(var_to_plot,'_','\_'));
         evalin('base','hold off;');
      elseif strcmp(var_to_plot,'cum_trip_mph')
         evalin('base',['plot(pct_trips,',var_to_plot,',''',color,''')']);
         evalin('base','hold on; load CARB_mph');
         evalin('base',['plot(speed(:,1),speed(:,2),''r:'')']);
         set(gca,'userdata',strvcat(get(gca,'userdata'),strrep(var_to_plot,'_','\_')));
         set(gca,'userdata',strvcat(get(gca,'userdata'),'CARB'));
         xlabel('Percentage of Trips');
         ylabel(strrep(var_to_plot,'_','\_'));
         evalin('base','hold off;');
      elseif strcmp(var_to_plot,'cum_trip_km')
         evalin('base',['plot(pct_trips,',var_to_plot,',''',color,''')']);
         evalin('base','hold on; load CARB_miles');
         evalin('base',['plot(miles(:,1),miles(:,2)/.62137,''r:'')']);
         set(gca,'userdata',strvcat(get(gca,'userdata'),strrep(var_to_plot,'_','\_')));
         set(gca,'userdata',strvcat(get(gca,'userdata'),'CARB'));
         xlabel('Percentage of Trips');
         ylabel(strrep(var_to_plot,'_','\_'));
         evalin('base','hold off;');
      elseif strcmp(var_to_plot,'cum_trip_kph')
         evalin('base',['plot(pct_trips,',var_to_plot,',''',color,''')']);
         evalin('base','hold on; load CARB_mph');
         evalin('base',['plot(speed(:,1),speed(:,2)/.62137,''r:'')']);
         set(gca,'userdata',strvcat(get(gca,'userdata'),strrep(var_to_plot,'_','\_')));
         set(gca,'userdata',strvcat(get(gca,'userdata'),'CARB'));
         xlabel('Percentage of Trips');
         ylabel(strrep(var_to_plot,'_','\_'));
         evalin('base','hold off;');
      elseif strcmp(var_to_plot,'cum_starts_perday') %CARB_starts
         evalin('base',['plot(pct_days,',var_to_plot,',''',color,''')']);
         evalin('base','hold on; load CARB_starts');
         evalin('base',['plot(starts(:,1),starts(:,2),''r:'')']);
         set(gca,'userdata',strvcat(get(gca,'userdata'),strrep(var_to_plot,'_','\_')));
         set(gca,'userdata',strvcat(get(gca,'userdata'),'CARB'));
         xlabel('Percentage of Trips');
         ylabel(strrep(var_to_plot,'_','\_'));
         evalin('base','hold off;');
      end
      
      %set(gca,'tag',tag);
      legend off;
      legend(get(gca,'userdata'));
   end
end


%Revision history
% 6/17/99: vhj file created
% 7/07/99: ss adjusted figure position to be centered on screen.
% 9/09/99: vhj normalized figure size
% 9/16/99: vhj units: plots, names, values, RW, FTP
% 9/23/99: vhj new vars for tot_trip_emis_gpkm
% 9/24/99: vhj dist_total -> dist for FTP results
%11/29/99: vhj added FTP results figure button
% 3/21/00: ss replaced a call to gui_results with ResultsFigControl (new name for results figure)
% 2/15/02: ss replaced ResultsFigControl with ResultsFig
