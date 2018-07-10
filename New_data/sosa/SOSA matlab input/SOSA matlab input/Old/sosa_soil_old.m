% program reads the soil temp and moisture


readin = 1;

%*****************************************************************************************************************************************
%*****************************************************************************************************************************************
%*****************************************************************************************************************************************

if readin == 1
   clear soil soil_mois soil_temp rain time SOIL_MOIS SOIL_TEMP soil_final soil_finalT RAIN rain_final time_new

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
   if     year == 2003, soil = load('C:\HY-data\BOY\documents\Hyyt\Soil\\SMEAR_II_soil_halfhourly_2003.txt');
   elseif year == 2004, soil = load('C:\HY-data\BOY\documents\Hyyt\Soil\\SMEAR_II_soil_halfhourly_2004.txt');
   elseif year == 2005, soil = load('C:\HY-data\BOY\documents\Hyyt\Soil\\SMEAR_II_soil_halfhourly_2005.txt');
   elseif year == 2006, soil = load('C:\HY-data\BOY\documents\Hyyt\Soil\\SMEAR_II_soil_halfhourly_2006.txt');
   elseif year == 2007, soil = load('C:\HY-data\BOY\documents\Hyyt\Soil\\SMEAR_II_soil_halfhourly_2007.txt');
   elseif year == 2008, soil = load('C:\HY-data\BOY\documents\Hyyt\Soil\\SMEAR_II_soil_halfhourly_2008.txt');
   elseif year == 2009, soil = load('C:\HY-data\BOY\documents\Hyyt\Soil\\SMEAR_II_soil_halfhourly_2009.txt');
   elseif year == 2010, soil = load('C:\HY-data\BOY\documents\Hyyt\Soil\\SMEAR_II_soil_halfhourly_2010.txt');
   elseif year == 2011, soil = load('C:\HY-data\BOY\documents\Hyyt\Soil\\SMEAR_II_soil_halfhourly_2011.txt'); end


   % Soil moisture and temperature data
   % Moisture unit is m3 H2O per m3 soil
   % The column headers should be self-explanatory, (2) in TDR data refers to so called small catchment area.
   % In some files the missing data is interpolated, in some files not. Also the layer heights in the files may differ.
   % Measurement depths at the top of the mineral soil:

   % Moisture (TDR):
   % H           above
   % A           2-6 cm
   % B = B1      14-25 cm 
   % B2 = C1a    26-36 cm
   % C1          43-49 cm
   % C2          56-65 cm
   % C3          68-85 cm
   % C23         47-68 cm

   % Temperature (T):
   % H           above
   % A           2-5 cm
   % B = B1      9-14 cm 
   % B2 = C1a    22-29 cm
   % C1          42-58 cm
   % C2 = C3     66-90 cm
   % C           55-68 cm

   %      1     2      3    4     5    6      7      8       9       10      11      12      13        14        15        16        17     18    19    20    21    22    23   
   %2003: Year  Month  Day  Hour  Min  H      A      B       C1a     C23     A(2)    B(2)    C(2)      T_H       T_A       T_B       T_C1a  T_C2  Rain
   %2004: Year  Month  Day  Hour  Min  H      A      B       C1a     C23     A(2)    B(2)    C(2)      T_H       T_A       T_B       T_C1a  T_C2  Rain
   %2005: Year  Month  Day  Hour  Min  TDR_H  TDR_A  TDR_B1  TDR_B2  TDR_C1  TDR_C2  TDR_C3  TDR_H(2)  TDR_A(2)  TDR_B(2)  TDR_C(2)  T_H    T_A   T_B1  T_B2  T_C1  T_C3  Rain
   %2006: Year  Month  Day  Hour  Min  TDR_H  TDR_A  TDR_B1  TDR_B2  TDR_C1  TDR_C2  TDR_C3  TDR_H(2)  TDR_A(2)  TDR_B(2)  TDR_C(2)  T_H    T_A   T_B1  T_B2  T_C1  T_C3  Rain
   %2007: Year  Month  Day  Hour  Min  TDR_H  TDR_A  TDR_B1  TDR_B2  TDR_C1  TDR_C2  TDR_C3  TDR_H(2)  TDR_A(2)  TDR_B(2)  TDR_C(2)  T_H    T_A   T_B1  T_B2  T_C1  T_C3  Rain
   %2008: Year  Month  Day  Hour  Min  TDR_H  TDR_A  TDR_B1  TDR_B2  TDR_C1  TDR_C2  TDR_C3  TDR_H(2)  TDR_A(2)  TDR_B(2)  TDR_C(2)  T_H    T_A   T_B1  T_B2  T_C1  T_C3  Rain
   %2009: Year  Month  Day  Hour  Min  TDR_H  TDR_A  TDR_B1  TDR_B2  TDR_C1  TDR_C2  TDR_C3  TDR_H(2)  TDR_A(2)  TDR_B(2)  TDR_C(2)  T_H    T_A   T_B1  T_B2  T_C1  T_C3  Rain
   %2010: Year  Month  Day  Hour  Min  TDR_H  TDR_A  TDR_B1  TDR_B2  TDR_C1  TDR_C2  TDR_C3  TDR_H(2)  TDR_A(2)  TDR_B(2)  TDR_C(2)  T_H    T_A   T_B1  T_B2  T_C1  T_C3  Rain


   for j = 1:length(soil)
       
       if year == 2003 || year == 2004
          k_soil = 8;
          k_temp = 5;
          for k = 6:18
              if soil(j,k) == -999
                 soil(j,k) = NaN;
              end
          end
       else
          k_soil = 12;
          k_temp = 6;
          for k = 6:22
              if soil(j,k) == -9999
                 soil(j,k) = NaN;
              end
          end
       end
       
       time(j) = day_month(soil(j,2)) + soil(j,3) + soil(j,4)/24 + soil(j,5)/24/60;
    
       if year == 2003 || year == 2004
          soil_mois(j,1) = soil(j,6);  % above
          soil_mois(j,2) = soil(j,7);  % 2-6 cm
          soil_mois(j,3) = soil(j,8);  % 14-25 cm
          soil_mois(j,4) = soil(j,9);  % 26-36 cm 
          soil_mois(j,5) = soil(j,10); % 47-68 cm
          soil_mois(j,6) = soil(j,11); % 2-6 cm
          soil_mois(j,7) = soil(j,12); % 14-25 cm
          soil_mois(j,8) = soil(j,13); % ? cm 
       
       else
          soil_mois(j,1)  = soil(j,6);  % above 
          soil_mois(j,2)  = soil(j,7);  % 2-6 cm 
          soil_mois(j,3)  = soil(j,8);  % 14-25 cm
          soil_mois(j,4)  = soil(j,9);  % 26-36 cm 
          soil_mois(j,5)  = (soil(j,11) + soil(j,12)) / 2; % average 43-49 + 56-65   
          soil_mois(j,6)  = soil(j,14); % 2-6 cm 
          soil_mois(j,7)  = soil(j,15); % 14-25 cm 
          soil_mois(j,8)  = soil(j,16); % ? cm 
          soil_mois(j,9)  = soil(j,10); % 43-49 cm 
          soil_mois(j,10) = soil(j,11); % 56-65 cm 
          soil_mois(j,11) = soil(j,12); % 68-85 cm 
          soil_mois(j,12) = soil(j,13); % above 
       end

       if year == 2003 || year == 2004
          soil_temp(j,1) = soil(j,14); % above
          soil_temp(j,2) = soil(j,15); % 2-5 cm
          soil_temp(j,3) = soil(j,16); % 9-14 cm
          soil_temp(j,4) = soil(j,17); % 22-29 cm
          soil_temp(j,5) = soil(j,18); % 66-90 cm
       else
          soil_temp(j,1) = soil(j,17); % above
          soil_temp(j,2) = soil(j,18); % 2-5 cm
          soil_temp(j,3) = soil(j,19); % 9-14 cm
          soil_temp(j,4) = soil(j,20); % 22-29 cm
          soil_temp(j,5) = soil(j,22); % 66-90 cm
          soil_temp(j,6) = soil(j,21); % 42-58 cm
       end       

       if year == 2003 || year == 2004
          rain(j) = soil(j,19);
       else
          rain(j) = soil(j,23);
       end
   end

   
   
   % Interpolation for half hour time step
   for k = 1:k_soil
       i = 1;
       clear soil_int time_int
       for j = 1:length(soil_mois)
           if isnan(soil_mois(j,k)) == 0
              soil_int(i) = soil_mois(j,k);
              time_int(i) = time(j);
              i = i+1;
           end
       end
       SOIL_MOIS(:,k) = interp1(time_int, soil_int, time_new, 'linear');
   end
   
   for k = 1:k_temp
       i = 1;
       clear soil_int time_int
       for j = 1:length(soil_temp)
           if isnan(soil_temp(j,k)) == 0
              soil_int(i) = soil_temp(j,k);
              time_int(i) = time(j);
              i = i+1;
           end
       end
       SOIL_TEMP(:,k) = interp1(time_int, soil_int, time_new, 'linear');
   end
   
   i = 1;
   clear soil_int time_int
   for j = 1:length(rain)
       if isnan(rain(j)) == 0
          soil_int(i) = rain(j);
          time_int(i) = time(j);
          i = i+1;
       end
   end
   RAIN = interp1(time_int, soil_int, time_new, 'linear');
end


% Interpolation for missing data
for k = 1:k_soil
    soil_final(:,k) = inter_sosa(SOIL_MOIS(:,k), length(SOIL_MOIS));
    soil_final(1,k) = SOIL_MOIS(2,k);
    soil_final(length(SOIL_MOIS),k) = SOIL_MOIS(length(SOIL_MOIS)-1,k);
end
for k = 1:k_temp
    soil_finalT(:,k) = inter_sosa(SOIL_TEMP(:,k), length(SOIL_TEMP));
    soil_finalT(1,k) = SOIL_TEMP(2,k);
    soil_finalT(length(SOIL_TEMP),k) = SOIL_TEMP(length(SOIL_TEMP)-1,k);
end
rain_final = inter_sosa(RAIN, length(RAIN));
rain_final(1) = RAIN(2);
rain_final(length(RAIN)) = RAIN(length(RAIN)-1);


% Missing data for each single year
if year == 2010
   soil_final(17517,5) = soil_final(17516,5);
   soil_final(17518,5) = soil_final(17516,5);
   soil_final(17519,5) = soil_final(17516,5);
   soil_final(17520,5) = soil_final(17516,5);
end
if year == 2009
   for i = 1:11,  soil_final(i,1)  = soil_final(12,1); end
   for i = 1:24,  soil_final(i,2)  = soil_final(25,2); end
   for i = 1:23,  soil_final(i,3)  = soil_final(24,3); end
   for i = 1:16,  soil_final(i,4)  = soil_final(17,4); end
   for i = 1:63,  soil_final(i,5)  = soil_final(64,5); end
   for i = 1:128, soil_finalT(i,2) = soil_finalT(129,2); end
   soil_final(17519,1) = soil_final(17518,2);
   soil_final(17520,1) = soil_final(17518,2);
end
if year == 2008
   for i = 1:21,  soil_final(i,1)  = soil_final(22,1); end
   for i = 1:14,  soil_final(i,3)  = soil_final(15,3); end
   for i = 1:21,  soil_final(i,4)  = soil_final(22,4); end
   for i = 1:81,  soil_final(i,5)  = soil_final(82,5); end
   for i = 17512:17568,  soil_final(i,1)  = soil_final(17511,1); end
   for i = 17512:17568,  soil_final(i,2)  = soil_final(17511,2); end
   for i = 17371:17568,  soil_final(i,3)  = soil_final(17370,3); end
   for i = 17300:17568,  soil_final(i,4)  = soil_final(17299,4); end
   for i = 16516:17568,  soil_final(i,5)  = soil_final(16515,5); end
   for i = 17555:17568,  soil_finalT(i,2) = soil_finalT(17554,2); end
end
if year == 2007
   for i = 1:2,    soil_final(i,2)  = soil_final(3,2); end
   for i = 1:367,  soil_final(i,5)  = soil_final(368,5); end
   for i = 17514:17520,  soil_final(i,1)  = soil_final(17513,1); end
   for i = 17512:17520,  soil_final(i,3)  = soil_final(17311,3); end
   for i = 17512:17520,  soil_final(i,4)  = soil_final(17511,4); end
   for i = 17504:17520,  soil_final(i,5)  = soil_final(17503,5); end
end
if year == 2006
   for i = 1:3,    soil_final(i,2)  = soil_final(4,2); end
   for i = 1:130,  soil_final(i,5)  = soil_final(131,5); end
   for i = 17519:17520,  soil_final(i,1)  = soil_final(17518,1); end
   for i = 17518:17520,  soil_final(i,2)  = soil_final(17317,2); end
   for i = 17518:17520,  soil_final(i,3)  = soil_final(17317,3); end
   for i = 17517:17520,  soil_final(i,4)  = soil_final(17516,4); end
   for i = 16994:17520,  soil_final(i,5)  = soil_final(16993,5); end
end


figure(1)
clf
hold on
plot(time_new, soil_final(:,1), 'r-');
plot(time_new, soil_final(:,2), 'g-');
plot(time_new, soil_final(:,3), 'c-');
plot(time_new, soil_final(:,4), 'b-');
plot(time_new, soil_final(:,5), 'k-');
%plot(time_new, soil_final(:,6), 'g--');
%plot(time_new, soil_final(:,7), 'c--');
%plot(time_new, soil_final(:,8), 'k--');
L = legend('above', '2-6 cm', '14-25 cm', '26-36 cm', '47-68 cm');    
Y = ylabel('Soil moisture [m^3 H_2O per m^3 soil]');
X = xlabel('Day of the Year');
set(L, 'fontsize', [18])
set(Y, 'fontsize', [16])
set(X, 'fontsize', [16])



figure(2)
clf
hold on
plot(time_new, soil_finalT(:,1), 'r-');
plot(time_new, soil_finalT(:,2), 'g-');
plot(time_new, soil_finalT(:,3), 'c-');
plot(time_new, soil_finalT(:,4), 'b-');
plot(time_new, soil_finalT(:,5), 'k-');
L = legend('above', '2-5 cm', '9-14 cm', '22-29 cm', '66-90 cm');    
Y = ylabel('Soil temperature [^oC]');
X = xlabel('Day of the Year');
set(L, 'fontsize', [18])
set(Y, 'fontsize', [16])
set(X, 'fontsize', [16])


figure(3)
clf
hold on
plot(time_new, rain_final, 'b-');
L = legend('rain fall');    
Y = ylabel('Rain fall [mm per m^3]');
X = xlabel('Day of the Year');
set(L, 'fontsize', [18])
set(Y, 'fontsize', [16])
set(X, 'fontsize', [16])


for j = 1:12
    if year == 2011
       if     j == 1,   fid1 = fopen('c://HY-data//BOY//documents//sosa_in/year//2011//data_input//M01//hyy_soil.txt','w');
       elseif j == 2,   fid1 = fopen('c://HY-data//BOY//documents//sosa_in/year//2011//data_input//M02//hyy_soil.txt','w');
       elseif j == 3,   fid1 = fopen('c://HY-data//BOY//documents//sosa_in/year//2011//data_input//M03//hyy_soil.txt','w');
       elseif j == 4,   fid1 = fopen('c://HY-data//BOY//documents//sosa_in/year//2011//data_input//M04//hyy_soil.txt','w');
       elseif j == 5,   fid1 = fopen('c://HY-data//BOY//documents//sosa_in/year//2011//data_input//M05//hyy_soil.txt','w');
       elseif j == 6,   fid1 = fopen('c://HY-data//BOY//documents//sosa_in/year//2011//data_input//M06//hyy_soil.txt','w'); 
       elseif j == 7,   fid1 = fopen('c://HY-data//BOY//documents//sosa_in/year//2011//data_input//M07//hyy_soil.txt','w');
       elseif j == 8,   fid1 = fopen('c://HY-data//BOY//documents//sosa_in/year//2011//data_input//M08//hyy_soil.txt','w');
       elseif j == 9,   fid1 = fopen('c://HY-data//BOY//documents//sosa_in/year//2011//data_input//M09//hyy_soil.txt','w');
       elseif j == 10,  fid1 = fopen('c://HY-data//BOY//documents//sosa_in/year//2011//data_input//M10//hyy_soil.txt','w'); 
       elseif j == 11,  fid1 = fopen('c://HY-data//BOY//documents//sosa_in/year//2011//data_input//M11//hyy_soil.txt','w');
       elseif j == 12,  fid1 = fopen('c://HY-data//BOY//documents//sosa_in/year//2011//data_input//M12//hyy_soil.txt','w'); 
       end
    end    
    if year == 2010
       if     j == 1,   fid1 = fopen('c://HY-data//BOY//documents//sosa_in/year//2010//data_input//M01//hyy_soil.txt','w');
       elseif j == 2,   fid1 = fopen('c://HY-data//BOY//documents//sosa_in/year//2010//data_input//M02//hyy_soil.txt','w');
       elseif j == 3,   fid1 = fopen('c://HY-data//BOY//documents//sosa_in/year//2010//data_input//M03//hyy_soil.txt','w');
       elseif j == 4,   fid1 = fopen('c://HY-data//BOY//documents//sosa_in/year//2010//data_input//M04//hyy_soil.txt','w');
       elseif j == 5,   fid1 = fopen('c://HY-data//BOY//documents//sosa_in/year//2010//data_input//M05//hyy_soil.txt','w');
       elseif j == 6,   fid1 = fopen('c://HY-data//BOY//documents//sosa_in/year//2010//data_input//M06//hyy_soil.txt','w'); 
       elseif j == 7,   fid1 = fopen('c://HY-data//BOY//documents//sosa_in/year//2010//data_input//M07//hyy_soil.txt','w');
       elseif j == 8,   fid1 = fopen('c://HY-data//BOY//documents//sosa_in/year//2010//data_input//M08//hyy_soil.txt','w');
       elseif j == 9,   fid1 = fopen('c://HY-data//BOY//documents//sosa_in/year//2010//data_input//M09//hyy_soil.txt','w');
       elseif j == 10,  fid1 = fopen('c://HY-data//BOY//documents//sosa_in/year//2010//data_input//M10//hyy_soil.txt','w'); 
       elseif j == 11,  fid1 = fopen('c://HY-data//BOY//documents//sosa_in/year//2010//data_input//M11//hyy_soil.txt','w');
       elseif j == 12,  fid1 = fopen('c://HY-data//BOY//documents//sosa_in/year//2010//data_input//M12//hyy_soil.txt','w'); 
       end
    end

    if year == 2009
       if     j == 1,   fid1 = fopen('c://HY-data//BOY//documents//sosa_in/year//2009//data_input//M01//hyy_soil.txt','w');
       elseif j == 2,   fid1 = fopen('c://HY-data//BOY//documents//sosa_in/year//2009//data_input//M02//hyy_soil.txt','w');
       elseif j == 3,   fid1 = fopen('c://HY-data//BOY//documents//sosa_in/year//2009//data_input//M03//hyy_soil.txt','w');
       elseif j == 4,   fid1 = fopen('c://HY-data//BOY//documents//sosa_in/year//2009//data_input//M04//hyy_soil.txt','w');
       elseif j == 5,   fid1 = fopen('c://HY-data//BOY//documents//sosa_in/year//2009//data_input//M05//hyy_soil.txt','w');
       elseif j == 6,   fid1 = fopen('c://HY-data//BOY//documents//sosa_in/year//2009//data_input//M06//hyy_soil.txt','w'); 
       elseif j == 7,   fid1 = fopen('c://HY-data//BOY//documents//sosa_in/year//2009//data_input//M07//hyy_soil.txt','w');
       elseif j == 8,   fid1 = fopen('c://HY-data//BOY//documents//sosa_in/year//2009//data_input//M08//hyy_soil.txt','w');
       elseif j == 9,   fid1 = fopen('c://HY-data//BOY//documents//sosa_in/year//2009//data_input//M09//hyy_soil.txt','w');
       elseif j == 10,  fid1 = fopen('c://HY-data//BOY//documents//sosa_in/year//2009//data_input//M10//hyy_soil.txt','w'); 
       elseif j == 11,  fid1 = fopen('c://HY-data//BOY//documents//sosa_in/year//2009//data_input//M11//hyy_soil.txt','w');
       elseif j == 12,  fid1 = fopen('c://HY-data//BOY//documents//sosa_in/year//2009//data_input//M12//hyy_soil.txt','w'); 
       end
    end

    if year == 2008
       if     j == 1,   fid1 = fopen('c://HY-data//BOY//documents//sosa_in/year//2008//data_input//M01//hyy_soil.txt','w');
       elseif j == 2,   fid1 = fopen('c://HY-data//BOY//documents//sosa_in/year//2008//data_input//M02//hyy_soil.txt','w');
       elseif j == 3,   fid1 = fopen('c://HY-data//BOY//documents//sosa_in/year//2008//data_input//M03//hyy_soil.txt','w');
       elseif j == 4,   fid1 = fopen('c://HY-data//BOY//documents//sosa_in/year//2008//data_input//M04//hyy_soil.txt','w');
       elseif j == 5,   fid1 = fopen('c://HY-data//BOY//documents//sosa_in/year//2008//data_input//M05//hyy_soil.txt','w');
       elseif j == 6,   fid1 = fopen('c://HY-data//BOY//documents//sosa_in/year//2008//data_input//M06//hyy_soil.txt','w'); 
       elseif j == 7,   fid1 = fopen('c://HY-data//BOY//documents//sosa_in/year//2008//data_input//M07//hyy_soil.txt','w');
       elseif j == 8,   fid1 = fopen('c://HY-data//BOY//documents//sosa_in/year//2008//data_input//M08//hyy_soil.txt','w');
       elseif j == 9,   fid1 = fopen('c://HY-data//BOY//documents//sosa_in/year//2008//data_input//M09//hyy_soil.txt','w');
       elseif j == 10,  fid1 = fopen('c://HY-data//BOY//documents//sosa_in/year//2008//data_input//M10//hyy_soil.txt','w'); 
       elseif j == 11,  fid1 = fopen('c://HY-data//BOY//documents//sosa_in/year//2008//data_input//M11//hyy_soil.txt','w');
       elseif j == 12,  fid1 = fopen('c://HY-data//BOY//documents//sosa_in/year//2008//data_input//M12//hyy_soil.txt','w'); 
       end
    end

    if year == 2007
       if     j == 1,   fid1 = fopen('c://HY-data//BOY//documents//sosa_in/year//2007//data_input//M01//hyy_soil.txt','w');
       elseif j == 2,   fid1 = fopen('c://HY-data//BOY//documents//sosa_in/year//2007//data_input//M02//hyy_soil.txt','w');
       elseif j == 3,   fid1 = fopen('c://HY-data//BOY//documents//sosa_in/year//2007//data_input//M03//hyy_soil.txt','w');
       elseif j == 4,   fid1 = fopen('c://HY-data//BOY//documents//sosa_in/year//2007//data_input//M04//hyy_soil.txt','w');
       elseif j == 5,   fid1 = fopen('c://HY-data//BOY//documents//sosa_in/year//2007//data_input//M05//hyy_soil.txt','w');
       elseif j == 6,   fid1 = fopen('c://HY-data//BOY//documents//sosa_in/year//2007//data_input//M06//hyy_soil.txt','w');
       elseif j == 7,   fid1 = fopen('c://HY-data//BOY//documents//sosa_in/year//2007//data_input//M07//hyy_soil.txt','w');
       elseif j == 8,   fid1 = fopen('c://HY-data//BOY//documents//sosa_in/year//2007//data_input//M08//hyy_soil.txt','w');
       elseif j == 9,   fid1 = fopen('c://HY-data//BOY//documents//sosa_in/year//2007//data_input//M09//hyy_soil.txt','w');
       elseif j == 10,  fid1 = fopen('c://HY-data//BOY//documents//sosa_in/year//2007//data_input//M10//hyy_soil.txt','w');
       elseif j == 11,  fid1 = fopen('c://HY-data//BOY//documents//sosa_in/year//2007//data_input//M11//hyy_soil.txt','w');
       elseif j == 12,  fid1 = fopen('c://HY-data//BOY//documents//sosa_in/year//2007//data_input//M12//hyy_soil.txt','w'); end
    end

    if year == 2006
       if     j == 1,  fid1 = fopen('c://HY-data//BOY//documents//sosa_in/year//2006//data_input//M01//hyy_soil.txt','w');
       elseif j == 2,  fid1 = fopen('c://HY-data//BOY//documents//sosa_in/year//2006//data_input//M02//hyy_soil.txt','w');
       elseif j == 3,  fid1 = fopen('c://HY-data//BOY//documents//sosa_in/year//2006//data_input//M03//hyy_soil.txt','w');
       elseif j == 4,  fid1 = fopen('c://HY-data//BOY//documents//sosa_in/year//2006//data_input//M04//hyy_soil.txt','w');
       elseif j == 5,  fid1 = fopen('c://HY-data//BOY//documents//sosa_in/year//2006//data_input//M05//hyy_soil.txt','w');
       elseif j == 6,  fid1 = fopen('c://HY-data//BOY//documents//sosa_in/year//2006//data_input//M06//hyy_soil.txt','w');
       elseif j == 7,  fid1 = fopen('c://HY-data//BOY//documents//sosa_in/year//2006//data_input//M07//hyy_soil.txt','w'); 
       elseif j == 8,  fid1 = fopen('c://HY-data//BOY//documents//sosa_in/year//2006//data_input//M08//hyy_soil.txt','w'); 
       elseif j == 9,  fid1 = fopen('c://HY-data//BOY//documents//sosa_in/year//2006//data_input//M09//hyy_soil.txt','w'); 
       elseif j == 10, fid1 = fopen('c://HY-data//BOY//documents//sosa_in/year//2006//data_input//M10//hyy_soil.txt','w'); 
       elseif j == 11, fid1 = fopen('c://HY-data//BOY//documents//sosa_in/year//2006//data_input//M11//hyy_soil.txt','w'); 
       elseif j == 12, fid1 = fopen('c://HY-data//BOY//documents//sosa_in/year//2006//data_input//M12//hyy_soil.txt','w'); end
    end

    if year == 2005
       if     j == 1,  fid1 = fopen('c://HY-data//BOY//documents//sosa_in/year//2005//data_input//M01//hyy_soil.txt','w');
       elseif j == 2,  fid1 = fopen('c://HY-data//BOY//documents//sosa_in/year//2005//data_input//M02//hyy_soil.txt','w');
       elseif j == 3,  fid1 = fopen('c://HY-data//BOY//documents//sosa_in/year//2005//data_input//M03//hyy_soil.txt','w');
       elseif j == 4,  fid1 = fopen('c://HY-data//BOY//documents//sosa_in/year//2005//data_input//M04//hyy_soil.txt','w');
       elseif j == 5,  fid1 = fopen('c://HY-data//BOY//documents//sosa_in/year//2005//data_input//M05//hyy_soil.txt','w');
       elseif j == 6,  fid1 = fopen('c://HY-data//BOY//documents//sosa_in/year//2005//data_input//M06//hyy_soil.txt','w');
       elseif j == 7,  fid1 = fopen('c://HY-data//BOY//documents//sosa_in/year//2005//data_input//M07//hyy_soil.txt','w'); 
       elseif j == 8,  fid1 = fopen('c://HY-data//BOY//documents//sosa_in/year//2005//data_input//M08//hyy_soil.txt','w'); 
       elseif j == 9,  fid1 = fopen('c://HY-data//BOY//documents//sosa_in/year//2005//data_input//M09//hyy_soil.txt','w'); 
       elseif j == 10, fid1 = fopen('c://HY-data//BOY//documents//sosa_in/year//2005//data_input//M10//hyy_soil.txt','w'); 
       elseif j == 11, fid1 = fopen('c://HY-data//BOY//documents//sosa_in/year//2005//data_input//M11//hyy_soil.txt','w'); 
       elseif j == 12, fid1 = fopen('c://HY-data//BOY//documents//sosa_in/year//2005//data_input//M12//hyy_soil.txt','w'); end
    end

    if year == 2004
       if     j == 1,  fid1 = fopen('c://HY-data//BOY//documents//sosa_in/year//2004//data_input//M01//hyy_soil.txt','w');
       elseif j == 2,  fid1 = fopen('c://HY-data//BOY//documents//sosa_in/year//2004//data_input//M02//hyy_soil.txt','w');
       elseif j == 3,  fid1 = fopen('c://HY-data//BOY//documents//sosa_in/year//2004//data_input//M03//hyy_soil.txt','w');
       elseif j == 4,  fid1 = fopen('c://HY-data//BOY//documents//sosa_in/year//2004//data_input//M04//hyy_soil.txt','w');
       elseif j == 5,  fid1 = fopen('c://HY-data//BOY//documents//sosa_in/year//2004//data_input//M05//hyy_soil.txt','w');
       elseif j == 6,  fid1 = fopen('c://HY-data//BOY//documents//sosa_in/year//2004//data_input//M06//hyy_soil.txt','w');
       elseif j == 7,  fid1 = fopen('c://HY-data//BOY//documents//sosa_in/year//2004//data_input//M07//hyy_soil.txt','w'); 
       elseif j == 8,  fid1 = fopen('c://HY-data//BOY//documents//sosa_in/year//2004//data_input//M08//hyy_soil.txt','w'); 
       elseif j == 9,  fid1 = fopen('c://HY-data//BOY//documents//sosa_in/year//2004//data_input//M09//hyy_soil.txt','w'); 
       elseif j == 10, fid1 = fopen('c://HY-data//BOY//documents//sosa_in/year//2004//data_input//M10//hyy_soil.txt','w'); 
       elseif j == 11, fid1 = fopen('c://HY-data//BOY//documents//sosa_in/year//2004//data_input//M11//hyy_soil.txt','w'); 
       elseif j == 12, fid1 = fopen('c://HY-data//BOY//documents//sosa_in/year//2004//data_input//M12//hyy_soil.txt','w'); end
    end

    if year == 2003
       if     j == 1,  fid1 = fopen('c://HY-data//BOY//documents//sosa_in/year//2003//data_input//M01//hyy_soil.txt','w');
       elseif j == 2,  fid1 = fopen('c://HY-data//BOY//documents//sosa_in/year//2003//data_input//M02//hyy_soil.txt','w');
       elseif j == 3,  fid1 = fopen('c://HY-data//BOY//documents//sosa_in/year//2003//data_input//M03//hyy_soil.txt','w');
       elseif j == 4,  fid1 = fopen('c://HY-data//BOY//documents//sosa_in/year//2003//data_input//M04//hyy_soil.txt','w');
       elseif j == 5,  fid1 = fopen('c://HY-data//BOY//documents//sosa_in/year//2003//data_input//M05//hyy_soil.txt','w');
       elseif j == 6,  fid1 = fopen('c://HY-data//BOY//documents//sosa_in/year//2003//data_input//M06//hyy_soil.txt','w');
       elseif j == 7,  fid1 = fopen('c://HY-data//BOY//documents//sosa_in/year//2003//data_input//M07//hyy_soil.txt','w'); 
       elseif j == 8,  fid1 = fopen('c://HY-data//BOY//documents//sosa_in/year//2003//data_input//M08//hyy_soil.txt','w'); 
       elseif j == 9,  fid1 = fopen('c://HY-data//BOY//documents//sosa_in/year//2003//data_input//M09//hyy_soil.txt','w'); 
       elseif j == 10, fid1 = fopen('c://HY-data//BOY//documents//sosa_in/year//2003//data_input//M10//hyy_soil.txt','w'); 
       elseif j == 11, fid1 = fopen('c://HY-data//BOY//documents//sosa_in/year//2003//data_input//M11//hyy_soil.txt','w'); 
       elseif j == 12, fid1 = fopen('c://HY-data//BOY//documents//sosa_in/year//2003//data_input//M12//hyy_soil.txt','w'); end
    end

    
    for i = (1+day_month(j)*48): (day_month(j+1)*48)
        fprintf (fid1, '%15.6f',  time_new(i));       % 1  date and time
        fprintf (fid1, '%15.6f',  soil_final(i,1));   % 2  soil moisture (above) - [m3 H2O per m3 soil]
        fprintf (fid1, '%15.6f',  soil_final(i,2));   % 3  soil moisture (2-6 cm) - [m3 H2O per m3 soil]
        fprintf (fid1, '%15.6f',  soil_final(i,3));   % 4  soil moisture (14-25 cm) - [m3 H2O per m3 soil]
        fprintf (fid1, '%15.6f',  soil_final(i,4));   % 5  soil moisture (26-36 cm) - [m3 H2O per m3 soil]
        fprintf (fid1, '%15.6f',  soil_final(i,5));   % 6  soil moisture (47-68 cm) - [m3 H2O per m3 soil]
        fprintf (fid1, '%15.6f',  soil_finalT(i,1));  % 7  soil temperature (above)
        fprintf (fid1, '%15.6f',  soil_finalT(i,2));  % 8  soil temperature (2-5 cm)
        fprintf (fid1, '%15.6f',  soil_finalT(i,3));  % 9  soil temperature (9-14 cm)
        fprintf (fid1, '%15.6f',  soil_finalT(i,4));  % 10 soil temperature (22-29 cm)
        fprintf (fid1, '%15.6f',  soil_finalT(i,5));  % 11 soil temperature (66-90 cm)
        fprintf (fid1, '%15.6f',  rain_final(i));     % 12 rain fall
        fprintf (fid1, '\n');  
    end
   
end

for j = 1:length(time_new)
    for k = 1:5
        if isnan(soil_final(j,k)) == 1
           j, k
        end
    end
    for k = 1:5
        if isnan(soil_finalT(j,k)) == 1
           j, k
        end
    end
    if isnan(rain_final(j)) == 1
       j
    end
end
        
        
        
        
        
        
        
        
        
        
        

