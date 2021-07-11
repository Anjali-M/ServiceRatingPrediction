function [ a ,b ,c ] = findABC( list_x,list_y )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
%   list_x contains difference of distance and list_y contains rating 
%   s contains the number of elements in list x or y
    s=size(list_x);
%   sqlx contains square of list_x
    sqlx=list_x.^2;
    k=sum(sqlx);
    l=sum(list_x);
%   mul_xy stores array : x*y
    mul_xy=list_x.*list_y;
    m=sum(mul_xy);
    n=sum(list_y);
%   finding a and b values from the equation
%   ak+bl=m and al+bs=n..... assigning both the equations to eq1 and eq2
%   respectively
    syms a b;
    eq1 = a*k+b*l==m;
    eq2 = a*l+b*s==n;
%   convert the eq to matrix
    [A,B]=equationsToMatrix([eq1,eq2]);
%   op contains the output values ie, a and b 
%   linsolve solves the linear eq and gives the values of a and b
    op=linsolve(A,B);
    a = op(1);
    b = op(2);
%   find c
    
end

