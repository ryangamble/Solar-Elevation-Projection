function [num, Tsr, Tss] = calc_srss(z, la, lo)
%--------------------------------------------------------------------------
% Author: Ryan Gamble
% Date: 08-Mar-2017
%--------------------------------------------------------------------------
% Function Description: Calculate the time of sunrise and sunset for each
% day of the year for a given altitude, latitude, longitude
%                             ---Inputs---
% Input1: z - altitude
% Input2: la - latitude
% Input3: lo - longitude
%                             ---Outputs---
% Output1: M - time of meridian passage (hrs)

%% Function Body
% Calculate time of sunrise and sunset

% Create a data set representing each day of the year
num = 1:365;
% Convert the day numbers to angular fraction of the year
d = calc_d(num);
% Calculate the time of meridan passage for each day of the year
M = calc_M(d);
% Calculate the solar declination for each day of the year
D = calc_sd(d);

% Calculate the sunrise/sunset solar elevation angle at a given altitude
A = -1.76459*(z^(0.40795));

% Calculate the numerator for used to calculate H
hnum = sind(A)-sind(la)*sind(D);
% Calculate the denominator for used to calculate H
hden = cosd(la)*cosd(D);
% Calculate the solar hour angle in hours
H = (acosd(hnum./hden))/15;

% Adjust longitude from degrees to hours
Lo = lo/15;

% Calculate time of sunrise and sunset
Tsr = Lo + M - H;
Tss = Lo + M + H;


