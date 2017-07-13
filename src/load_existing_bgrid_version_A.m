% load existing b-value grid
% VERSION A


report_this_filefun(mfilename('fullpath'));
% extracted from the various b cross routines

[file1,path1] = uigetfile('*.mat','b-value gridfile');
if length(path1) > 1
    think
    load([path1 file1])
    xsecx = newa(:,length(newa(1,:)))';
    xsecy = newa(:,7);
    xvect = gx; yvect = gy;
    tmpgri=zeros((length(xvect)*length(yvect)),2);
    
    normlap2=ones(length(tmpgri(:,1)),1)*nan;
    normlap2(ll)= bvg(:,1);
    re3=reshape(normlap2,length(yvect),length(xvect));
    
    normlap2(ll)= bvg(:,5);
    r=reshape(normlap2,length(yvect),length(xvect));
    
    normlap2(ll)= bvg(:,6);
    meg=reshape(normlap2,length(yvect),length(xvect));
    
    normlap2(ll)= bvg(:,2);
    old1 =reshape(normlap2,length(yvect),length(xvect));
    
    normlap2(ll)= bvg(:,7);
    pro=reshape(normlap2,length(yvect),length(xvect));
    
    normlap2(ll)= bvg(:,8);
    avm=reshape(normlap2,length(yvect),length(xvect));
    
    normlap2(ll)= bvg(:,9);
    stanm=reshape(normlap2,length(yvect),length(xvect));
    
    normlap2(ll)= bvg(:,10);
    maxm=reshape(normlap2,length(yvect),length(xvect));
    
    old = re3;
    
    view_bv2
else
    return
end