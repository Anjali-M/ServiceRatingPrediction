function [ lat,long] = bizlocation( id )
%returns the location of the given business id
%   Detailed explanation goes here
    M = dataset('xlsfile','deleted-result-biz.csv');
    M.business_id=nominal(M.business_id);
 %   id=nominal(id);
    ds=M(eq(M.business_id,id),:);
%    disp(ds);
    lat=double(ds.latitude);
    long=double(ds.longitude);
    

end

