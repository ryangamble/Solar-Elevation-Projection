function [M] = calc_M(d)
%--------------------------------------------------------------------------
% Author: Ryan Gamble
% Date: 08-Mar-2017
%--------------------------------------------------------------------------
% Function Description: Calculate the time of meridian for a given day of
% the year
%                             ---Inputs---
% Input1: d - angular fraction of a year
%                             ---Outputs---
% Output1: M - time of meridian passage (hrs)

%% Function Body
% Calcualte the time of meridian passage in hours

M = 12 + 0.123570*sind(d) - 0.004289*cosd(d) + 0.153809*sind(2*d)...
    + 0.060783*cosd(2*d);
