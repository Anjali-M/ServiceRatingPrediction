function [M] = distanceMatrix( file1,file2)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
%   let a be file1 : user and c be file2 : biz

    a=xlsread(file1);
    c=xlsread(file2);
    sizea=size(a,1);
    sizec=size(c,1);
    disp(sizea);
    disp(sizec);
%preallocating memory to matrix M : sizea by sizec
    M=zeros(sizea,sizec);
%    disp(M);
    for i=1:sizea
        for j=1:sizec
%assuming latitude and longitude values are stored in col 2 and 3
             M(i,j)=haversine([a(i,2) a(i,1)],[c(j,5) c(j,3)]);
        end
    end
end

