%
% Creates the input window for the time parameters needed for the temporal
% factal dimension calculation.
%
figure_w_normalized_uicontrolunits('Units','pixel','pos',[200 400 550 150 ],'Name',' Time Parameters','visible','off',...
    'NumberTitle','off','Color',color_fbg,'NextPlot','new');
axis off;

input1 = uicontrol('Style','edit','Position',[.75 .80 .20 .12],...
    'Units','normalized','String',num2str(nev),...
    'Callback','nev=str2double(input1.String); input1.String=num2str(nev);');

input2 = uicontrol('Style','edit','Position',[.75 .50 .20 .12],...
    'Units','normalized','String',num2str(inc),...
    'Value',1,'Callback','inc=str2double(input2.String); input2.String=num2str(inc);');


tx1 = text('EraseMode','normal', 'Position',[0 .90 0 ], 'Rotation',0 ,...
    'FontSize',ZmapGlobal.Data.fontsz.m , 'FontWeight','bold' , 'String',' Nb of events in the time window: ');

tx2 = text('EraseMode','normal', 'Position',[0 .55 0 ], 'Rotation',0 ,...
    'FontSize',ZmapGlobal.Data.fontsz.m , 'FontWeight','bold' , 'String',' Incrementation step in nb of events: ');



close_button = uicontrol('Style','Pushbutton',...
    'Position',[.60 .05 .20 .20 ],...
    'Units','normalized','Callback','close;zmap_message_center.set_info('' '','' '');done','String','Cancel');

go_button = uicontrol('Style','Pushbutton',...
    'Position',[.20 .05 .20 .20 ],...
    'Units','normalized',...
    'Callback','close;think; gobut = [2]; org = [1]; startfd',...
    'String','Go');


set(gcf,'visible','on');
watchoff;
