function [d] = calc_d(num)
%--------------------------------------------------------------------------
% Author: Ryan Gamble
% Date: 08-Mar-2017
%--------------------------------------------------------------------------
% Function Description: Calculate angular fraction of a year (d)
%                             ---Inputs---
% Input1: num - num of day in the year
%                             ---Outputs---
% Output1: d - angular fraction of a year


%% Function Body
% Calculate d

% Take the number of the day out of the year and convert to angular fraction
d = (num-1)*(360/365.242);
