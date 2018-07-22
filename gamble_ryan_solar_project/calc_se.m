function [T, se] = calc_se(la, lo, Tsr, Tss, num)
%--------------------------------------------------------------------------
% Author: Ryan Gamble
% Date: 08-Mar-2017
%--------------------------------------------------------------------------
% Function Description: Calculate the solar elevation from the time of
% sunrise to sunset for a day of the year at a given latitude and longitude
%                             ---Inputs---
% Input1: la - latitude
% Input2: lo - longitude
% Input3: Tsr - time of sunrise for a given day
% Input4: Tss - time of sunset for a given day
% Input5: num - number of day out of the year

%                             ---Outputs---
% Output1: se - solar elevation
% Output2: t - time of daylight to graph solar elavation over

%% Function Body
% Calculate solar elevation

% Create a range of hours from time of sunrise to sunset
T = [Tsr, ceil(Tsr):floor(Tss), Tss];

% Convert the day number to angular fraction of the year
d = calc_d(num);
% Calculate the time of meridan passage for each day of the year
M = calc_M(d);
% Calculate the solar declination for each day of the year
D = calc_sd(d);

% Calculate h for each time
h = 15.*(T-M) - lo;

% Calculate solar elevation for each time
se = asind(sind(la).*sind(D) + cosd(la).*cosd(D).*cosd(h));
