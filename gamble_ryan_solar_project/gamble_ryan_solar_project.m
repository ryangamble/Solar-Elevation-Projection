% Author: Ryan Gamble
% 
% Date: 08-Mar-2017
% 
% Assignment: Solar elevation project
% 
% Description: Prompt a user for values of altitude, latitude, longitude,
% and date. Use this input to generate and display time of sunrise and
% sunset values, as well as solar elevation values for the daylight hours
% of the given location.

clear all;     % Removes all variables, globals, functions and MEX links
clc;           % Clears the command window
close all;     % Closes all of the open figure windows
format short;  % Reset to MATLAB's default format

%% Main Code

%COLLECT USER INPUT
mo = input('Enter the month of the date to view(1-12): ');
da = input('Enter the day of the date to view(1-31): ');
z = input('Enter the altitude of the location to view(in km): ');
la = input('Enter the latitude of the location to view(in degrees): ');
lo = input('Enter the longitude of the location to view(in degrees): ');

%Convert the month and day values to day number of year
day = modatoday(mo, da);



%SUNRISE AND SUNSET TIMES THROUGHOUT THE YEAR FIGURE
figure(1)

%Calculate the time of sunrise and sunset for each day in a year at a given
%altitude, latitude, and longitude
[num, Tsr, Tss] = calc_srss(z, la, lo);

%Sunrise plot
subplot(1,2,1)
plot(num, Tsr, '-k', 'Linewidth', 2)
%Format plot
xlim([1 365])
set(gca, 'Fontsize', 14)
title('Time of Sunrise for each Day of the Year')
xlabel('Day of the Year')
ylabel('Time of Sunrise [Hours]')

%Sunset plot
subplot(1,2,2)
plot(num, Tss, '-k', 'Linewidth', 2)
%Format plot
xlim([1 365])
set(gca, 'Fontsize', 14)
title('Time of Sunset for each Day of the Year')
xlabel('Day of the Year')
ylabel('Time of Sunset [Hours]')



%SOLAR ELEVATION DURING DAYLIGHT HOURS FIGURE
figure(2)

%Calculate the solar elevation at a given latitude and longitude for the
%daylight hours of a given day
[t, se] = calc_se(la, lo, Tsr(day), Tss(day), day);

plot(t, se, '-k', 'Linewidth', 2)
%Format plot
set (gca, 'Fontsize', 18)
title('Solar Elevation during Daylight Hours')
xlabel('Hours of Day from Sunrise to Sunset [Hour-Minute]')
ylabel('Solar Elevation [Degrees]')



%FIND SOLAR ELEVATION FOR EACH DAYLIGHT HOUR IN THE YEAR
T = [];    %Create a data set for daylight hours of a year
Days = []; %Create a data set for cooresponding day numbers for each time
Se = [];   %Create a data set for solar elevation at each time
for i = 1:365 %Loop for each day of the year
    [ti, sei] = calc_se(la, lo, Tsr(i), Tss(i), i); %Run calc_se each loop
    ti = dectohm(ti);                               %Convert time to GMT
    days = i.*ones(1, length(ti));                  %Find the size of days
    Days = [Days days];                             %Append days
    T = [T ti];                                     %Append times
    Se = [Se sei];                                  %Append solar elevation
end



%PRINT RESULTS TO A FILE

%Print solar elvation angles for each daylight hour of the year to a file
file_setxt = fopen('solar_elevation.txt', 'wt');
fprintf(file_setxt, 'Altitude:%6.2f Latitude:%6.2f Longitude:%6.2f\n',...
    z, la, lo);
fprintf(file_setxt, 'Day \t Time \t Elevation Angle\n');
fprintf(file_setxt, '%4.0f \t %5.0f \t %7.2f\n', [Days;T;Se]);

Tsr = round(dectohm(Tsr)); %Converts time of sunrise to GMT
Tss = round(dectohm(Tss)); %Converts time of sunset to GMT

%Print the sunrise and sunset times for each day in a year to a text file
file_srsstxt = fopen('sunrise_sunset_times.txt', 'wt');
fprintf(file_srsstxt, 'Altitude:%6.2f Latitude:%6.2f Longitude:%6.2f\n',...
    z, la, lo);
fprintf(file_srsstxt, 'Day \t Sunrise \t Sunset\n');
fprintf(file_srsstxt, '%4.0f \t %5.0f \t\t %5.0f\n', [num;Tsr;Tss]);