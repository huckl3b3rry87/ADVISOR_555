function fig = CustomVehTypeFig()
% This is the machine-generated representation of a Handle Graphics object
% and its children.  Note that handle values may change when these objects
% are re-created. This may cause problems with any callbacks written to
% depend on the value of the handle at the time the object was saved.
% This problem is solved by saving the output as a FIG-file.
%
% To reopen this object, just type the name of the M-file at the MATLAB
% prompt. The M-file and its associated MAT-file must be on your path.
% 
% NOTE: certain newer features in MATLAB may not have been saved in this
% M-file due to limitations of this format, which has been superseded by
% FIG-files.  Figures which have been annotated using the plot editor tools
% are incompatible with the M-file/MAT-file format, and should be saved as
% FIG-files.

load CustomVehTypeFig

h0 = figure('Color',[0.4 0.701960784313725 1], ...
	'Colormap',mat0, ...
	'FileName','C:\ADVISOR_changes\ADVISOR\gui\SaberCosim\CustomVehTypeFig.m', ...
	'Interruptible','off', ...
	'Name','Custom Load Description', ...
	'NumberTitle','off', ...
	'PaperPosition',[18 180 576 432], ...
	'PaperUnits','points', ...
	'Position',[456 267 494 498], ...
	'Tag','CustomVehTypeFig', ...
	'ToolBar','none', ...
	'Visible','off');
h1 = uicontrol('Parent',h0, ...
	'Units','points', ...
	'BackgroundColor',[0 0 0], ...
	'ListboxTop',0, ...
	'Position',[236.25 7.5 116.25 56.25], ...
	'Style','frame', ...
	'Tag','Frame1');
h1 = uicontrol('Parent',h0, ...
	'Units','points', ...
	'BackgroundColor',[1 1 1], ...
	'Callback','CustomVehTypeFigControl(''UpdatePlot'')', ...
	'ListboxTop',0, ...
	'Position',[112.5 71.25 37.5 15], ...
	'Style','edit', ...
	'Tag','C1');
h1 = uicontrol('Parent',h0, ...
	'Units','points', ...
	'BackgroundColor',[1 1 1], ...
	'Callback','CustomVehTypeFigControl(''UpdatePlot'')', ...
	'ListboxTop',0, ...
	'Position',[150 71.25 37.5 15], ...
	'Style','edit', ...
	'Tag','C2');
h1 = uicontrol('Parent',h0, ...
	'Units','points', ...
	'BackgroundColor',[1 1 1], ...
	'Callback','CustomVehTypeFigControl(''UpdatePlot'')', ...
	'ListboxTop',0, ...
	'Position',[187.5 71.25 37.5 15], ...
	'Style','edit', ...
	'Tag','C3');
h1 = uicontrol('Parent',h0, ...
	'Units','points', ...
	'BackgroundColor',[1 1 1], ...
	'Callback','CustomVehTypeFigControl(''UpdatePlot'')', ...
	'ListboxTop',0, ...
	'Position',[240 71.25 37.5 15], ...
	'Style','edit', ...
	'Tag','V1');
h1 = uicontrol('Parent',h0, ...
	'Units','points', ...
	'BackgroundColor',[1 1 1], ...
	'Callback','CustomVehTypeFigControl(''UpdatePlot'')', ...
	'ListboxTop',0, ...
	'Position',[277.5 71.25 37.5 15], ...
	'Style','edit', ...
	'Tag','V2');
h1 = uicontrol('Parent',h0, ...
	'Units','points', ...
	'BackgroundColor',[1 1 1], ...
	'Callback','CustomVehTypeFigControl(''UpdatePlot'')', ...
	'ListboxTop',0, ...
	'Position',[315 71.25 37.5 15], ...
	'Style','edit', ...
	'Tag','V3');
h1 = uicontrol('Parent',h0, ...
	'Units','points', ...
	'BackgroundColor',[0.4 0.701960784313725 1], ...
	'FontSize',12, ...
	'ListboxTop',0, ...
	'Position',[18.75 86.25 78.75 15], ...
	'String','Load Name', ...
	'Style','text', ...
	'Tag','StaticText1');
h1 = uicontrol('Parent',h0, ...
	'Units','points', ...
	'BackgroundColor',[0.4 0.701960784313725 1], ...
	'FontSize',12, ...
	'ListboxTop',0, ...
	'Position',[112.5 101.25 112.5 15], ...
	'String','Current', ...
	'Style','text', ...
	'Tag','StaticText1');
h1 = uicontrol('Parent',h0, ...
	'Units','points', ...
	'BackgroundColor',[0.4 0.701960784313725 1], ...
	'FontSize',12, ...
	'ListboxTop',0, ...
	'Position',[240 101.25 112.5 15], ...
	'String','Corresponding Voltage', ...
	'Style','text', ...
	'Tag','StaticText1');
h1 = uicontrol('Parent',h0, ...
	'Units','points', ...
	'BackgroundColor',[0.4 0.701960784313725 1], ...
	'FontSize',12, ...
	'ListboxTop',0, ...
	'Position',[112.5 86.25 37.5 15], ...
	'String','1', ...
	'Style','text', ...
	'Tag','StaticText1');
h1 = uicontrol('Parent',h0, ...
	'Units','points', ...
	'BackgroundColor',[0.4 0.701960784313725 1], ...
	'FontSize',12, ...
	'ListboxTop',0, ...
	'Position',[150 86.25 37.5 15], ...
	'String','2', ...
	'Style','text', ...
	'Tag','StaticText1');
h1 = uicontrol('Parent',h0, ...
	'Units','points', ...
	'BackgroundColor',[0.4 0.701960784313725 1], ...
	'FontSize',12, ...
	'ListboxTop',0, ...
	'Position',[187.5 86.25 37.5 15], ...
	'String','3', ...
	'Style','text', ...
	'Tag','StaticText1');
h1 = uicontrol('Parent',h0, ...
	'Units','points', ...
	'BackgroundColor',[0.4 0.701960784313725 1], ...
	'FontSize',12, ...
	'ListboxTop',0, ...
	'Position',[315 86.25 37.5 15], ...
	'String','3', ...
	'Style','text', ...
	'Tag','StaticText1');
h1 = uicontrol('Parent',h0, ...
	'Units','points', ...
	'BackgroundColor',[0.4 0.701960784313725 1], ...
	'FontSize',12, ...
	'ListboxTop',0, ...
	'Position',[277.5 86.25 37.5 15], ...
	'String','2', ...
	'Style','text', ...
	'Tag','StaticText1');
h1 = uicontrol('Parent',h0, ...
	'Units','points', ...
	'BackgroundColor',[0.4 0.701960784313725 1], ...
	'FontSize',12, ...
	'ListboxTop',0, ...
	'Position',[240 86.25 37.5 15], ...
	'String','1', ...
	'Style','text', ...
	'Tag','StaticText1');
h1 = axes('Parent',h0, ...
	'Units','pixels', ...
	'CameraUpVector',[0 1 0], ...
	'CameraUpVectorMode','manual', ...
	'CLimMode','manual', ...
	'Color',[1 1 1], ...
	'ColorOrder',mat1, ...
	'Position',[61 211 410 250], ...
	'Tag','CustomVehTypeLoadAxes', ...
	'XColor',[0 0 0], ...
	'YColor',[0 0 0], ...
	'ZColor',[0 0 0]);
h2 = text('Parent',h1, ...
	'Color',[0 0 0], ...
	'FontWeight','bold', ...
	'HandleVisibility','off', ...
	'HorizontalAlignment','center', ...
	'Position',[0.4987775061124695 -0.09638554216867457 9.160254037844386], ...
	'String','Current', ...
	'Tag','Axes1Text4', ...
	'VerticalAlignment','cap');
set(get(h2,'Parent'),'XLabel',h2);
h2 = text('Parent',h1, ...
	'Color',[0 0 0], ...
	'FontWeight','bold', ...
	'HandleVisibility','off', ...
	'HorizontalAlignment','center', ...
	'Position',[-0.07090464547677261 0.4939759036144579 9.160254037844386], ...
	'Rotation',90, ...
	'String','Voltage', ...
	'Tag','Axes1Text3', ...
	'VerticalAlignment','baseline');
set(get(h2,'Parent'),'YLabel',h2);
h2 = text('Parent',h1, ...
	'Color',[0 0 0], ...
	'HandleVisibility','off', ...
	'HorizontalAlignment','right', ...
	'Position',[-0.1491442542787286 1.14859437751004 9.160254037844386], ...
	'Tag','Axes1Text2', ...
	'Visible','off');
set(get(h2,'Parent'),'ZLabel',h2);
h2 = text('Parent',h1, ...
	'Color',[0 0 0], ...
	'FontSize',12, ...
	'FontWeight','bold', ...
	'HandleVisibility','off', ...
	'HorizontalAlignment','center', ...
	'Position',[0.4987775061124695 1.028112449799197 9.160254037844386], ...
	'String','Custom Load', ...
	'Tag','CustomLoadAxesTitle', ...
	'VerticalAlignment','bottom');
set(get(h2,'Parent'),'Title',h2);
h1 = uicontrol('Parent',h0, ...
	'Units','points', ...
	'BackgroundColor',[0.752941176470588 0.752941176470588 0.752941176470588], ...
	'Callback','CustomVehTypeFigControl(''Back'')', ...
	'FontWeight','bold', ...
	'ListboxTop',0, ...
	'Position',[240 11.25 52.5 22.5], ...
	'String','Back', ...
	'Tag','Back');
h1 = uicontrol('Parent',h0, ...
	'Units','points', ...
	'BackgroundColor',[0.752941176470588 0.752941176470588 0.752941176470588], ...
	'Callback','CustomVehTypeFigControl(''Done'')', ...
	'FontWeight','bold', ...
	'ListboxTop',0, ...
	'Position',[296.25 11.25 52.5 22.5], ...
	'String','Done', ...
	'Tag','Done');
h1 = uicontrol('Parent',h0, ...
	'Units','points', ...
	'BackgroundColor',[0.752941176470588 0.752941176470588 0.752941176470588], ...
	'Callback','CustomVehTypeFigControl(''Cancel'')', ...
	'FontWeight','bold', ...
	'ListboxTop',0, ...
	'Position',[240 37.5 52.5 22.5], ...
	'String','Cancel', ...
	'Tag','Cancel');
h1 = uicontrol('Parent',h0, ...
	'Units','points', ...
	'BackgroundColor',[0.752941176470588 0.752941176470588 0.752941176470588], ...
	'Callback','CustomVehTypeFigControl(''Help'')', ...
	'FontWeight','bold', ...
	'ListboxTop',0, ...
	'Position',[296.25 37.5 52.5 22.5], ...
	'String','Help', ...
	'Tag','Help');
h1 = uicontrol('Parent',h0, ...
	'Units','points', ...
	'BackgroundColor',[1 1 1], ...
	'ListboxTop',0, ...
	'Position',[18.75 71.25 78.75 15], ...
	'Style','edit', ...
	'Tag','LoadName');
h1 = uicontrol('Parent',h0, ...
	'Units','points', ...
	'BackgroundColor',[0.4 0.701960784313725 1], ...
	'FontSize',12, ...
	'FontWeight','bold', ...
	'ListboxTop',0, ...
	'Position',[45 345 307.5 22.5], ...
	'Style','text', ...
	'Tag','Title');
if nargout > 0, fig = h0; end
