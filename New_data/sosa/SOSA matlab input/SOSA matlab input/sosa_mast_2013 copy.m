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

if year == 2013, num_month = 12; else num_month = 12; end

readpar = 2;

if readpar == 1
   % Open mme files for every month
   for mo = 1:num_month
       mo
       if year == 2014
          if mo == 1,      mmet = load('/Users/boy/Documents/Michael/Hyyt/Atmos/smear1401.met');
          elseif mo == 2,  mmet = load('/Users/boy/Documents/Michael/Hyyt/Atmos/smear1402.met');
          elseif mo == 3,  mmet = load('/Users/boy/Documents/Michael/Hyyt/Atmos/smear1403.met');
          elseif mo == 4,  mmet = load('/Users/boy/Documents/Michael/Hyyt/Atmos/smear1404.met');
          elseif mo == 5,  mmet = load('/Users/boy/Documents/Michael/Hyyt/Atmos/smear1405.met');
          elseif mo == 6,  mmet = load('/Users/boy/Documents/Michael/Hyyt/Atmos/smear1406.met'); 
          elseif mo == 7,  mmet = load('/Users/boy/Documents/Michael/Hyyt/Atmos/smear1407.met'); 
          elseif mo == 8,  mmet = load('/Users/boy/Documents/Michael/Hyyt/Atmos/smear1408.met'); 
          elseif mo == 9,  mmet = load('/Users/boy/Documents/Michael/Hyyt/Atmos/smear1409.met'); 
          elseif mo == 10, mmet = load('/Users/boy/Documents/Michael/Hyyt/Atmos/smear1410.met'); 
          elseif mo == 11, mmet = load('/Users/boy/Documents/Michael/Hyyt/Atmos/smear1411.met'); 
          elseif mo == 12, mmet = load('/Users/boy/Documents/Michael/Hyyt/Atmos/smear1412.met'); end

          if mo == 1,      mgas = load('/Users/boy/Documents/Michael/Hyyt/Atmos/smear1401.gas');
          elseif mo == 2,  mgas = load('/Users/boy/Documents/Michael/Hyyt/Atmos/smear1402.gas');
          elseif mo == 3,  mgas = load('/Users/boy/Documents/Michael/Hyyt/Atmos/smear1403.gas');
          elseif mo == 4,  mgas = load('/Users/boy/Documents/Michael/Hyyt/Atmos/smear1404.gas');
          elseif mo == 5,  mgas = load('/Users/boy/Documents/Michael/Hyyt/Atmos/smear1405.gas');
          elseif mo == 6,  mgas = load('/Users/boy/Documents/Michael/Hyyt/Atmos/smear1406.gas'); 
          elseif mo == 7,  mgas = load('/Users/boy/Documents/Michael/Hyyt/Atmos/smear1407.gas'); 
          elseif mo == 8,  mgas = load('/Users/boy/Documents/Michael/Hyyt/Atmos/smear1408.gas'); 
          elseif mo == 9,  mgas = load('/Users/boy/Documents/Michael/Hyyt/Atmos/smear1409.gas'); 
          elseif mo == 10, mgas = load('/Users/boy/Documents/Michael/Hyyt/Atmos/smear1410.gas'); 
          elseif mo == 11, mgas = load('/Users/boy/Documents/Michael/Hyyt/Atmos/smear1411.gas'); 
          elseif mo == 12, mgas = load('/Users/boy/Documents/Michael/Hyyt/Atmos/smear1412.gas'); end
       end
    
       if year == 2013
          if mo == 1,      mmet = load('/Users/boy/Documents/Michael/Hyyt/Atmos/smear1301.met');
          elseif mo == 2,  mmet = load('/Users/boy/Documents/Michael/Hyyt/Atmos/smear1302.met');
          elseif mo == 3,  mmet = load('/Users/boy/Documents/Michael/Hyyt/Atmos/smear1303.met');
          elseif mo == 4,  mmet = load('/Users/boy/Documents/Michael/Hyyt/Atmos/smear1304.met');
          elseif mo == 5,  mmet = load('/Users/boy/Documents/Michael/Hyyt/Atmos/smear1305.met');
          elseif mo == 6,  mmet = load('/Users/boy/Documents/Michael/Hyyt/Atmos/smear1306.met'); 
          elseif mo == 7,  mmet = load('/Users/boy/Documents/Michael/Hyyt/Atmos/smear1307.met'); 
          elseif mo == 8,  mmet = load('/Users/boy/Documents/Michael/Hyyt/Atmos/smear1308.met'); 
          elseif mo == 9,  mmet = load('/Users/boy/Documents/Michael/Hyyt/Atmos/smear1309.met'); 
          elseif mo == 10, mmet = load('/Users/boy/Documents/Michael/Hyyt/Atmos/smear1310.met'); 
          elseif mo == 11, mmet = load('/Users/boy/Documents/Michael/Hyyt/Atmos/smear1311.met'); 
          elseif mo == 12, mmet = load('/Users/boy/Documents/Michael/Hyyt/Atmos/smear1312.met'); end

          if mo == 1,      mgas = load('/Users/boy/Documents/Michael/Hyyt/Atmos/smear1301.gas');
          elseif mo == 2,  mgas = load('/Users/boy/Documents/Michael/Hyyt/Atmos/smear1302.gas');
          elseif mo == 3,  mgas = load('/Users/boy/Documents/Michael/Hyyt/Atmos/smear1303.gas');
          elseif mo == 4,  mgas = load('/Users/boy/Documents/Michael/Hyyt/Atmos/smear1304.gas');
          elseif mo == 5,  mgas = load('/Users/boy/Documents/Michael/Hyyt/Atmos/smear1305.gas');
          elseif mo == 6,  mgas = load('/Users/boy/Documents/Michael/Hyyt/Atmos/smear1306.gas'); 
          elseif mo == 7,  mgas = load('/Users/boy/Documents/Michael/Hyyt/Atmos/smear1307.gas'); 
          elseif mo == 8,  mgas = load('/Users/boy/Documents/Michael/Hyyt/Atmos/smear1308.gas'); 
          elseif mo == 9,  mgas = load('/Users/boy/Documents/Michael/Hyyt/Atmos/smear1309.gas'); 
          elseif mo == 10, mgas = load('/Users/boy/Documents/Michael/Hyyt/Atmos/smear1310.gas'); 
          elseif mo == 11, mgas = load('/Users/boy/Documents/Michael/Hyyt/Atmos/smear1311.gas'); 
          elseif mo == 12, mgas = load('/Users/boy/Documents/Michael/Hyyt/Atmos/smear1312.gas'); end
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
        
           for k = 2:73
               if mgas(j,k) == -999.
                  mgas(j,k) = NaN;
               end
           end
            
           for k = 2:17
               if mgas(j,k) < 0.01
                  mgas(j,k) = 0.005;
               end
           end
           for k = 26:33
               if mgas(j,k) < 0.01
                  mgas(j,k) = 0.005;
               end
           end
 
           if year == 2013 | year == 2014
              for k =  1:29, mast_new(j+day_month_03(mon)*48,k) = mmet(j,k); end
              for k = 30:102, mast_new(j+day_month_03(mon)*48,k) = mgas(j,k-29); end
           end
       end
    
       clear time mmet mgas row_mmet row_mgas
   end
end

%*****************************************************************************************
% 2013



%*****************************************************************************************

% Select data sets which will be used in SOSA
x = [3 12 16 25 29 31 73];
y = [9 12 20 27 29 78 102];
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

if year == 2013
   % Wind was only measured in the first 7 month at one height
   for i = 1:length(mast_int_new)
       if i < 3800, mast_int_new(i,19) = 0.5*mast_int_new(i,18); end
       mast_int_new(i,16) = mast_int_new(i,18);
       mast_int_new(i,17) = mast_int_new(i,18);
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
    if (mast_par(j,93) == 1 && mast_par(j,94) == 1 || mast_par(j,93) > 1 && mast_par(j,94) > 1)
       rh_A(j)  = (mast_int_new(j,93) + mast_int_new(j,94))/2;                      
    elseif mast_par(j,93) == 1 && mast_par(j,94) > 1
       rh_A(j)  = mast_int_new(j,93);                         
    elseif mast_par(j,94) == 1 && mast_par(j,93) > 1
       rh_A(j)  = mast_int_new(j,94);                         
    end
    
    % RH at 25.2 m
    if (mast_par(j,91) == 1 && mast_par(j,92) == 1 || mast_par(j,91) > 1 && mast_par(j,92) > 1)
       rh_B(j)  = (mast_int_new(j,91) + mast_int_new(j,92))/2;                      
    elseif mast_par(j,91) == 1 && mast_par(j,92) > 1
       rh_B(j)  = mast_int_new(j,91);
    elseif mast_par(j,92) == 1 && mast_par(j,91) > 1
       rh_B(j)  = mast_int_new(j,92);
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
    if (mast_par(j,53) == 1 && mast_par(j,54) == 1 || mast_par(j,53) > 1 && mast_par(j,54) > 1)
       o3_A(j)  = (mast_int_new(j,53) + mast_int_new(j,54))/2;      
    elseif mast_par(j,53) == 1 && mast_par(j,54) > 1
       o3_A(j)  = mast_int_new(j,53); 
    elseif mast_par(j,54) == 1 && mast_par(j,53) > 1
       o3_A(j)  = mast_int_new(j,54); 
    end
    
    % o3 at 25.2 m in ppb
    if (mast_par(j,51) == 1 && mast_par(j,52) == 1 || mast_par(j,51) > 1 && mast_par(j,52) > 1)
       o3_B(j)  = (mast_int_new(j,51) + mast_int_new(j,52))/2; 
    elseif mast_par(j,51) == 1 && mast_par(j,52) > 1
       o3_B(j)  = mast_int_new(j,51); 
    elseif mast_par(j,52) == 1 && mast_par(j,51) > 1
       o3_B(j)  = mast_int_new(j,52); 
    end
    
    % so2 at 6.3 m in ppb
    if (mast_par(j,61) == 1 && mast_par(j,62) == 1 || mast_par(j,61) > 1 && mast_par(j,62) > 1)
       so2_A(j) = (mast_int_new(j,61) + mast_int_new(j,62))/2;      
    elseif mast_par(j,61) == 1 && mast_par(j,62) > 1
       so2_A(j) = mast_int_new(j,61);
    elseif mast_par(j,62) == 1 && mast_par(j,61) > 1
       so2_A(j) = mast_int_new(j,62);
    end
    
    % so2 at 25.2 m in ppb
    if (mast_par(j,59) == 1 && mast_par(j,60) == 1 || mast_par(j,59) > 1 && mast_par(j,60) > 1)
       so2_B(j) = (mast_int_new(j,59) + mast_int_new(j,60))/2;       
    elseif mast_par(j,59) == 1 && mast_par(j,60) > 1
       so2_B(j) = mast_int_new(j,59);
    elseif mast_par(j,60) == 1 && mast_par(j,59) > 1
       so2_B(j) = mast_int_new(j,60);
    end
    
    % no so3 measurements at lower levels in first months of 2013
    if year == 2013
       so2_A(j) = so2_B(j);
    end
        
        
    % no at 6.3 m in ppb
    if (mast_par(j,37) == 1 && mast_par(j,38) == 1 || mast_par(j,37) > 1 && mast_par(j,38) > 1)
       no_A(j)  = (mast_int_new(j,37) + mast_int_new(j,38))/2;      
    elseif mast_par(j,37) == 1 && mast_par(j,38) > 1
       no_A(j)  = mast_int_new(j,37); 
    elseif mast_par(j,38) == 1 && mast_par(j,37) > 1
       no_A(j)  = mast_int_new(j,38); 
    end
    
    % no at 25.2 m in ppb
    if (mast_par(j,35) == 1 && mast_par(j,36) == 1 || mast_par(j,35) > 1 && mast_par(j,36) > 1)
       no_B(j)  = (mast_int_new(j,35) + mast_int_new(j,36))/2; 
    elseif mast_par(j,35) == 1 && mast_par(j,36) > 1
       no_B(j)  = mast_int_new(j,35); 
    elseif mast_par(j,36) == 1 && mast_par(j,35) > 1
       no_B(j)  = mast_int_new(j,36); 
    end
    
    % nox at 6.3 m in ppb
    if (mast_par(j,45) == 1 && mast_par(j,46) == 1 || mast_par(j,45) > 1 && mast_par(j,46) > 1)
       no2_A(j) = (mast_int_new(j,45) + mast_int_new(j,46))/2;
    elseif mast_par(j,45) == 1 && mast_par(j,46) > 1
       no2_A(j) = mast_int_new(j,45);
    elseif mast_par(j,46) == 1 && mast_par(j,45) > 1
       no2_A(j) = mast_int_new(j,46);
    end
    
    % nox at 25.2 m in ppb
    if (mast_par(j,43) == 1 && mast_par(j,44) == 1 || mast_par(j,43) > 1 && mast_par(j,44) > 1)
       no2_B(j) = (mast_int_new(j,43) + mast_int_new(j,44))/2;
    elseif mast_par(j,43) == 1 && mast_par(j,44) > 1
       no2_B(j) = mast_int_new(j,43); 
    elseif mast_par(j,44) == 1 && mast_par(j,43) > 1
       no2_B(j) = mast_int_new(j,44); 
    end
    
    % h2o at 6.3 m in ppth
    if (mast_par(j,69) == 1 && mast_par(j,70) == 1 || mast_par(j,69) > 1 && mast_par(j,70) > 1)
       h2o_A(j) = (mast_int_new(j,69) + mast_int_new(j,70))/2;      
    elseif mast_par(j,69) == 1 && mast_par(j,70) > 1
       h2o_A(j) = mast_int_new(j,69);  
    elseif mast_par(j,70) == 1 && mast_par(j,69) > 1
       h2o_A(j) = mast_int_new(j,70);  
    end
    
    % h2o at 25.2 m in ppth
    if (mast_par(j,67) == 1 && mast_par(j,68) == 1 || mast_par(j,67) > 1 && mast_par(j,68) > 1)
       h2o_B(j) = (mast_int_new(j,67) + mast_int_new(j,68))/2;      
    elseif mast_par(j,67) == 1 && mast_par(j,68) > 1
       h2o_B(j) = mast_int_new(j,67);  
    elseif mast_par(j,68) == 1 && mast_par(j,67) > 1
       h2o_B(j) = mast_int_new(j,68);  
    end
    
    % h2o at 6 different heights kg / m-3
    air_A(j) =  mast_int_new(j,3) / tem_A(j) / RG * Avog / 1E4;                  % Air molecules at 6.3 m
    air_B(j) =  mast_int_new(j,3) / tem_B(j) / RG * Avog / 1E4;                  % Air molecules at 22.2 m
    h2o_1(j) = mast_int_new(j,65) * air_A(j) / 1E3 / Avog * MH2O / 1E3 * 1E6;
    h2o_2(j) = mast_int_new(j,66) * air_A(j) / 1E3 / Avog * MH2O / 1E3 * 1E6;
    h2o_3(j) = mast_int_new(j,67) * air_A(j) / 1E3 / Avog * MH2O / 1E3 * 1E6;
    h2o_4(j) = mast_int_new(j,68) * air_A(j) / 1E3 / Avog * MH2O / 1E3 * 1E6;
    h2o_5(j) = mast_int_new(j,69) * air_A(j) / 1E3 / Avog * MH2O / 1E3 * 1E6;
    h2o_6(j) = mast_int_new(j,70) * air_A(j) / 1E3 / Avog * MH2O / 1E3 * 1E6;
    
    % co at 6.3 m in ppb
    co_A(j)  = (mast_int_new(j,101) + mast_int_new(j,102))/2;      
    
    % co at 25.2 m in ppb
    co_B(j)  = (mast_int_new(j,100) + mast_int_new(j,99))/2;      
end


% Output
Savepar = 2;
if Savepar == 2
   if  year == 2013, fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2013/data_measured/mast_6m_new.txt','w'); end
   if  year == 2014, fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2014/data_measured/mast_6m_new.txt','w'); end
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

   if  year == 2013, fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2013/data_measured/mast_25m_new.txt','w'); end
   if  year == 2014, fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2014/data_measured/mast_25m_new.txt','w'); end
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
   
   
   if  year == 2013, fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2013/data_measured/mast_int_par.txt','w'); end
   if  year == 2014, fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2014/data_measured/mast_int_par.txt','w'); end
   for j = 1:length(timp)
       fprintf (fid1, '%10.3f',  timp(j));     % date
       for k = 1:102
           fprintf (fid1, '%3.0f',  mast_par(j,k)); 
       end
       fprintf (fid1, '\n');  
   end

   if  year == 2013, fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2013/data_measured/mast_temp.txt','w'); end
   if  year == 2014, fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2014/data_measured/mast_temp.txt','w'); end
   for j = 1:length(timp)
       fprintf (fid1, '%10.3f',  timp(j));     % date
       for k = 1:6
           fprintf (fid1, '%14.2f',  mast_int_new(j,k+3)+273.15);     % temp at different heights
       end
       fprintf (fid1, '\n');  
   end

   if  year == 2013, fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2013/data_measured/mast_h2o.txt','w'); end
   if  year == 2014, fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2014/data_measured/mast_h2o.txt','w'); end
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

   if  year == 2013, fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2013/data_measured/mast_ws.txt','w'); end
   if  year == 2014, fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2014/data_measured/mast_ws.txt','w'); end
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
   if     year == 2013, mast_A   = load('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2013/data_measured/mast_6m_new.txt'); end
   if     year == 2013, mast_B   = load('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2013/data_measured/mast_25m_new.txt'); end
   if     year == 2013, mast_par = load('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2013/data_measured/mast_int_par.txt'); end

   if     year == 2014, mast_A   = load('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2014/data_measured/mast_6m_new.txt'); end
   if     year == 2014, mast_B   = load('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2014/data_measured/mast_25m_new.txt'); end
   if     year == 2014, mast_par = load('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2014/data_measured/mast_int_par.txt'); end

   %% 
   
   
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
   
   
   %% 

   
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
      
   %% 

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
   
   %% 

   if     year == 2013, temp = load('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2013/data_measured/mast_temp.txt'); end
   if     year == 2013, h2o  = load('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2013/data_measured/mast_h2o.txt'); end
   if     year == 2013, wsd  = load('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2013/data_measured/mast_ws.txt'); end

   if     year == 2014, temp = load('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2014/data_measured/mast_temp.txt'); end
   if     year == 2014, h2o  = load('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2014/data_measured/mast_h2o.txt'); end
   if     year == 2014, wsd  = load('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2014/data_measured/mast_ws.txt'); end

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