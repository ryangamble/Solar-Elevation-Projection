function [hm] = dectohm(dec)
%--------------------------------------------------------------------------
% Author: Ryan Gamble
% Date: 08-Mar-2017
%--------------------------------------------------------------------------
% Function Description: Converts decimal form to hour-minutes
%                             ---Inputs---
% Input1: dec - decimal form to be converted
%                             ---Outputs---
% Output1: hm - converted hour-minute form

%% Function Body
% Convert decimal to hour-minutes

% Find the hours by rounding down to the nearest integer
hr = floor(dec);
% Multiply the hours by 100 to put it in meridian form
hour = hr.*100;
% Subtract out the hours and multiply by 60 to find the minutes
min = (dec - hr).*60;

% Add the hours and minutes to get the time in hour-minutes
hm = hour + min;