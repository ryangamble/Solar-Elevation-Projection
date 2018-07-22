function [D] = calc_sd(d)
%--------------------------------------------------------------------------
% Author: Ryan Gamble
% Date: 08-Mar-2017
%--------------------------------------------------------------------------
% Function Description: Calculate solar declination (D) for a given day of
% the year
%                             ---Inputs---
% Input1: d - angular fraction of a year
%                             ---Outputs---
% Output1: D - solar declination

%% Function Body
% Calculate D

% Calculate sigma as a function of angular fraction of the year (d)
sigma = 279.9348 + d + 1.914827*sind(d) - 0.079525*cosd(d)...
    + 0.019938*sind(2*d) - 0.001620*cosd(2*d);

% Calculate solar declination using sigma
D = asind( sind( 23 + (26/60) + (37.8/3600) ).*sind(sigma) );


