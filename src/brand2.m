function brand2() % autogenerated function wrapper
    %  brand2  calculates synthetic b distributions based on
    %  a random permutation of original magnitude values,
    %  it then compares it to original b map using bvalmapt
    %                                                 Ram�n Z��iga 9/2000
    %                          Operates on a
    %
    % turned into function by Celso G Reyes 2017
    
    ZG=ZmapGlobal.Data; % used by get_zmap_globals
    report_this_filefun(mfilename('fullpath'));
    
    % first create a new catalog with original data changing the year values
    
    lengtha = ZG.a.Count;
    conca = a;
    conca(:,3) = conca(:,3) + 500;  % add 500 to years to make it a consecutive sequence
    
    % now change magnitudes by a random permutation
    conca(:,6) = conca(randperm(lengtha),6);  % permuted magnitudes
    
    %paste the two catalogs to get a concatenated set
    ZG.a(lengtha+1:lengtha*2,:) = conca;
    
    minnu = 40;  % minimum number of events in each period
    t4 = a(ZG.a.Count,3);
    t3 = a(lengtha+1,3);
    t2 = ZG.a.Date(lengtha);
    t1 = ZG.a.Date(1);
    
    %stri = [  ' Synthetic b map comparison for ' name  ];
    % make the interface
    %
    figure_w_normalized_uicontrolunits(...
        'Name','Grid Input Parameter',...
        'NumberTitle','off', ...
        ...
        'NextPlot','new', ...
        'units','points',...
        'Visible','off', ...
        'Position',[ ZG.wex+200 ZG.wey-200 450 250]);
    axis off
    labelList2=['Weighted LS - automatic Mcomp | Weighted LS - no automatic Mcomp '];
    labelPos = [0.2 0.7  0.6  0.08];
    hndl2=uicontrol(...
        'Style','popup',...
        'Position',labelPos,...
        'Units','normalized',...
        'String',labelList2,...
        'callback',@callbackfun_001);
    
    
    
    labelList=['Maximum likelihood - automatic Mcomp | Maximum likelihood  - no automatic Mcomp '];
    labelPos = [0.2 0.8  0.6  0.08];
    hndl1=uicontrol(...
        'Style','popup',...
        'Position',labelPos,...
        'Units','normalized',...
        'String',labelList,...
        'callback',@callbackfun_002);
    
    
    % creates a dialog box to input grid parameters
    %
    freq_field=uicontrol('Style','edit',...
        'Position',[.60 .50 .22 .10],...
        'Units','normalized','String',num2str(ra),...
        'callback',@callbackfun_003);
    
    freq_field2=uicontrol('Style','edit',...
        'Position',[.60 .40 .22 .10],...
        'Units','normalized','String',num2str(dx),...
        'callback',@callbackfun_004);
    
    freq_field3=uicontrol('Style','edit',...
        'Position',[.60 .30 .22 .10],...
        'Units','normalized','String',num2str(dy),...
        'callback',@callbackfun_005);
    
    close_button=uicontrol('Style','Pushbutton',...
        'Position',[.60 .05 .15 .12 ],...
        'Units','normalized','callback',@callbackfun_006,'String','Cancel');
    
    go_button1=uicontrol('Style','Pushbutton',...
        'Position',[.20 .05 .15 .12 ],...
        'Units','normalized',...
        'callback',@callbackfun_007,...
        'String','Go');
    
    text(...
        'Color',[0 0 0 ],...
        'EraseMode','normal',...
        'Position',[0.20 1.0 0 ],...
        'Rotation',0 ,...
        'FontSize',ZmapGlobal.Data.fontsz.l ,...
        'FontWeight','bold',...
        'String','Automatically estimate magn. of completeness?   ');
    txt3 = text(...
        'Color',[0 0 0 ],...
        'EraseMode','normal',...
        'Position',[0.30 0.64 0 ],...
        'Rotation',0 ,...
        'FontSize',ZmapGlobal.Data.fontsz.l ,...
        'FontWeight','bold',...
        'String',' Grid Parameter');
    txt5 = text(...
        'Color',[0 0 0 ],...
        'EraseMode','normal',...
        'Position',[0. 0.42 0 ],...
        'Rotation',0 ,...
        'FontSize',ZmapGlobal.Data.fontsz.m ,...
        'FontWeight','bold',...
        'String','Spacing in x (dx) in deg:');
    
    txt6 = text(...
        'Color',[0 0 0 ],...
        'EraseMode','normal',...
        'Position',[0. 0.32 0 ],...
        'Rotation',0 ,...
        'FontSize',ZmapGlobal.Data.fontsz.m ,...
        'FontWeight','bold',...
        'String','Spacing in y (dy) in deg:');
    
    txt1 = text(...
        'Color',[0 0 0 ],...
        'EraseMode','normal',...
        'Position',[0. 0.53 0 ],...
        'Rotation',0 ,...
        'FontSize',ZmapGlobal.Data.fontsz.m,...
        'FontWeight','bold',...
        'String','Constant Radius in km:');
    set(gcf,'visible','on');
    watchoff
    
    
    function callbackfun_001(mysrc,myevt)
        global inb2
        % automatically created callback function from text
        callback_tracker(mysrc,myevt,mfilename('fullpath'));
        inb2=hndl2.Value;
    end
    
    function callbackfun_002(mysrc,myevt)
        global inb1
        % automatically created callback function from text
        callback_tracker(mysrc,myevt,mfilename('fullpath'));
        inb1=hndl1.Value;
    end
    
    function callbackfun_003(mysrc,myevt)
        % automatically created callback function from text
        callback_tracker(mysrc,myevt,mfilename('fullpath'));
        ra=str2double(freq_field.String);
        freq_field.String=num2str(ra);
    end
    
    function callbackfun_004(mysrc,myevt)
        % automatically created callback function from text
        callback_tracker(mysrc,myevt,mfilename('fullpath'));
        dx=str2double(freq_field2.String);
        freq_field2.String=num2str(dx);
    end
    
    function callbackfun_005(mysrc,myevt)
        % automatically created callback function from text
        callback_tracker(mysrc,myevt,mfilename('fullpath'));
        dy=str2double(freq_field3.String);
        freq_field3.String=num2str(dy);
    end
    
    function callbackfun_006(mysrc,myevt)
        % automatically created callback function from text
        callback_tracker(mysrc,myevt,mfilename('fullpath'));
        close;
        done;
    end
    
    function callbackfun_007(mysrc,myevt)
        global inb1
        global inb2
        
        % automatically created callback function from text
        callback_tracker(mysrc,myevt,mfilename('fullpath'));
        inb1=hndl1.Value;
        inb2=hndl2.Value;
        close;
        bvalmapt('ca');
    end
    
end
