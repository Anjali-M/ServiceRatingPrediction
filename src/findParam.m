function [ lam1,lam2,beta,delta,ni ] = findParam( U, P, Ws, Luus, Luis,u_i,b_i,frndw,wfrndId,luufrndId,fsize)
% returns value for setting the parameters
%   Detailed explanation goes here
    
%   frobenius 
    u = norm(U(:,u_i),'fro');
    p = norm(P(:,b_i),'fro');
    temp1= zeros(size(10,1));
    temp2 = zeros(size(10,1));
    for i=1:size(frndw)
        temp1 = temp1 + Ws(i)*U(:,wfrndId(i));
    end
    
    for i=1:fsize
        temp2 = temp2 + Luus(i)*U(:,luufrndId(i));
    end
    
    % disp(temp);
    ws = norm((U(:,u_i)-temp1),'fro');
    luu = norm((U(:,u_i)-temp2),'fro');
    UP=(transpose(U)*P);
 %   disp('luis');
  %  disp(Luis);
    lui = norm((Luis-UP(u_i,b_i)),'fro');

    % the values are stored in an array before finding the lcm
    
    %a=sym([u^2, p^2, ws^2, luu^2, lui^2]);
    %disp(a);
    %the lcm is stored in answ
    answ = u * p * ws * luu * lui;%lcm(a);
 %   disp(double(answ));
    %finding the parameter values
    lam1 = answ/(u);
    lam2 = answ/(p);
    beta = answ/(ws);
    delta = (2*answ)/(luu);
    ni = (2*answ)/(lui);
 %   disp('params');
  %  disp(lam1);
   % disp(lam2);
    %disp(beta);
  %  disp(delta);
   % disp(ni);
end

