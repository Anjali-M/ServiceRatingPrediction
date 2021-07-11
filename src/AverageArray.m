function [ R ] = AverageArray( )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
%   let M be matrix containing users and their respective rating
    %M = dataset('xlsfile',file);
    %M(1:50,:);
    %M.user_id=nominal(M.user_id);
    
    M = dataset('xlsfile','ubr.csv');
    M.user_id=nominal(M.user_id);
    
    USER = dataset('xlsfile','user.csv');
    USER.user_id=nominal(USER.user_id);
    usize=size(USER(:,1));
    %disp(usize);
    for i=1:usize(1)
        temp = cellstr(USER(i,1));
       % disp(temp);
       
        tmp = double(M(eq(M.user_id,temp),3));
       % disp(tmp);
        rsize = size(tmp);
       % disp(rsize);
        R(i,1) = sum(tmp)/rsize(1,1);
    end
   % disp(R);
%   M.bis_id=nomial(M.bis_id);
%   disp(M);
%   let a be mean or average value of array mean(M,dimension) 
    %[uid, ravg] = grpstats(M.rating,M.user_id);
   % disp(uid);
%   disp(P);
    %R=dataset(uid,ravg);
%    disp(avg_rating);
end

