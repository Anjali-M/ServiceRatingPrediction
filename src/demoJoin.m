function [ ] = demoJoin( )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    ds=dataset('xlsfile','ubr.csv');
    ds.user_id = nominal(ds.user_id);
    id1='5KaaMm4oxWcTcRlslyo0JQ';
    id2='6GrH6gp09pqYykGv86D6Dg';
    t1 = ds(eq(ds.user_id,id1),:);
    t2 = ds(eq(ds.user_id,id2),:);
    disp(t1);
    disp(t2);
    t1=join(t1,t2);
    disp(t1);
end

