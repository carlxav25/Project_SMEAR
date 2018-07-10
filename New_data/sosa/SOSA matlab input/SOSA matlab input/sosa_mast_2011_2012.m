clear all
close all

% Program reads the data from atmos-files starting 1.1.2011 and writes the output file for sosa

Avog   = 6.0223E23;        % molecules / mol
RG     = 8.314;            % J / mol / K
MAir   = 28.97;            % mole mass of air
MH2O   = 18.0153;          % mole mass of H2O
Avog   = 6.0223E23;        % molecules / mol

day_month_03 = [0 31 59 90 120 151 181 212 243 273 304 334];
day_month_04 = [0 31 60 91 121 152 182 213 244 274 305 335];


a0 = 6.107799961;
a1 = 4.436518524e-1;
a2 = 1.428945805e-2;
a3 = 2.650648471e-4;
a4 = 3.031240396e-6;
a5 = 2.034080948e-8;
a6 = 6.136820929e-11;


YEAR = input('Year:  ', 's');
year = eval(YEAR);

num_month = 12;


% Open mme files for every month
for mo = 1:num_month
    mo
    if year == 2011
       if mo == 1,      mmet = load('/Users/boy/Documents/Michael/Hyyt/Atmos/smear1101.met');
       elseif mo == 2,  mmet = load('/Users/boy/Documents/Michael/Hyyt/Atmos/smear1102.met');
       elseif mo == 3,  mmet = load('/Users/boy/Documents/Michael/Hyyt/Atmos/smear1103.met');
       elseif mo == 4,  mmet = load('/Users/boy/Documents/Michael/Hyyt/Atmos/smear1104.met');
       elseif mo == 5,  mmet = load('/Users/boy/Documents/Michael/Hyyt/Atmos/smear1105.met');
       elseif mo == 6,  mmet = load('/Users/boy/Documents/Michael/Hyyt/Atmos/smear1106.met'); 
       elseif mo == 7,  mmet = load('/Users/boy/Documents/Michael/Hyyt/Atmos/smear1107.met'); 
       elseif mo == 8,  mmet = load('/Users/boy/Documents/Michael/Hyyt/Atmos/smear1108.met'); 
       elseif mo == 9,  mmet = load('/Users/boy/Documents/Michael/Hyyt/Atmos/smear1109.met'); 
       elseif mo == 10, mmet = load('/Users/boy/Documents/Michael/Hyyt/Atmos/smear1110.met'); 
       elseif mo == 11, mmet = load('/Users/boy/Documents/Michael/Hyyt/Atmos/smear1111.met'); 
       elseif mo == 12, mmet = load('/Users/boy/Documents/Michael/Hyyt/Atmos/smear1112.met'); end

       if mo == 1,      mgas = load('/Users/boy/Documents/Michael/Hyyt/Atmos/smear1101.gas');
       elseif mo == 2,  mgas = load('/Users/boy/Documents/Michael/Hyyt/Atmos/smear1102.gas');
       elseif mo == 3,  mgas = load('/Users/boy/Documents/Michael/Hyyt/Atmos/smear1103.gas');
       elseif mo == 4,  mgas = load('/Users/boy/Documents/Michael/Hyyt/Atmos/smear1104.gas');
       elseif mo == 5,  mgas = load('/Users/boy/Documents/Michael/Hyyt/Atmos/smear1105.gas');
       elseif mo == 6,  mgas = load('/Users/boy/Documents/Michael/Hyyt/Atmos/smear1106.gas'); 
       elseif mo == 7,  mgas = load('/Users/boy/Documents/Michael/Hyyt/Atmos/smear1107.gas'); 
       elseif mo == 8,  mgas = load('/Users/boy/Documents/Michael/Hyyt/Atmos/smear1108.gas'); 
       elseif mo == 9,  mgas = load('/Users/boy/Documents/Michael/Hyyt/Atmos/smear1109.gas'); 
       elseif mo == 10, mgas = load('/Users/boy/Documents/Michael/Hyyt/Atmos/smear1110.gas'); 
       elseif mo == 11, mgas = load('/Users/boy/Documents/Michael/Hyyt/Atmos/smear1111.gas'); 
       elseif mo == 12, mgas = load('/Users/boy/Documents/Michael/Hyyt/Atmos/smear1112.gas'); end
    end
    if year == 2012
       if mo == 1,      mmet = load('/Users/boy/Documents/Michael/Hyyt/Atmos/smear1201.met');
       elseif mo == 2,  mmet = load('/Users/boy/Documents/Michael/Hyyt/Atmos/smear1202.met');
       elseif mo == 3,  mmet = load('/Users/boy/Documents/Michael/Hyyt/Atmos/smear1203.met');
       elseif mo == 4,  mmet = load('/Users/boy/Documents/Michael/Hyyt/Atmos/smear1204.met');
       elseif mo == 5,  mmet = load('/Users/boy/Documents/Michael/Hyyt/Atmos/smear1205.met');
       elseif mo == 6,  mmet = load('/Users/boy/Documents/Michael/Hyyt/Atmos/smear1206.met'); 
       elseif mo == 7,  mmet = load('/Users/boy/Documents/Michael/Hyyt/Atmos/smear1207.met'); 
       elseif mo == 8,  mmet = load('/Users/boy/Documents/Michael/Hyyt/Atmos/smear1208.met'); 
       elseif mo == 9,  mmet = load('/Users/boy/Documents/Michael/Hyyt/Atmos/smear1209.met'); 
       elseif mo == 10, mmet = load('/Users/boy/Documents/Michael/Hyyt/Atmos/smear1210.met'); 
       elseif mo == 11, mmet = load('/Users/boy/Documents/Michael/Hyyt/Atmos/smear1211.met'); 
       elseif mo == 12, mmet = load('/Users/boy/Documents/Michael/Hyyt/Atmos/smear1212.met'); end

       if mo == 1,      mgas = load('/Users/boy/Documents/Michael/Hyyt/Atmos/smear1201.gas');
       elseif mo == 2,  mgas = load('/Users/boy/Documents/Michael/Hyyt/Atmos/smear1202.gas');
       elseif mo == 3,  mgas = load('/Users/boy/Documents/Michael/Hyyt/Atmos/smear1203.gas');
       elseif mo == 4,  mgas = load('/Users/boy/Documents/Michael/Hyyt/Atmos/smear1204.gas');
       elseif mo == 5,  mgas = load('/Users/boy/Documents/Michael/Hyyt/Atmos/smear1205.gas');
       elseif mo == 6,  mgas = load('/Users/boy/Documents/Michael/Hyyt/Atmos/smear1206.gas'); 
       elseif mo == 7,  mgas = load('/Users/boy/Documents/Michael/Hyyt/Atmos/smear1207.gas'); 
       elseif mo == 8,  mgas = load('/Users/boy/Documents/Michael/Hyyt/Atmos/smear1208.gas'); 
       elseif mo == 9,  mgas = load('/Users/boy/Documents/Michael/Hyyt/Atmos/smear1209.gas'); 
       elseif mo == 10, mgas = load('/Users/boy/Documents/Michael/Hyyt/Atmos/smear1210.gas'); 
       elseif mo == 11, mgas = load('/Users/boy/Documents/Michael/Hyyt/Atmos/smear1211.gas'); 
       elseif mo == 12, mgas = load('/Users/boy/Documents/Michael/Hyyt/Atmos/smear1212.gas'); end
    end

    row  = length(mmet);

    
    for j = 1:row
        date = num2str(mmet(j,1));
        mon = eval(date(5:6));
        day = eval(date(7:8));
        hou = eval(date(9:10));
        min = eval(date(11:12));
        sec = eval(date(13:14));
        time(j) = day + hou/24 + min/24/60 + sec/24/60/60;
        if year == 2012 
           timp(j+day_month_04(mon)*48) = time(j) + day_month_04(mon);
        else
           timp(j+day_month_03(mon)*48) = time(j) + day_month_03(mon);
        end
        
        for k = 2:29
            if mmet(j,k) == -999.
               mmet(j,k) = NaN;
            end
        end
        
        for k = 2:55
            if mgas(j,k) == -999.
               mgas(j,k) = NaN;
            end
        end
            
        for k = 2:13
            if mgas(j,k) < 0.01
               mgas(j,k) = 0.005;
            end
        end
        for k = 20:25
            if mgas(j,k) < 0.01
               mgas(j,k) = 0.005;
            end
        end

        
        if year == 2012 
           for k =  1:29, mast_new(j+day_month_04(mon)*48,k) = mmet(j,k); end
           for k = 30:84, mast_new(j+day_month_04(mon)*48,k) = mgas(j,k-29); end
        elseif year == 2011
           for k =  1:29, mast_new(j+day_month_03(mon)*48,k) = mmet(j,k); end
           for k = 30:84, mast_new(j+day_month_03(mon)*48,k) = mgas(j,k-29); end
        end
    end
    
    %clear time mmet mgas row_mmet row_mgas
end


%*****************************************************************************************
% 2011

if year == 2011
   % In January (until 1344) CO only measured at one height
   for j = 1:1344
       mast_new(j,79) = mast_new(j,82);
       mast_new(j,80) = mast_new(j,82);
       mast_new(j,81) = mast_new(j,82);
       mast_new(j,83) = mast_new(j,82);
       mast_new(j,84) = mast_new(j,82);
   end

   % From 06.04. to 31.12. SO2 was only measured at one level
   for j = 4577:17520
       mast_new(j,49) = mast_new(j,52);
       mast_new(j,50) = mast_new(j,52);
       mast_new(j,51) = mast_new(j,52);
       mast_new(j,53) = mast_new(j,52);
       mast_new(j,54) = mast_new(j,52);
   end    

   
  % From the 5.10. to 20.10. temperature at 4 were not measured
   for j = 13305:14043
       mast_new(j,9) = mast_new(j,8) + (mast_new(j,8)-mast_new(j,7))/8.4*4.2;
   end

  % From the 7.11. the temperature at 4 and 8 m were not measured
   for j = 14891:16781
       mast_new(j,8) = mast_new(j,7) + (mast_new(j,7)-mast_new(j,6))/16.8*8.4;
   end
   for j = 14957:17520
       mast_new(j,9) = mast_new(j,8) + (mast_new(j,8)-mast_new(j,7))/8.4*4.2;
   end
   
   % From the 7.11. the rh at 4 and 8 m were not measured
   for j = 14891:16781
       mast_new(j,77) = mast_new(j,76) + (mast_new(j,76)-mast_new(j,75))/16.8*8.4;
   end
   for j = 14957:17520
       mast_new(j,78) = mast_new(j,77) + (mast_new(j,77)-mast_new(j,76))/8.4*4.2;
   end

   % From 5.9. to 3.10. rh and H2O were only measured at one height
   for j = 12361:13227
       mast_new(j,56) = mast_new(j,55);
       mast_new(j,57) = mast_new(j,55);
       mast_new(j,58) = mast_new(j,55);
       mast_new(j,59) = mast_new(j,55);
       mast_new(j,60) = mast_new(j,55);

       mast_new(j,74) = mast_new(j,73);
       mast_new(j,75) = mast_new(j,73);
       mast_new(j,76) = mast_new(j,73);
       mast_new(j,77) = mast_new(j,73);
       mast_new(j,78) = mast_new(j,73);
   end
   
   % Before point 9524 now wind speed was measured at 74 m
   for j = 1:9524
       mast_new(j,16) = mast_new(j,17) + (mast_new(j,17)-mast_new(j,18)) / (33.6-16.8) * (74-33.6) * 0.5;
   end
   
end


%*****************************************************************************************
% 2012

if year == 2012
   
   % Temperature at 33.6 m was not measured during some days 
   for j = 8434:8610
       mast_new(j,7) = mast_new(j,6) * (1-(50.4-33.6)/(50.4-16.8)) + mast_new(j,8) * (1-(33.6-16.8)/(50.4-16.8));
   end
   
   % From the 1.1. to 15.6. temperature at 4 were not measured
   for j = 1:7986
       mast_new(j,9) = mast_new(j,8) + (mast_new(j,8)-mast_new(j,7))/8.4*4.2;
   end
   
   % Before point 1776 now wind speed was measured at 74 m
   for j = 1:1776
       mast_new(j,16) = mast_new(j,17) + (mast_new(j,17)-mast_new(j,18)) / (33.6-16.8) * (74-33.6) * 0.5;
   end
   
   % From day 12890 onward wind at 33m was not measured
   for j = 12890:length(mast_new)
       mast_new(j,17) = mast_new(j,16) * (1-(50.4-33.6)/(50.4-16.8)) + mast_new(j,18) * (1-(33.6-16.8)/(50.4-16.8));
   end
   
   % Wind speed at 16.8 m was not measured during some days 
   for j = 11340:12938
       mast_new(j,18) = mast_new(j,17) * (1-(33.6-16.8)/(33.6-8.4)) + mast_new(j,19) * (1-(16.8-8.4)/(33.6-8.4));
   end
     
   % WD was not measured cup aneometer only with ultrasonic above canopy
   for j = 12889:length(mast_new)
       mast_new(j,25) = mast_new(j,20);
   end
   for j = 11300:12900
       mast_new(j,26) = mast_new(j,20);
   end
   for j = 1:840
       mast_new(j,27) = mast_new(j,20);
   end
   for j = 17530:length(mast_new)
       mast_new(j,27) = mast_new(j,20);
   end
   
   % SO2 setting a value for a short period constant because of unrealistic
   % interpolation
   for j = 11296:11318
       mast_new(j,52) = 0.2;
   end
   
   % SO2 was only measured during the whole year at 16.8 m  
   for j = 1:length(mast_new)
       mast_new(j,49) = mast_new(j,52);
       mast_new(j,50) = mast_new(j,52);
       mast_new(j,51) = mast_new(j,52);
       mast_new(j,53) = mast_new(j,52);
       mast_new(j,54) = mast_new(j,52);
   end
   
end


%*****************************************************************************************

% Select data sets which will be used in SOSA
if year == 2011 || year == 2012
   x = [3 12 16 25 29 31 73];
   y = [9 12 20 27 29 66 84];
elseif year == 2013
   x = [3 12 16 25 29 31 73];
   y = [9 12 20 27 29 78 102];
end
   
   nr_xy = 7;

% Gap filling for short missing data sets
for i = 1:nr_xy
    for k = x(i):y(i)
        for j = 1:length(mast_new)
            mast_par(j,k) = 1;
            if isnan(mast_new(j,k)) == 1, mast_par(j,k) = 2; end
        end
        mast_int(:,k) = inter_sosa(mast_new(:,k), length(mast_new));
    end
end

x = [3 12 16 25 29 31 73];
y = [9 12 20 27 29 66 84];

    
% Gap filling for long missing data sets
for i = 1:nr_xy
    for k = x(i):y(i)
        for j = 1:length(mast_int)
            if isnan(mast_int(j,k)) == 0
               mast_int_F(j,k) = mast_int(j,k);
               mast_par(j,k) = 1;
            elseif isnan(mast_int(j,k)) == 1 & j>144
               mast_int_F(j,k) = (mast_int_F(j-48,k) + mast_int_F(j-48*2,k) + mast_int_F(j-48*3,k))/3;
               mast_par(j,k) = 3;
            else
               mast_int_F(j,k) = mast_int(j,k);
               mast_par(j,k) = 3;
            end
        end
        for j = length(mast_int):-1:1
            if isnan(mast_int(j,k)) == 0
               mast_int_B(j,k) = mast_int(j,k);
               mast_par(j,k) = 1;
            elseif isnan(mast_int(j,k)) == 1 && j < length(mast_int)-144
               mast_int_B(j,k) = (mast_int_B(j+48,k) + mast_int_B(j+48*2,k) + mast_int_B(j+48*3,k))/3;
               mast_par(j,k) = 3;
            else
               mast_int_B(j,k) = mast_int(j,k);
               mast_par(j,k) = 3;
            end
        end
        for j = 1:length(mast_int)
            if isnan(mast_int_F(j,k)) == 0 && isnan(mast_int_B(j,k)) == 0 
               mast_int_new(j,k) = (mast_int_F(j,k) + mast_int_B(j,k)) / 2; 
            elseif isnan(mast_int_F(j,k)) == 1 && isnan(mast_int_B(j,k)) == 0 
               mast_int_new(j,k) = mast_int_B(j,k); 
            elseif isnan(mast_int_F(j,k)) == 0 && isnan(mast_int_B(j,k)) == 1 
               mast_int_new(j,k) = mast_int_F(j,k); 
            end
        end
    end
end


% Average for 2 heights 
for j = 1:length(mast_int_new)
    
    % pressure in hPa
    pres(j)  =  mast_int_new(j,3);                                                    
 
    % wd above canopy
    wd(j)    = mast_int_new(j,20);                                               
    if wd(j) > 360, wd(j) = 360; end
   
    % RH at 6.3 m
    if (mast_par(j,77) == 1 && mast_par(j,78) == 1 || mast_par(j,77) > 1 && mast_par(j,78) > 1)
       rh_A(j)  = (mast_int_new(j,77) + mast_int_new(j,78))/2;                      
    elseif mast_par(j,77) == 1 && mast_par(j,78) > 1
       rh_A(j)  = mast_int_new(j,77);                         
    elseif mast_par(j,78) == 1 && mast_par(j,77) > 1
       rh_A(j)  = mast_int_new(j,78);                         
    end
    
    % RH at 25.2 m
    if (mast_par(j,75) == 1 && mast_par(j,76) == 1 || mast_par(j,75) > 1 && mast_par(j,76) > 1)
       rh_B(j)  = (mast_int_new(j,75) + mast_int_new(j,76))/2;                      
    elseif mast_par(j,75) == 1 && mast_par(j,76) > 1
       rh_B(j)  = mast_int_new(j,75);
    elseif mast_par(j,76) == 1 && mast_par(j,75) > 1
       rh_B(j)  = mast_int_new(j,76);
    end
    if rh_A(j) > 100, rh_A(j) = 100; end
    if rh_B(j) > 100, rh_B(j) = 100; end
    
    % T at 6.3 m
    if (mast_par(j,8) == 1 && mast_par(j,9) == 1 || mast_par(j,8) > 1 && mast_par(j,9) > 1)
       tem_A(j) = (mast_int_new(j,8)  + mast_int_new(j,9))/2 + 273.15;              
    elseif mast_par(j,8) == 1 && mast_par(j,9) > 1
       tem_A(j) = mast_int_new(j,8) + 273.15;
    elseif mast_par(j,9) == 1 && mast_par(j,8) > 1
       tem_A(j) = mast_int_new(j,9) + 273.15;
    end
    
    % T at 25.2 m
    if (mast_par(j,6) == 1 && mast_par(j,7) == 1 || mast_par(j,6) > 1 && mast_par(j,7) > 1)
       tem_B(j) = (mast_int_new(j,6)  + mast_int_new(j,7))/2 + 273.15;              
    elseif mast_par(j,6) == 1 && mast_par(j,7) > 1
       tem_B(j) = mast_int_new(j,6) + 273.15;
    elseif mast_par(j,7) == 1 && mast_par(j,6) > 1
       tem_B(j) = mast_int_new(j,7) + 273.15;
    end

    % o3 at 6.3 m in ppb
    if (mast_par(j,47) == 1 && mast_par(j,48) == 1 || mast_par(j,47) > 1 && mast_par(j,48) > 1)
       o3_A(j)  = (mast_int_new(j,47) + mast_int_new(j,48))/2;      
    elseif mast_par(j,47) == 1 && mast_par(j,48) > 1
       o3_A(j)  = mast_int_new(j,47); 
    elseif mast_par(j,48) == 1 && mast_par(j,47) > 1
       o3_A(j)  = mast_int_new(j,48); 
    end
    
    % o3 at 25.2 m in ppb
    if (mast_par(j,45) == 1 && mast_par(j,46) == 1 || mast_par(j,45) > 1 && mast_par(j,46) > 1)
       o3_B(j)  = (mast_int_new(j,45) + mast_int_new(j,46))/2; 
    elseif mast_par(j,45) == 1 && mast_par(j,46) > 1
       o3_B(j)  = mast_int_new(j,45); 
    elseif mast_par(j,46) == 1 && mast_par(j,45) > 1
       o3_B(j)  = mast_int_new(j,46); 
    end
    
    % so2 at 6.3 m in ppb
    if (mast_par(j,53) == 1 && mast_par(j,54) == 1 || mast_par(j,53) > 1 && mast_par(j,54) > 1)
       so2_A(j) = (mast_int_new(j,53) + mast_int_new(j,54))/2;      
    elseif mast_par(j,53) == 1 && mast_par(j,54) > 1
       so2_A(j) = mast_int_new(j,53);
    elseif mast_par(j,54) == 1 && mast_par(j,53) > 1
       so2_A(j) = mast_int_new(j,54);
    end
    
    % so2 at 25.2 m in ppb
    if (mast_par(j,51) == 1 && mast_par(j,52) == 1 || mast_par(j,51) > 1 && mast_par(j,52) > 1)
       so2_B(j) = (mast_int_new(j,51) + mast_int_new(j,52))/2;       
    elseif mast_par(j,51) == 1 && mast_par(j,52) > 1
       so2_B(j) = mast_int_new(j,51);
    elseif mast_par(j,52) == 1 && mast_par(j,51) > 1
       so2_B(j) = mast_int_new(j,52);
    end
    
    
    % no at 6.3 m in ppb
    if (mast_par(j,35) == 1 && mast_par(j,36) == 1 || mast_par(j,35) > 1 && mast_par(j,36) > 1)
       no_A(j)  = (mast_int_new(j,35) + mast_int_new(j,36))/2;      
    elseif mast_par(j,35) == 1 && mast_par(j,36) > 1
       no_A(j)  = mast_int_new(j,35); 
    elseif mast_par(j,36) == 1 && mast_par(j,35) > 1
       no_A(j)  = mast_int_new(j,36); 
    end
    
    % no at 25.2 m in ppb
    if (mast_par(j,33) == 1 && mast_par(j,34) == 1 || mast_par(j,33) > 1 && mast_par(j,34) > 1)
       no_B(j)  = (mast_int_new(j,33) + mast_int_new(j,34))/2; 
    elseif mast_par(j,33) == 1 && mast_par(j,34) > 1
       no_B(j)  = mast_int_new(j,33); 
    elseif mast_par(j,34) == 1 && mast_par(j,33) > 1
       no_B(j)  = mast_int_new(j,34); 
    end
    
    % nox at 6.3 m in ppb
    if (mast_par(j,41) == 1 && mast_par(j,42) == 1 || mast_par(j,41) > 1 && mast_par(j,42) > 1)
       no2_A(j) = (mast_int_new(j,41) + mast_int_new(j,42))/2;
    elseif mast_par(j,41) == 1 && mast_par(j,42) > 1
       no2_A(j) = mast_int_new(j,41);
    elseif mast_par(j,42) == 1 && mast_par(j,41) > 1
       no2_A(j) = mast_int_new(j,42);
    end
    
    % nox at 25.2 m in ppb
    if (mast_par(j,39) == 1 && mast_par(j,40) == 1 || mast_par(j,39) > 1 && mast_par(j,40) > 1)
       no2_B(j) = (mast_int_new(j,39) + mast_int_new(j,40))/2;
    elseif mast_par(j,39) == 1 && mast_par(j,40) > 1
       no2_B(j) = mast_int_new(j,39); 
    elseif mast_par(j,40) == 1 && mast_par(j,39) > 1
       no2_B(j) = mast_int_new(j,40); 
    end
    
    % h2o at 6.3 m in ppth
    if (mast_par(j,59) == 1 && mast_par(j,60) == 1 || mast_par(j,59) > 1 && mast_par(j,60) > 1)
       h2o_A(j) = (mast_int_new(j,59) + mast_int_new(j,60))/2;      
    elseif mast_par(j,59) == 1 && mast_par(j,60) > 1
       h2o_A(j) = mast_int_new(j,59);  
    elseif mast_par(j,60) == 1 && mast_par(j,59) > 1
       h2o_A(j) = mast_int_new(j,60);  
    end
    
    % h2o at 25.2 m in ppth
    if (mast_par(j,57) == 1 && mast_par(j,58) == 1 || mast_par(j,57) > 1 && mast_par(j,58) > 1)
       h2o_B(j) = (mast_int_new(j,57) + mast_int_new(j,58))/2;      
    elseif mast_par(j,57) == 1 && mast_par(j,58) > 1
       h2o_B(j) = mast_int_new(j,57);  
    elseif mast_par(j,58) == 1 && mast_par(j,57) > 1
       h2o_B(j) = mast_int_new(j,58);  
    end
    
    % h2o at 6 different heights in # cm-3
    air_A(j) =  mast_int_new(j,3) / tem_A(j) / RG * Avog / 1E4;                  % Air molecules at 6.3 m
    air_B(j) =  mast_int_new(j,3) / tem_B(j) / RG * Avog / 1E4;                  % Air molecules at 22.2 m
    h2o_1(j) = mast_int_new(j,55) * air_A(j) / 1E3 / Avog * MH2O / 1E3 * 1E6;
    h2o_2(j) = mast_int_new(j,56) * air_A(j) / 1E3 / Avog * MH2O / 1E3 * 1E6;
    h2o_3(j) = mast_int_new(j,57) * air_A(j) / 1E3 / Avog * MH2O / 1E3 * 1E6;
    h2o_4(j) = mast_int_new(j,58) * air_A(j) / 1E3 / Avog * MH2O / 1E3 * 1E6;
    h2o_5(j) = mast_int_new(j,59) * air_A(j) / 1E3 / Avog * MH2O / 1E3 * 1E6;
    h2o_6(j) = mast_int_new(j,60) * air_A(j) / 1E3 / Avog * MH2O / 1E3 * 1E6;
    
    % co at 6.3 m in ppb
    co_A(j)  = (mast_int_new(j,84) + mast_int_new(j,83))/2;      
    
    % co at 25.2 m in ppb
    co_B(j)  = (mast_int_new(j,82) + mast_int_new(j,81))/2;      
end


% Output
Savepar = 2;
if Savepar == 2
   if  year == 2011, fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2011/data_measured/mast_6m_new.txt','w'); end
   if  year == 2012, fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2012/data_measured/mast_6m_new.txt','w'); end
   for j = 1:length(timp)
       fprintf (fid1, '%10.3f',  timp(j));     % date
       fprintf (fid1, '%20.5f',  o3_A(j));     % o3 at 6.3 m in # cm-3
       fprintf (fid1, '%20.5f',  so2_A(j));    % so2 at 6.3 m in # cm-3
       fprintf (fid1, '%20.5f',  no_A(j));     % no at 6.3 m in # cm-3
       fprintf (fid1, '%20.5f',  no2_A(j));    % no2 at 6.3 m in # cm-3
       fprintf (fid1, '%20.5f',  co_A(j));     % co at 6.3 m in # cm-3
       fprintf (fid1, '%20.5f',  h2o_A(j));    % h2o at 6.3 m in # cm-3
       fprintf (fid1, '%25.0f',  air_A(j));    % Air molecules at 6.3 m
       fprintf (fid1, '%10.2f',  rh_A(j));     % RH at 6.3 m
       fprintf (fid1, '%10.2f',  tem_A(j));    % T at 6.3 m
       fprintf (fid1, '%25.0f',  pres(j));     % Pressure
       fprintf (fid1, '%10.2f',  wd(j));       % WD at 25.2 m
       fprintf (fid1, '\n');  
   end

   if  year == 2011, fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2011/data_measured/mast_25m_new.txt','w'); end
   if  year == 2012, fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2012/data_measured/mast_25m_new.txt','w'); end
   for j = 1:length(timp)
       fprintf (fid1, '%10.3f',  timp(j));     % 1  date
       fprintf (fid1, '%20.5f',  o3_B(j));     % 2  o3 at 25.2 m in # cm-3
       fprintf (fid1, '%20.5f',  so2_B(j));    % 3  so2 at 25.2 m in # cm-3 
       fprintf (fid1, '%20.5f',  no_B(j));     % 4  no at 25.2 m in # cm-3
       fprintf (fid1, '%20.5f',  no2_B(j));    % 5  no2 at 25.2 m in # cm-3
       fprintf (fid1, '%20.5f',  co_B(j));     % 6  co at 25.2 m in # cm-3
       fprintf (fid1, '%20.5f',  h2o_B(j));    % 7  h2o at 25.2 m in # cm-3
       fprintf (fid1, '%25.0f',  air_B(j));    % 8  Air molecules at 25.2 m
       fprintf (fid1, '%10.2f',  rh_B(j));     % 9  RH at 25.2 m
       fprintf (fid1, '%10.2f',  tem_B(j));    % 10 T at 25.2 m
       fprintf (fid1, '%25.0f',  pres(j));     % 11 Pressure
       fprintf (fid1, '%10.2f',  wd(j));       % 12 WD at 25.2 m
       fprintf (fid1, '\n');  
   end

   if  year == 2011, fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2011/data_measured/mast_int_par.txt','w'); end
   if  year == 2012, fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2012/data_measured/mast_int_par.txt','w'); end
   for j = 1:length(timp)
       fprintf (fid1, '%10.3f',  timp(j));     % date
       for k = 1:84
           fprintf (fid1, '%3.0f',  mast_par(j,k)); 
       end
       fprintf (fid1, '\n');  
   end

   if  year == 2011, fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2011/data_measured/mast_temp.txt','w'); end
   if  year == 2012, fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2012/data_measured/mast_temp.txt','w'); end
   for j = 1:length(timp)
       fprintf (fid1, '%10.3f',  timp(j));     % date
       for k = 1:6
           fprintf (fid1, '%14.2f',  mast_int_new(j,k+3)+273.15);     % temp at different heights
       end
       fprintf (fid1, '\n');  
   end

   if  year == 2011, fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2011/data_measured/mast_h2o.txt','w'); end
   if  year == 2012, fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2012/data_measured/mast_h2o.txt','w'); end
   for j = 1:length(timp)
       fprintf (fid1, '%10.3f',  timp(j));     % date
       fprintf (fid1, '%10.4f',  h2o_1(j));    % h2o at different heights
       fprintf (fid1, '%10.4f',  h2o_2(j));    % h2o at different heights
       fprintf (fid1, '%10.4f',  h2o_3(j));    % h2o at different heights
       fprintf (fid1, '%10.4f',  h2o_4(j));    % h2o at different heights
       fprintf (fid1, '%10.4f',  h2o_5(j));    % h2o at different heights
       fprintf (fid1, '%10.4f',  h2o_6(j));    % h2o at different heights
       fprintf (fid1, '\n');  
   end

   if  year == 2011, fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2011/data_measured/mast_ws.txt','w'); end
   if  year == 2012, fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2012/data_measured/mast_ws.txt','w'); end
   for j = 1:length(timp)
       fprintf (fid1, '%10.3f',  timp(j));     % date
       fprintf (fid1, '%10.4f',  mast_int_new(j,16));    % ws at 74 m
       fprintf (fid1, '%10.4f',  mast_int_new(j,17));    % ws at 33.6 m
       fprintf (fid1, '%10.4f',  mast_int_new(j,18));    % ws at 16.8 m
       fprintf (fid1, '%10.4f',  mast_int_new(j,19));    % ws at 8.4 m
       fprintf (fid1, '%10.4f',  mast_int_new(j,25));    % wd at 33.6 m
       fprintf (fid1, '%10.4f',  mast_int_new(j,26));    % wd at 16.8 m
       fprintf (fid1, '\n');  
   end
end


% Check of temp and rh gradients are ok
plotpar = 1;
if plotpar == 1
   if     year == 2011, mast_A = load('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2011/data_measured/mast_6m_new.txt'); end
   if     year == 2011, mast_B = load('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2011/data_measured/mast_25m_new.txt'); end
   if     year == 2012, mast_A = load('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2012/data_measured/mast_6m_new.txt'); end
   if     year == 2012, mast_B = load('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2012/data_measured/mast_25m_new.txt'); end

   figure(1)
   clf
   subplot(311)
   hold on
   plot(mast_A(:,1), mast_A(:,10), 'r-')
   plot(mast_B(:,1), mast_B(:,10), 'r--')
   for j = 1:length(mast_par)
       if (mast_par(j,8)+mast_par(j,9))/2 ~= 1
          plot(mast_A(j,1), (mast_par(j,8)+mast_par(j,9))/2+300, 'ko')
       end
       if (mast_par(j,6)+mast_par(j,7))/2 ~= 1
          plot(mast_A(j,1), (mast_par(j,6)+mast_par(j,7))/2+300, 'kx')
       end
   end
   legend('Temp. - 6 m', 'Temp. - 25 m')
   title(['Year:  ', num2str(year)])
   
       
   subplot(312)
   hold on
   plot(mast_A(:,1), mast_A(:,5), 'r-')
   plot(mast_B(:,1), mast_B(:,5), 'r--')
   for j = 1:length(mast_par)
       if (mast_par(j,41)+mast_par(j,42))/2 ~= 1
          plot(mast_A(j,1), (mast_par(j,41)+mast_par(j,42))/2, 'ko')
       end
       if (mast_par(j,39)+mast_par(j,40))/2 ~= 1
          plot(mast_A(j,1), (mast_par(j,39)+mast_par(j,40))/2, 'kx')
       end
   end
   legend('NO2 - 6 m', 'NO2 - 25 m');
       
   subplot(313)
   hold on
   plot(mast_A(:,1), mast_A(:,4), 'r-')
   plot(mast_B(:,1), mast_B(:,4), 'r--')
   for j = 1:length(mast_par)
       if (mast_par(j,35) + mast_par(j,36))/2 ~= 1
          plot(mast_A(j,1), (mast_par(j,35)+mast_par(j,36))/2, 'ko')
       end
       if (mast_par(j,33)+mast_par(j,34))/2 ~= 1
          plot(mast_A(j,1), (mast_par(j,33)+mast_par(j,34))/2, 'kx')
       end
   end
   legend('NO - 6 m', 'NO - 25 m');

   
   figure(2)
   clf
   subplot(311)
   hold on
   plot(mast_A(:,1), mast_A(:,2), 'r-')
   plot(mast_B(:,1), mast_B(:,2), 'r--')
   for j = 1:length(mast_par)
       if (mast_par(j,47)+mast_par(j,48))/2 ~= 1
          plot(mast_A(j,1), (mast_par(j,47)+mast_par(j,48))/2, 'ko')
       end
       if (mast_par(j,45)+mast_par(j,46))/2 ~= 1
          plot(mast_A(j,1), (mast_par(j,45)+mast_par(j,46))/2, 'kx')
       end
   end
   legend('O3 - 6 m', 'O3 - 25 m');
   title(['Year:  ', num2str(year)])

   subplot(312)
   hold on
   plot(mast_A(:,1), mast_A(:,3), 'r-')
   plot(mast_B(:,1), mast_B(:,3), 'r--')
   for j = 1:length(mast_par)
       if (mast_par(j,53)+mast_par(j,54))/2 ~= 1
          plot(mast_A(j,1), (mast_par(j,53)+mast_par(j,54))/2, 'ko')
       end
       if (mast_par(j,51)+mast_par(j,52))/2 ~= 1
          plot(mast_A(j,1), (mast_par(j,51)+mast_par(j,52))/2, 'kx')
       end
   end
   legend('SO2 - 6 m', 'SO2 - 25 m');
       
   subplot(313)
   hold on
   plot(mast_A(:,1), mast_A(:,6), 'r-')
   plot(mast_B(:,1), mast_B(:,6), 'r--')
   for j = 1:length(mast_par)
       if (mast_par(j,83)+mast_par(j,84))/2 ~= 1
          plot(mast_A(j,1), (mast_par(j,83)+mast_par(j,84))/2, 'ko')
       end
       if (mast_par(j,81)+mast_par(j,82))/2 ~= 1
          plot(mast_A(j,1), (mast_par(j,81)+mast_par(j,82))/2, 'kx')
       end
   end
   legend('CO - 6 m', 'CO - 25 m');
      

   figure(3)
   clf
   subplot(311)
   hold on
   plot(mast_A(:,1), mast_A(:,9), 'r-')
   plot(mast_B(:,1), mast_B(:,9), 'r--')
   for j = 1:length(mast_par)
       if (mast_par(j,77)+mast_par(j,78))/2 ~= 1
          plot(mast_A(j,1), (mast_par(j,77)+mast_par(j,78))/2+100, 'ko')
       end
       if (mast_par(j,75)+mast_par(j,76))/2 ~= 1
          plot(mast_A(j,1), (mast_par(j,75)+mast_par(j,76))/2+100, 'kx')
       end
   end
   legend('RH - 6 m', 'RH - 25 m');
   title(['Year:  ', num2str(year)])

   subplot(312)
   hold on
   plot(mast_A(:,1), mast_A(:,7), 'b-')
   plot(mast_B(:,1), mast_B(:,7), 'b--')
   for j = 1:length(mast_par)
       if (mast_par(j,59)+mast_par(j,60))/2 ~= 1
          plot(mast_A(j,1), (mast_par(j,59)+mast_par(j,60))/2, 'ko')
       end
       if (mast_par(j,57)+mast_par(j,58))/2 ~= 1
          plot(mast_A(j,1), (mast_par(j,57)+mast_par(j,58))/2, 'kx')
       end
   end
   legend('H2O - 6 m', 'H2O - 25 m');

   subplot(313)
   hold on
   plot(mast_A(:,1), mast_A(:,8), 'r-')
   plot(mast_B(:,1), mast_B(:,8), 'r--')
   legend('Air - 6 m', 'Air - 25 m');

   if     year == 2011, temp = load('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2011/data_measured/mast_temp.txt'); end
   if     year == 2011, h2o  = load('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2011/data_measured/mast_h2o.txt'); end
   if     year == 2011, wsd  = load('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2011/data_measured/mast_ws.txt'); end
   if     year == 2012, temp = load('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2012/data_measured/mast_temp.txt'); end
   if     year == 2012, h2o  = load('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2012/data_measured/mast_h2o.txt'); end
   if     year == 2012, wsd  = load('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2012/data_measured/mast_ws.txt'); end

   figure(4)
   clf
   hold on
   plot(temp(:,1), temp(:,2), 'b-')
   plot(temp(:,1), temp(:,3), 'c-')
   plot(temp(:,1), temp(:,4), 'g-')
   plot(temp(:,1), temp(:,5), 'r-')
   plot(temp(:,1), temp(:,6), 'm-')
   plot(temp(:,1), temp(:,7), 'y-')
   title(['Year:  ', num2str(year)])
   
   
   figure(5)
   hold on
   plot(h2o(:,1), h2o(:,2), 'b-')
   plot(h2o(:,1), h2o(:,3), 'c-')
   plot(h2o(:,1), h2o(:,4), 'g-')
   plot(h2o(:,1), h2o(:,5), 'r-')
   plot(h2o(:,1), h2o(:,6), 'm-')
   plot(h2o(:,1), h2o(:,7), 'y-')
   title(['Year:  ', num2str(year)])

   figure(6)
   clf
   subplot(211)
   hold on
   plot(wsd(:,1), wsd(:,2), 'b-')
   plot(wsd(:,1), wsd(:,3), 'g-')
   plot(wsd(:,1), wsd(:,4), 'r-')
   plot(wsd(:,1), wsd(:,5), 'm-')
   title(['Year:  ', num2str(year)])

   subplot(212)
   hold on
   plot(wsd(:,1), wsd(:,6), 'g-')
   plot(wsd(:,1), wsd(:,7), 'r-')
end 