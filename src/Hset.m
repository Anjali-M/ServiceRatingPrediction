function [ idset ] = Hset( id )
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
    M = dataset('xlsfile','ubr.csv');
    M.user_id=nominal(M.user_id);
    M.bis_id=nominal(M.bis_id);
   
    temp = (M(eq(M.user_id,id),:));
    idset = cellstr(temp(:,2));
    %disp(idset);
end
