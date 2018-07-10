% program reads the soil temp and moisture
clear all


YEAR = input('Year:  ', 's');
year = eval(YEAR);

if year == 2004 || year == 2008 || year == 2012
   day_month = [0 31 60 91 121 152 182 213 244 274 305 335 366];
   for j = 1:17568
       time_new(j) = j/48 - 1/48 +1;
   end
else
   day_month = [0 31 59 90 120 151 181 212 243 273 304 334 365];
   for j = 1:17520
       time_new(j) = j/48 - 1/48 +1;
   end
end
   

% Read sun-data for uvb and uva for comparison
if     year == 2003, soil = load('/Users/boy/Documents/Michael/Hyyt/Soil/Hyytiala_soil_2003.txt');
elseif year == 2004, soil = load('/Users/boy/Documents/Michael/Hyyt/Soil/Hyytiala_soil_2004.txt');
elseif year == 2005, soil = load('/Users/boy/Documents/Michael/Hyyt/Soil/Hyytiala_soil_2005.txt');
elseif year == 2006, soil = load('/Users/boy/Documents/Michael/Hyyt/Soil/Hyytiala_soil_2006.txt');
elseif year == 2007, soil = load('/Users/boy/Documents/Michael/Hyyt/Soil/Hyytiala_soil_2007.txt');
elseif year == 2008, soil = load('/Users/boy/Documents/Michael/Hyyt/Soil/Hyytiala_soil_2008.txt');
elseif year == 2009, soil = load('/Users/boy/Documents/Michael/Hyyt/Soil/Hyytiala_soil_2009.txt');
elseif year == 2010, soil = load('/Users/boy/Documents/Michael/Hyyt/Soil/Hyytiala_soil_2010.txt');
elseif year == 2011, soil = load('/Users/boy/Documents/Michael/Hyyt/Soil/Hyytiala_soil_2011.txt'); 
elseif year == 2012, soil = load('/Users/boy/Documents/Michael/Hyyt/Soil/Hyytiala_soil_2012.txt');
elseif year == 2013, soil = load('/Users/boy/Documents/Michael/Hyyt/Soil/Hyytiala_soil_2013.txt');
elseif year == 2014, soil = load('/Users/boy/Documents/Michael/Hyyt/Soil/Hyytiala_soil_2014.txt'); end


% Soil moisture and temperature data
% 1  Year
% 2  Month
% 3  Day
% 4  Hour
% 5  Minute (midpoint of half-hour period)
% 6  Volumetric water content (m3/m3) in organic layer
% 7  Volumetric water content (m3/m3) in A horizon
% 8  Volumetric water content (m3/m3) in B horizon
% 9  Volumetric water content (m3/m3) in C horizon
% 10 Temperature in organic layer 
% 11 Temperature in A horizon 
% 12 Temperature in B horizon 
% 13 Temperature in C horizon
% 14 Soil heat flux plus soil heat storage change in the topsoil above the heat flux plates (W/m2)
 
% Soil temperature and moisture are spatially averaged from 5 vertical profiles
% Heat fluxes are means of 4 heat plates

% Depths of the soil layers, zero level at the mineral soil surface:
% O  -5...0 cm (above the mineral soil)
% A  0-5 cm
% B  5-23 cm 
% C  23-60 cm


for j = 1:length(soil)
    for k = 6:14
        if soil(j,k) == -9999
           soil(j,k) = NaN;
        end
        if soil(j,k) == -999
           soil(j,k) = NaN;
        end
    end
    time(j) = day_month(soil(j,2)) + soil(j,3) + soil(j,4)/24 + soil(j,5)/24/60;
end


% In 2004 some data points were -999 - short time interpolation
if year == 2004
   i = 1;
   for j = 1:length(soil)
       if isnan(soil(j,10)) == 0
          for k = 10:13
              soil_new(i,k) = soil(j,k);
          end
          time_2(i)   = time(j);
          i = i+1;
       end
   end
   for k = 10:13
       soil(:,k) = interp1(time_2, soil_new(:,k), time, 'linear');
       soil(:,k) = inter_sosa(soil(:,k), length(soil));
   end 
end


figure(1)
clf
hold on
plot(time, soil(:,6), 'r-');
plot(time, soil(:,7), 'g-');
plot(time, soil(:,8), 'b-');
plot(time, soil(:,9), 'k-');
L = legend(' -5...0 cm (organic layer)', ' 0-5 cm', ' 5-23 cm', ' 23-60 cm');
Y = ylabel('Volumetric water content [m3/m3]');
X = xlabel('Day of the Year');
T = title(['Soil moisture in year ', num2str(year)]);
set(T, 'fontsize', [20])
set(L, 'fontsize', [18])
set(Y, 'fontsize', [16])
set(X, 'fontsize', [16])


figure(2)
clf
hold on
plot(time, soil(:,10), 'r-');
plot(time, soil(:,11), 'g-');
plot(time, soil(:,12), 'b-');
plot(time, soil(:,13), 'k-');
L = legend(' -5...0 cm (organic layer)', ' 0-5 cm', ' 5-23 cm', ' 23-60 cm');
Y = ylabel('Temperature [^oC]');
X = xlabel('Day of the Year');
T = title(['Soil temperature in year ', num2str(year)]);
set(T, 'fontsize', [20])
set(L, 'fontsize', [18])
set(Y, 'fontsize', [16])
set(X, 'fontsize', [16])


figure(3)
clf
hold on
plot(time, soil(:,14), 'k-');
L = legend('Soil heat flux plus soil heat storage change in the topsoil above the heat flux plates');
Y = ylabel('Soil heat flux [W m^-^2]');
X = xlabel('Day of the Year');
T = title(['Soil heat flux in year ', num2str(year)]);
set(T, 'fontsize', [20])
set(L, 'fontsize', [18])
set(Y, 'fontsize', [16])
set(X, 'fontsize', [16])



for j = 1:12
    if year == 2014
       if     j == 1,   fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2014/data_input/M01/hyy_soil.txt','w');
       elseif j == 2,   fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2014/data_input/M02/hyy_soil.txt','w');
       elseif j == 3,   fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2014/data_input/M03/hyy_soil.txt','w');
       elseif j == 4,   fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2014/data_input/M04/hyy_soil.txt','w');
       elseif j == 5,   fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2014/data_input/M05/hyy_soil.txt','w');
       elseif j == 6,   fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2014/data_input/M06/hyy_soil.txt','w'); 
       elseif j == 7,   fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2014/data_input/M07/hyy_soil.txt','w');
       elseif j == 8,   fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2014/data_input/M08/hyy_soil.txt','w');
       elseif j == 9,   fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2014/data_input/M09/hyy_soil.txt','w');
       elseif j == 10,  fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2014/data_input/M10/hyy_soil.txt','w'); 
       elseif j == 11,  fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2014/data_input/M11/hyy_soil.txt','w');
       elseif j == 12,  fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2014/data_input/M12/hyy_soil.txt','w'); 
       end
    end    
    if year == 2013
       if     j == 1,   fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2013/data_input/M01/hyy_soil.txt','w');
       elseif j == 2,   fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2013/data_input/M02/hyy_soil.txt','w');
       elseif j == 3,   fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2013/data_input/M03/hyy_soil.txt','w');
       elseif j == 4,   fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2013/data_input/M04/hyy_soil.txt','w');
       elseif j == 5,   fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2013/data_input/M05/hyy_soil.txt','w');
       elseif j == 6,   fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2013/data_input/M06/hyy_soil.txt','w'); 
       elseif j == 7,   fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2013/data_input/M07/hyy_soil.txt','w');
       elseif j == 8,   fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2013/data_input/M08/hyy_soil.txt','w');
       elseif j == 9,   fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2013/data_input/M09/hyy_soil.txt','w');
       elseif j == 10,  fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2013/data_input/M10/hyy_soil.txt','w'); 
       elseif j == 11,  fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2013/data_input/M11/hyy_soil.txt','w');
       elseif j == 12,  fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2013/data_input/M12/hyy_soil.txt','w'); 
       end
    end    
    if year == 2012
       if     j == 1,   fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2012/data_input/M01/hyy_soil.txt','w');
       elseif j == 2,   fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2012/data_input/M02/hyy_soil.txt','w');
       elseif j == 3,   fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2012/data_input/M03/hyy_soil.txt','w');
       elseif j == 4,   fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2012/data_input/M04/hyy_soil.txt','w');
       elseif j == 5,   fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2012/data_input/M05/hyy_soil.txt','w');
       elseif j == 6,   fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2012/data_input/M06/hyy_soil.txt','w'); 
       elseif j == 7,   fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2012/data_input/M07/hyy_soil.txt','w');
       elseif j == 8,   fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2012/data_input/M08/hyy_soil.txt','w');
       elseif j == 9,   fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2012/data_input/M09/hyy_soil.txt','w');
       elseif j == 10,  fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2012/data_input/M10/hyy_soil.txt','w'); 
       elseif j == 11,  fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2012/data_input/M11/hyy_soil.txt','w');
       elseif j == 12,  fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2012/data_input/M12/hyy_soil.txt','w'); 
       end
    end    
    if year == 2011
       if     j == 1,   fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2011/data_input/M01/hyy_soil.txt','w');
       elseif j == 2,   fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2011/data_input/M02/hyy_soil.txt','w');
       elseif j == 3,   fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2011/data_input/M03/hyy_soil.txt','w');
       elseif j == 4,   fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2011/data_input/M04/hyy_soil.txt','w');
       elseif j == 5,   fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2011/data_input/M05/hyy_soil.txt','w');
       elseif j == 6,   fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2011/data_input/M06/hyy_soil.txt','w'); 
       elseif j == 7,   fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2011/data_input/M07/hyy_soil.txt','w');
       elseif j == 8,   fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2011/data_input/M08/hyy_soil.txt','w');
       elseif j == 9,   fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2011/data_input/M09/hyy_soil.txt','w');
       elseif j == 10,  fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2011/data_input/M10/hyy_soil.txt','w'); 
       elseif j == 11,  fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2011/data_input/M11/hyy_soil.txt','w');
       elseif j == 12,  fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2011/data_input/M12/hyy_soil.txt','w'); 
       end
    end    
    if year == 2010
       if     j == 1,   fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2010/data_input/M01/hyy_soil.txt','w');
       elseif j == 2,   fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2010/data_input/M02/hyy_soil.txt','w');
       elseif j == 3,   fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2010/data_input/M03/hyy_soil.txt','w');
       elseif j == 4,   fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2010/data_input/M04/hyy_soil.txt','w');
       elseif j == 5,   fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2010/data_input/M05/hyy_soil.txt','w');
       elseif j == 6,   fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2010/data_input/M06/hyy_soil.txt','w'); 
       elseif j == 7,   fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2010/data_input/M07/hyy_soil.txt','w');
       elseif j == 8,   fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2010/data_input/M08/hyy_soil.txt','w');
       elseif j == 9,   fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2010/data_input/M09/hyy_soil.txt','w');
       elseif j == 10,  fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2010/data_input/M10/hyy_soil.txt','w'); 
       elseif j == 11,  fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2010/data_input/M11/hyy_soil.txt','w');
       elseif j == 12,  fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2010/data_input/M12/hyy_soil.txt','w'); 
       end
    end

    if year == 2009
       if     j == 1,   fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2009/data_input/M01/hyy_soil.txt','w');
       elseif j == 2,   fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2009/data_input/M02/hyy_soil.txt','w');
       elseif j == 3,   fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2009/data_input/M03/hyy_soil.txt','w');
       elseif j == 4,   fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2009/data_input/M04/hyy_soil.txt','w');
       elseif j == 5,   fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2009/data_input/M05/hyy_soil.txt','w');
       elseif j == 6,   fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2009/data_input/M06/hyy_soil.txt','w'); 
       elseif j == 7,   fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2009/data_input/M07/hyy_soil.txt','w');
       elseif j == 8,   fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2009/data_input/M08/hyy_soil.txt','w');
       elseif j == 9,   fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2009/data_input/M09/hyy_soil.txt','w');
       elseif j == 10,  fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2009/data_input/M10/hyy_soil.txt','w'); 
       elseif j == 11,  fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2009/data_input/M11/hyy_soil.txt','w');
       elseif j == 12,  fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2009/data_input/M12/hyy_soil.txt','w'); 
       end
    end

    if year == 2008
       if     j == 1,   fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2008/data_input/M01/hyy_soil.txt','w');
       elseif j == 2,   fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2008/data_input/M02/hyy_soil.txt','w');
       elseif j == 3,   fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2008/data_input/M03/hyy_soil.txt','w');
       elseif j == 4,   fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2008/data_input/M04/hyy_soil.txt','w');
       elseif j == 5,   fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2008/data_input/M05/hyy_soil.txt','w');
       elseif j == 6,   fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2008/data_input/M06/hyy_soil.txt','w'); 
       elseif j == 7,   fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2008/data_input/M07/hyy_soil.txt','w');
       elseif j == 8,   fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2008/data_input/M08/hyy_soil.txt','w');
       elseif j == 9,   fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2008/data_input/M09/hyy_soil.txt','w');
       elseif j == 10,  fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2008/data_input/M10/hyy_soil.txt','w'); 
       elseif j == 11,  fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2008/data_input/M11/hyy_soil.txt','w');
       elseif j == 12,  fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2008/data_input/M12/hyy_soil.txt','w'); 
       end
    end

    if year == 2007
       if     j == 1,   fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2007/data_input/M01/hyy_soil.txt','w');
       elseif j == 2,   fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2007/data_input/M02/hyy_soil.txt','w');
       elseif j == 3,   fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2007/data_input/M03/hyy_soil.txt','w');
       elseif j == 4,   fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2007/data_input/M04/hyy_soil.txt','w');
       elseif j == 5,   fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2007/data_input/M05/hyy_soil.txt','w');
       elseif j == 6,   fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2007/data_input/M06/hyy_soil.txt','w');
       elseif j == 7,   fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2007/data_input/M07/hyy_soil.txt','w');
       elseif j == 8,   fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2007/data_input/M08/hyy_soil.txt','w');
       elseif j == 9,   fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2007/data_input/M09/hyy_soil.txt','w');
       elseif j == 10,  fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2007/data_input/M10/hyy_soil.txt','w');
       elseif j == 11,  fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2007/data_input/M11/hyy_soil.txt','w');
       elseif j == 12,  fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2007/data_input/M12/hyy_soil.txt','w'); end
    end

    if year == 2006
       if     j == 1,  fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2006/data_input/M01/hyy_soil.txt','w');
       elseif j == 2,  fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2006/data_input/M02/hyy_soil.txt','w');
       elseif j == 3,  fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2006/data_input/M03/hyy_soil.txt','w');
       elseif j == 4,  fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2006/data_input/M04/hyy_soil.txt','w');
       elseif j == 5,  fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2006/data_input/M05/hyy_soil.txt','w');
       elseif j == 6,  fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2006/data_input/M06/hyy_soil.txt','w');
       elseif j == 7,  fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2006/data_input/M07/hyy_soil.txt','w'); 
       elseif j == 8,  fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2006/data_input/M08/hyy_soil.txt','w'); 
       elseif j == 9,  fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2006/data_input/M09/hyy_soil.txt','w'); 
       elseif j == 10, fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2006/data_input/M10/hyy_soil.txt','w'); 
       elseif j == 11, fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2006/data_input/M11/hyy_soil.txt','w'); 
       elseif j == 12, fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2006/data_input/M12/hyy_soil.txt','w'); end
    end

    if year == 2005
       if     j == 1,  fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2005/data_input/M01/hyy_soil.txt','w');
       elseif j == 2,  fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2005/data_input/M02/hyy_soil.txt','w');
       elseif j == 3,  fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2005/data_input/M03/hyy_soil.txt','w');
       elseif j == 4,  fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2005/data_input/M04/hyy_soil.txt','w');
       elseif j == 5,  fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2005/data_input/M05/hyy_soil.txt','w');
       elseif j == 6,  fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2005/data_input/M06/hyy_soil.txt','w');
       elseif j == 7,  fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2005/data_input/M07/hyy_soil.txt','w'); 
       elseif j == 8,  fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2005/data_input/M08/hyy_soil.txt','w'); 
       elseif j == 9,  fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2005/data_input/M09/hyy_soil.txt','w'); 
       elseif j == 10, fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2005/data_input/M10/hyy_soil.txt','w'); 
       elseif j == 11, fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2005/data_input/M11/hyy_soil.txt','w'); 
       elseif j == 12, fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2005/data_input/M12/hyy_soil.txt','w'); end
    end

    if year == 2004
       if     j == 1,  fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2004/data_input/M01/hyy_soil.txt','w');
       elseif j == 2,  fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2004/data_input/M02/hyy_soil.txt','w');
       elseif j == 3,  fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2004/data_input/M03/hyy_soil.txt','w');
       elseif j == 4,  fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2004/data_input/M04/hyy_soil.txt','w');
       elseif j == 5,  fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2004/data_input/M05/hyy_soil.txt','w');
       elseif j == 6,  fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2004/data_input/M06/hyy_soil.txt','w');
       elseif j == 7,  fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2004/data_input/M07/hyy_soil.txt','w'); 
       elseif j == 8,  fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2004/data_input/M08/hyy_soil.txt','w'); 
       elseif j == 9,  fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2004/data_input/M09/hyy_soil.txt','w'); 
       elseif j == 10, fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2004/data_input/M10/hyy_soil.txt','w'); 
       elseif j == 11, fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2004/data_input/M11/hyy_soil.txt','w'); 
       elseif j == 12, fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2004/data_input/M12/hyy_soil.txt','w'); end
    end

    if year == 2003
       if     j == 1,  fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2003/data_input/M01/hyy_soil.txt','w');
       elseif j == 2,  fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2003/data_input/M02/hyy_soil.txt','w');
       elseif j == 3,  fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2003/data_input/M03/hyy_soil.txt','w');
       elseif j == 4,  fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2003/data_input/M04/hyy_soil.txt','w');
       elseif j == 5,  fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2003/data_input/M05/hyy_soil.txt','w');
       elseif j == 6,  fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2003/data_input/M06/hyy_soil.txt','w');
       elseif j == 7,  fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2003/data_input/M07/hyy_soil.txt','w'); 
       elseif j == 8,  fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2003/data_input/M08/hyy_soil.txt','w'); 
       elseif j == 9,  fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2003/data_input/M09/hyy_soil.txt','w'); 
       elseif j == 10, fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2003/data_input/M10/hyy_soil.txt','w'); 
       elseif j == 11, fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2003/data_input/M11/hyy_soil.txt','w'); 
       elseif j == 12, fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2003/data_input/M12/hyy_soil.txt','w'); end
    end
    
    for i = (1+day_month(j)*48): (day_month(j+1)*48)
        fprintf (fid1, '%15.6f',  time(i));     % 1  date and time
        fprintf (fid1, '%15.6f',  soil(i,6));   % 2  Volumetric water content (m3/m3) in organic layer in -5-0 cm
        fprintf (fid1, '%15.6f',  soil(i,7));   % 3  Volumetric water content (m3/m3) in 0-5 cm 
        fprintf (fid1, '%15.6f',  soil(i,8));   % 4  Volumetric water content (m3/m3) in 5-23 cm
        fprintf (fid1, '%15.6f',  soil(i,9));   % 5  Volumetric water content (m3/m3) in 23-60 cm
        fprintf (fid1, '%15.6f',  soil(i,10));  % 6  Temperature in organic layer in -5-0 cm
        fprintf (fid1, '%15.6f',  soil(i,11));  % 7  Temperature in 0-5 cm
        fprintf (fid1, '%15.6f',  soil(i,12));  % 8  Temperature in 5-23 cm
        fprintf (fid1, '%15.6f',  soil(i,13));  % 9  Temperature in 23-60 cm
        %fprintf (fid1, '%15.6f',  soil(i,14));  % 10 Soil heat flux plus soil heat storage change in the topsoil above the heat flux plates
        fprintf (fid1, '\n');  
    end
   
end

for j = 1:length(time)
    for k = 6:13
        if isnan(soil(j,k)) == 1
           j, k
        end
    end
end
length(time)    
        
        
        
        
        
        
        
        
        
        
        

