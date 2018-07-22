function [day] = modatoday(mo, da)
%--------------------------------------------------------------------------
% Author: Ryan Gamble
% Date: 08-Mar-2017
%--------------------------------------------------------------------------
% Function Description: Converts values of month and day to day out of year
%                             ---Inputs---
% Input1: mo - numerical value of the month to convert
% Input2: da - numerical value of the day of the month to convert
%                             ---Outputs---
% Output1: day - the day of the year

%% Function Body
% Calculate day of year

if mo == 1
    day = da;
elseif mo == 2
    day = da + 31;
elseif mo == 3
    day = da + 59;
elseif mo == 4
    day = da + 90;
elseif mo == 5
    day = da + 120;
elseif mo == 6
    day = da + 151;
elseif mo == 7
    day = da + 181;
elseif mo == 8
    day = da + 212;
elseif mo == 9
    day = da + 243;
elseif mo == 10
    day = da + 273;
elseif mo == 11
    day = da + 304;
elseif mo == 12
    day = da + 334;
end