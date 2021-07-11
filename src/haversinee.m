function [ km ] = haversinee( loc1,loc2)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

locs = {loc1 loc2};     
R = 6371;                                   % Earth's radius in km
delta_lat = locs{2}(1) - locs{1}(1);        % difference in latitude
delta_lon = locs{2}(2) - locs{1}(2);        % difference in longitude
a = sin(delta_lat/2)^2 + cos(locs{1}(1)) * cos(locs{2}(1)) * ...
    sin(delta_lon/2)^2;
c = 2 * atan2(sqrt(a), sqrt(1-a));
km = R * c;                                 % distance in km


end

