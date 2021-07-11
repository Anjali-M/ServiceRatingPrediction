function [ LuiM ] = Lui( uid )
% returns the Lui matrix : User-item 
%   Detailed explanation goes here
    M = dataset('xlsfile','ubr.csv');
    M.user_id=nominal(M.user_id);
    M.bis_id=nominal(M.bis_id);
    
    USER = dataset('xlsfile','user.csv');
    USER.user_id=nominal(USER.user_id);
    
    temp = USER(eq(USER.user_id,uid),:);
    %disp(size(temp));
    
    lat_u = double(temp(1,3));
    long_u = double(temp(1,2));
    ds=M(eq(M.user_id,uid),:);
%   biz contain business list
%   disp(ds);
    biz = ds(:,2);
    
    ratings = ds(:,3);
%    disp(size(frnd));
    sg_size=size(biz(:,1));
    distance=zeros(2,sg_size(1));
    for i=1:sg_size(1)
        z=cellstr(ds(i,2));
        [lat, long]=bizlocation(z);
        distance(1,i)=haversine([lat_u long_u],[lat long]);
        distance(2,i)=ratings(i,1);
    end
    x=distance(1,:);
    %disp(x);
    y=(distance(2,:));
    %disp(y);
    %s to be declared...no of regions in the graph
    %allocating memory for LuuM
    LuiM=zeros(1,sg_size(1));
    %disp(sg_size);
    
    %to switch of display of any messages
    options = optimset('Display','off');
    constant = lsqcurvefit(@f,[1;1;1],x,y,[],[],options);
        
        a=constant(1);
        %disp(a);
        b=constant(2);
        %disp(b);
        c=constant(3);
        %disp(c);
        
    for i=1:sg_size(1)   %size 
%   finding a b c values
        LuiM(1,i) =(a * exp(-((x(i)-b)/c).^2)); % equation for Lui
    end
    %disp(LuiM);
    %disp(size(LuiM));
%   normalisation of LuiM
    sumL = sum(LuiM);
    LuiM = LuiM/sumL;
end
