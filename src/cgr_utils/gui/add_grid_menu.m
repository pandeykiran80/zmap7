function add_grid_menu(obj)
    % add grid menu for modifying ggrid in a ZmapMainWindow
    parent = uimenu(obj.fig,'Label','Grid');
    uimenu(parent,'Label','Create Auto-Grid','Callback',@cb_autogrid);
    uimenu(parent,'Label','Create Grid (interactive)','Callback',@cb_creategrid);
    uimenu(parent,'Label','Create Auto-Radius','Callback',@cb_autoradius);
    uimenu(parent,'Label','Refresh','Callback',@cb_refresh);
    uimenu(parent,'Label','Clear(Delete)','Callback',@cb_clear);
    
    function cb_creategrid(~,~)
        %CB_CREATEGRID interactively create a grid
        %obj=ZmapGlobal.Data;
        
        if ~isempty(obj.Grid)
            todel=findobj(obj.map_axes,'Tag',['grid_', obj.Grid.Name]);
        else
            todel=[];
        end
        delete(todel);
        
        obj.Grid = create_grid(...
            obj.shape.Outline,...
            false,... % do not follow meridians (km)
            false... % do not trim to the shape
            ); % getting result forces program to pause until selection is complete
        obj.Grid.plot(obj.map_axes,'ActiveOnly')
        cb_refresh()
    end
    
    function cb_autogrid(~,~)
        % following assumes grid from main map
        
        if ~isempty(obj.Grid)
            todel=findobj(obj.map_axes,'Tag',['grid_', obj.Grid.Name]);
        else
            todel=[];
        end
        delete(todel);
        
        [obj.Grid,obj.gridopt]=autogrid(obj.catalog,...
            false,... % plot histogram
            true... % put on map
            );
        obj.Grid = obj.Grid.MaskWithShape(obj.shape);
        obj.Grid.plot(obj.map_axes,'ActiveOnly');

    end
    
    function cb_autoradius(~,~)
        ZG=ZmapGlobal.Data;
        sdlg.prompt='Required Number of Events:'; sdlg.value=ZG.ni;
        sdlg(2).prompt='Percentile:'; sdlg(2).value=50;
        sdlg(3).prompt='reach:' ; sdlg(3).value=1.5;
        [~,cancelled,minNum,pct,reach]=smart_inputdlg('automatic radius',sdlg);
        if cancelled
            beep
            return
        end
        [r, evselch] = autoradius(obj.catalog, obj.Grid, minNum, pct, reach);
        ZG.ra=r;
        ZG.ni=minNum;
        ZG.GridSelector=evselch;
    end
    
    function cb_refresh(~,~)
        delete(findobj(obj.fig,'Tag',['grid_',obj.Grid.Name]))
        obj.Grid=obj.Grid.MaskWithShape(obj.shape);
        obj.Grid.plot(obj.map_axes,'ActiveOnly')
    end
    
    function cb_clear(~,~)
        try
            obj.Grid = obj.Grid.delete();
        catch ME
            warning(ME.message)
        end
    end
        
end