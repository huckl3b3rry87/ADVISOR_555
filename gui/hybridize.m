function hybridize(option)
% This is the machine-generated representation of a Handle Graphics object
% and its children.  Note that handle values may change when these objects
% are re-created. This may cause problems with any callbacks written to
% depend on the value of the handle at the time the object was saved.
%
% To reopen this object, just type the name of the M-file at the MATLAB
% prompt. The M-file and its associated MAT-file must be on your path.

switch option
   
case 'load'
      
figure_color=[1 1 .8];

if get(0,'screensize')==[1 1 1024 768]
   posfig=[320 350 400 180];
else
   posfig=[320 350 400 180];
end

h0 = figure('Color',figure_color, ...
	'Position',posfig, ...
   'numbertitle','off',...
   'name','Level of Hybridization',...
   'windowstyle','modal');

%enter year
str={'Parallel vehicles provide a wide range of choices in the level of hybridization.   Greater hybridization results in a vehicle with a smaller fuel converter and a larger energy storage system.',...
      ' ',...
      'Enter the level of hybridization.',...
      '  0        => mild hybrid',...
      '  0 to 1 => moderate hybrid',...
      '  1        => extreme hybrid'};
h1 = uicontrol('Parent',h0, ...
	'BackgroundColor',figure_color, ...
	'Position',[50 60 300 110], ...
   'String',str, ...
   'HorizontalAlign','left', ...
	'Style','text');
h1 = uicontrol('Parent',h0, ...
	'BackgroundColor',[1 1 1], ...
	'Position',[100 20 60 21], ...
   'String','0.3',...
   'Style','edit', ...
	'Tag','hybridization');

%run button
h1 = uicontrol('Parent',h0, ...
   'CallBack','hybridize(''OK'')',...
   'Position',[300 20 50 25], ...
	'String','OK', ...
	'Tag','Pushbutton1');

uiwait % pauses m-file excution until UI is closed
   
case 'OK'
   
  	assignin('base','hybridization',str2num(get(findobj('tag','hybridization'),'string')));
   close(gcf)
   
end
