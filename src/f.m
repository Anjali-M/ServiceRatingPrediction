function y = f( constant , x)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    y=constant(1)*exp(-((x-constant(2))/constant(3)).^2);    
    
    %plot(x,y,'b*');
end

