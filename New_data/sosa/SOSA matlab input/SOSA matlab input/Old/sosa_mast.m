clear all
close all

% Program reads the data from the mme files interpolates and writes the output file for sosa

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

if year == 2010, num_month = 12; else num_month = 12; end


% Open mme files for every month
for mo = 1:num_month
    mo
    if year == 2003
       if mo == 1,      mast = load('c:\\michael\\hyyt\\mast_data\\smear0301.mme');
       elseif mo == 2,  mast = load('c:\\michael\\hyyt\\mast_data\\smear0302.mme');
       elseif mo == 3,  mast = load('c:\\michael\\hyyt\\mast_data\\smear0303.mme');
       elseif mo == 4,  mast = load('c:\\michael\\hyyt\\mast_data\\smear0304.mme');
       elseif mo == 5,  mast = load('c:\\michael\\hyyt\\mast_data\\smear0305.mme');
       elseif mo == 6,  mast = load('c:\\michael\\hyyt\\mast_data\\smear0306.mme'); 
       elseif mo == 7,  mast = load('c:\\michael\\hyyt\\mast_data\\smear0307.mme'); 
       elseif mo == 8,  mast = load('c:\\michael\\hyyt\\mast_data\\smear0308.mme'); 
       elseif mo == 9,  mast = load('c:\\michael\\hyyt\\mast_data\\smear0309.mme'); 
       elseif mo == 10, mast = load('c:\\michael\\hyyt\\mast_data\\smear0310.mme'); 
       elseif mo == 11, mast = load('c:\\michael\\hyyt\\mast_data\\smear0311.mme'); 
       elseif mo == 12, mast = load('c:\\michael\\hyyt\\mast_data\\smear0312.mme'); end
    elseif year == 2004
       if mo == 1,      mast = load('c:\\michael\\hyyt\\mast_data\\smear0401.mme');
       elseif mo == 2,  mast = load('c:\\michael\\hyyt\\mast_data\\smear0402.mme');
       elseif mo == 3,  mast = load('c:\\michael\\hyyt\\mast_data\\smear0403.mme');
       elseif mo == 4,  mast = load('c:\\michael\\hyyt\\mast_data\\smear0404.mme');
       elseif mo == 5,  mast = load('c:\\michael\\hyyt\\mast_data\\smear0405.mme');
       elseif mo == 6,  mast = load('c:\\michael\\hyyt\\mast_data\\smear0406.mme'); 
       elseif mo == 7,  mast = load('c:\\michael\\hyyt\\mast_data\\smear0407.mme'); 
       elseif mo == 8,  mast = load('c:\\michael\\hyyt\\mast_data\\smear0408.mme'); 
       elseif mo == 9,  mast = load('c:\\michael\\hyyt\\mast_data\\smear0409.mme'); 
       elseif mo == 10, mast = load('c:\\michael\\hyyt\\mast_data\\smear0410.mme'); 
       elseif mo == 11, mast = load('c:\\michael\\hyyt\\mast_data\\smear0411.mme'); 
       elseif mo == 12, mast = load('c:\\michael\\hyyt\\mast_data\\smear0412.mme'); end
    elseif year == 2005
       if mo == 1,      mast = load('c:\\michael\\hyyt\\mast_data\\smear0501.mme');
       elseif mo == 2,  mast = load('c:\\michael\\hyyt\\mast_data\\smear0502.mme');
       elseif mo == 3,  mast = load('c:\\michael\\hyyt\\mast_data\\smear0503.mme');
       elseif mo == 4,  mast = load('c:\\michael\\hyyt\\mast_data\\smear0504.mme');
       elseif mo == 5,  mast = load('c:\\michael\\hyyt\\mast_data\\smear0505.mme');
       elseif mo == 6,  mast = load('c:\\michael\\hyyt\\mast_data\\smear0506.mme'); 
       elseif mo == 7,  mast = load('c:\\michael\\hyyt\\mast_data\\smear0507.mme'); 
       elseif mo == 8,  mast = load('c:\\michael\\hyyt\\mast_data\\smear0508.mme'); 
       elseif mo == 9,  mast = load('c:\\michael\\hyyt\\mast_data\\smear0509.mme'); 
       elseif mo == 10, mast = load('c:\\michael\\hyyt\\mast_data\\smear0510.mme'); 
       elseif mo == 11, mast = load('c:\\michael\\hyyt\\mast_data\\smear0511.mme'); 
       elseif mo == 12, mast = load('c:\\michael\\hyyt\\mast_data\\smear0512.mme'); end
    elseif year == 2006
       if mo == 1,      mast = load('c:\\michael\\hyyt\\mast_data\\smear0601.mme');
       elseif mo == 2,  mast = load('c:\\michael\\hyyt\\mast_data\\smear0602.mme');
       elseif mo == 3,  mast = load('c:\\michael\\hyyt\\mast_data\\smear0603.mme');
       elseif mo == 4,  mast = load('c:\\michael\\hyyt\\mast_data\\smear0604.mme');
       elseif mo == 5,  mast = load('c:\\michael\\hyyt\\mast_data\\smear0605.mme');
       elseif mo == 6,  mast = load('c:\\michael\\hyyt\\mast_data\\smear0606.mme'); 
       elseif mo == 7,  mast = load('c:\\michael\\hyyt\\mast_data\\smear0607.mme'); 
       elseif mo == 8,  mast = load('c:\\michael\\hyyt\\mast_data\\smear0608.mme'); 
       elseif mo == 9,  mast = load('c:\\michael\\hyyt\\mast_data\\smear0609.mme'); 
       elseif mo == 10, mast = load('c:\\michael\\hyyt\\mast_data\\smear0610.mme'); 
       elseif mo == 11, mast = load('c:\\michael\\hyyt\\mast_data\\smear0611.mme'); 
       elseif mo == 12, mast = load('c:\\michael\\hyyt\\mast_data\\smear0612.mme'); end
    elseif year == 2007
       if mo == 1,      mast = load('c:\\michael\\hyyt\\mast_data\\smear0701.mme');
       elseif mo == 2,  mast = load('c:\\michael\\hyyt\\mast_data\\smear0702.mme');
       elseif mo == 3,  mast = load('c:\\michael\\hyyt\\mast_data\\smear0703.mme');
       elseif mo == 4,  mast = load('c:\\michael\\hyyt\\mast_data\\smear0704.mme');
       elseif mo == 5,  mast = load('c:\\michael\\hyyt\\mast_data\\smear0705.mme');
       elseif mo == 6,  mast = load('c:\\michael\\hyyt\\mast_data\\smear0706.mme');
       elseif mo == 7,  mast = load('c:\\michael\\hyyt\\mast_data\\smear0707.mme'); 
       elseif mo == 8,  mast = load('c:\\michael\\hyyt\\mast_data\\smear0708.mme'); 
       elseif mo == 9,  mast = load('c:\\michael\\hyyt\\mast_data\\smear0709.mme'); 
       elseif mo == 10, mast = load('c:\\michael\\hyyt\\mast_data\\smear0710.mme'); 
       elseif mo == 11, mast = load('c:\\michael\\hyyt\\mast_data\\smear0711.mme'); 
       elseif mo == 12, mast = load('c:\\michael\\hyyt\\mast_data\\smear0712.mme'); end
    elseif year == 2008
       if mo == 1,      mast = load('c:\\michael\\hyyt\\mast_data\\smear0801.mme');
       elseif mo == 2,  mast = load('c:\\michael\\hyyt\\mast_data\\smear0802.mme');
       elseif mo == 3,  mast = load('c:\\michael\\hyyt\\mast_data\\smear0803.mme');
       elseif mo == 4,  mast = load('c:\\michael\\hyyt\\mast_data\\smear0804.mme');
       elseif mo == 5,  mast = load('c:\\michael\\hyyt\\mast_data\\smear0805.mme');
       elseif mo == 6,  mast = load('c:\\michael\\hyyt\\mast_data\\smear0806.mme');
       elseif mo == 7,  mast = load('c:\\michael\\hyyt\\mast_data\\smear0807.mme'); 
       elseif mo == 8,  mast = load('c:\\michael\\hyyt\\mast_data\\smear0808.mme'); 
       elseif mo == 9,  mast = load('c:\\michael\\hyyt\\mast_data\\smear0809.mme'); 
       elseif mo == 10, mast = load('c:\\michael\\hyyt\\mast_data\\smear0810.mme'); 
       elseif mo == 11, mast = load('c:\\michael\\hyyt\\mast_data\\smear0811.mme'); 
       elseif mo == 12, mast = load('c:\\michael\\hyyt\\mast_data\\smear0812.mme'); end
    elseif year == 2009
       if mo == 1,      mast = load('c:\\michael\\hyyt\\mast_data\\smear0901.mme');
       elseif mo == 2,  mast = load('c:\\michael\\hyyt\\mast_data\\smear0902.mme');
       elseif mo == 3,  mast = load('c:\\michael\\hyyt\\mast_data\\smear0903.mme');
       elseif mo == 4,  mast = load('c:\\michael\\hyyt\\mast_data\\smear0904.mme');
       elseif mo == 5,  mast = load('c:\\michael\\hyyt\\mast_data\\smear0905.mme');
       elseif mo == 6,  mast = load('c:\\michael\\hyyt\\mast_data\\smear0906.mme');
       elseif mo == 7,  mast = load('c:\\michael\\hyyt\\mast_data\\smear0907.mme'); 
       elseif mo == 8,  mast = load('c:\\michael\\hyyt\\mast_data\\smear0908.mme'); 
       elseif mo == 9,  mast = load('c:\\michael\\hyyt\\mast_data\\smear0909.mme'); 
       elseif mo == 10, mast = load('c:\\michael\\hyyt\\mast_data\\smear0910.mme'); 
       elseif mo == 11, mast = load('c:\\michael\\hyyt\\mast_data\\smear0911.mme'); 
       elseif mo == 12, mast = load('c:\\michael\\hyyt\\mast_data\\smear0912.mme'); end
    else year == 2010
       if mo == 1,      mast = load('c:\\michael\\hyyt\\mast_data\\smear1001.mme');
       elseif mo == 2,  mast = load('c:\\michael\\hyyt\\mast_data\\smear1002.mme');
       elseif mo == 3,  mast = load('c:\\michael\\hyyt\\mast_data\\smear1003.mme');
       elseif mo == 4,  mast = load('c:\\michael\\hyyt\\mast_data\\smear1004.mme');
       elseif mo == 5,  mast = load('c:\\michael\\hyyt\\mast_data\\smear1005.mme');
       elseif mo == 6,  mast = load('c:\\michael\\hyyt\\mast_data\\smear1006.mme');
       elseif mo == 7,  mast = load('c:\\michael\\hyyt\\mast_data\\smear1007.mme'); 
       elseif mo == 8,  mast = load('c:\\michael\\hyyt\\mast_data\\smear1008.mme'); 
       elseif mo == 9,  mast = load('c:\\michael\\hyyt\\mast_data\\smear1009.mme'); 
       elseif mo == 10, mast = load('c:\\michael\\hyyt\\mast_data\\smear1010.mme'); 
       elseif mo == 11, mast = load('c:\\michael\\hyyt\\mast_data\\smear1011.mme'); 
       elseif mo == 12, mast = load('c:\\michael\\hyyt\\mast_data\\smear1012.mme'); end
    end
    row  = length(mast);

    for j = 1:row
        date = num2str(mast(j,1));
        mon = eval(date(5:6));
        day = eval(date(7:8));
        hou = eval(date(9:10));
        min = eval(date(11:12));
        sec = eval(date(13:14));
        time(j) = day + hou/24 + min/24/60 + sec/24/60/60;
        
        for k = 2:83
            if mast(j,k) == -999.
               mast(j,k) = NaN;
            end
        end
            
        for k = 28:33
            if mast(j,k) < 0.01
               mast(j,k) = 0.005;
            end
        end
        for k = 36:39
            if mast(j,k) < 0.01
               mast(j,k) = 0.005;
            end
        end
        for k = 48:51
            if mast(j,k) < 0.01
               mast(j,k) = 0.005;
            end
        end

        if year == 2004 || year == 2008
           timp(j+day_month_04(mon)*48) = time(j) + day_month_04(mon);
           for k = 1:83, mast_new(j+day_month_04(mon)*48,k) = mast(j,k); end
        else
           timp(j+day_month_03(mon)*48) = time(j) + day_month_03(mon);
           for k = 1:83, mast_new(j+day_month_03(mon)*48,k) = mast(j,k); end
        end
    end
    clear time mast
end

x = [3 4 25 30 36 42 48 52 72 78 82 10];
y = [3 9 26 33 39 45 51 57 75 81 82 19];
nr_xy = 12;

for i = 1:nr_xy
    for k = x(i):y(i)
        for j = 1:length(mast_new)
            mast_par(j,k) = 1;
            if isnan(mast_new(j,k)) == 1, mast_par(j,k) = 2; end
        end
        if (year == 2005)
            mast_int(1:17510,k) = inter_sosa(mast_new(1:17510,k), 17510);
            for j = 17511:17520, mast_int(j,k) = mast_new(j,k); end
        else 
            mast_int(:,k) = inter_sosa(mast_new(:,k), length(mast_new));
        end
    end
end

if (year == 2003 || year == 2004 || year == 2005), x(10) = 79; y(10) = 79; end
for i = 1:nr_xy
    for k = x(i):y(i)
        for j = 1:length(mast_int)
            if isnan(mast_int(j,k)) == 0
               mast_int_F(j,k) = mast_int(j,k);
               mast_par(j,k) = 1;
            elseif j < 165 
               mast_int_F(j,k) = mast_int(j,k);
               mast_par(j,k) = 3;
            elseif isnan(mast_int(j,k)) == 1 
               mast_int_F(j,k) = (mast_int_F(j-48,k) + mast_int_F(j-48*2,k) + mast_int_F(j-48*3,k))/3;
               %if mast_int_F(j,k) > 1.5*mast_int_F(j-1,k), mast_int_F(j,k) = 1.5*mast_int_F(j-1,k); end
               %if mast_int_F(j,k) < 0.5*mast_int_F(j-1,k), mast_int_F(j,k) = 0.5*mast_int_F(j-1,k); end
               mast_par(j,k) = 3;
            end
        end
        for j = length(mast_int):-1:1
            if isnan(mast_int(j,k)) == 0
               mast_int_B(j,k) = mast_int(j,k);
               mast_par(j,k) = 1;
            elseif (year == 2004 && j > 17403) 
               mast_int_B(j,k) = mast_int(j,k);
               mast_par(j,k) = 3;
            elseif (year == 2008 && j > 8591) 
               mast_int_B(j,k) = mast_int(j,k);
               mast_par(j,k) = 3;
            elseif (year == 2010) 
               mast_int_B(j,k) = mast_int(j,k);
               mast_par(j,k) = 3;
            elseif j > 17355 
               mast_int_B(j,k) = mast_int(j,k);
               mast_par(j,k) = 3;
            elseif isnan(mast_int(j,k)) == 1 && j < length(mast_int)
               mast_int_B(j,k) = (mast_int_B(j+48,k) + mast_int_B(j+48*2,k) + mast_int_B(j+48*3,k))/3;
               %if mast_int_B(j,k) > 1.5*mast_int_B(j+1,k), mast_int_B(j,k) = 1.5*mast_int_B(j+1,k); end
               %if mast_int_B(j,k) < 0.5*mast_int_B(j+1,k), mast_int_B(j,k) = 0.5*mast_int_B(j+1,k); end
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
    
for j = 1:length(mast_int_new)
    % Average for 2 heights and calculating gases in molecules per cm3
    
    pres(j)  =  mast_int_new(j,3);                                               % pressure in hPa     

    if (mast_par(j,25) == 1 && mast_par(j,26) == 1 || mast_par(j,25) > 1 && mast_par(j,26) > 1)
       wd(j)    = (mast_int_new(j,25) + mast_int_new(j,26))/2;                      % WD at 25.2 m
    elseif mast_par(j,25) == 1 && mast_par(j,26) > 1
       wd(j)    = mast_int_new(j,25);
    elseif mast_par(j,25) > 1 && mast_par(j,26) == 1
       wd(j)    = mast_int_new(j,26);
    end
    if wd(j) > 360, wd(j) = 360; end
   
    if (mast_par(j,74) == 1 && mast_par(j,75) == 1 || mast_par(j,74) > 1 && mast_par(j,75) > 1)
       rh_A(j)  = (mast_int_new(j,74) + mast_int_new(j,75))/2;                      % RH at 6.3 m
    elseif mast_par(j,74) == 1 && mast_par(j,75) > 1
       rh_A(j)  = mast_int_new(j,74);                         
    elseif mast_par(j,75) == 1 && mast_par(j,74) > 1
       rh_A(j)  = mast_int_new(j,75);                         
    end
    
    if (mast_par(j,72) == 1 && mast_par(j,73) == 1 || mast_par(j,72) > 1 && mast_par(j,73) > 1)
       rh_B(j)  = (mast_int_new(j,72) + mast_int_new(j,73))/2;                      % RH at 25.2 m
    elseif mast_par(j,72) == 1 && mast_par(j,73) > 1
       rh_B(j)  = mast_int_new(j,72);
    elseif mast_par(j,73) == 1 && mast_par(j,72) > 1
       rh_B(j)  = mast_int_new(j,73);
    end
    if rh_A(j) > 100, rh_A(j) = 100; end
    if rh_B(j) > 100, rh_B(j) = 100; end
    if (year == 2004 && j > 11184 && j < 12609)
       rh_A(j) = mast_int_new(j,82);
       rh_B(j) = mast_int_new(j,82);
    end
    
    if (mast_par(j,8) == 1 && mast_par(j,9) == 1 || mast_par(j,8) > 1 && mast_par(j,9) > 1)
       tem_A(j) = (mast_int_new(j,8)  + mast_int_new(j,9))/2 + 273.15;              % T at 6.3 m
    elseif mast_par(j,8) == 1 && mast_par(j,9) > 1
       tem_A(j) = mast_int_new(j,8) + 273.15;
    elseif mast_par(j,9) == 1 && mast_par(j,8) > 1
       tem_A(j) = mast_int_new(j,9) + 273.15;
    end
    
    if (mast_par(j,6) == 1 && mast_par(j,7) == 1 || mast_par(j,6) > 1 && mast_par(j,7) > 1)
       tem_B(j) = (mast_int_new(j,6)  + mast_int_new(j,7))/2 + 273.15;              % T at 25.2 m
    elseif mast_par(j,6) == 1 && mast_par(j,7) > 1
       tem_B(j) = mast_int_new(j,6) + 273.15;
    elseif mast_par(j,7) == 1 && mast_par(j,6) > 1
       tem_B(j) = mast_int_new(j,7) + 273.15;
    end
   
    air_A(j) =  mast_int_new(j,3) / tem_A(j) / RG * Avog / 1E4;                  % Air molecules at 6.3 m
    air_B(j) =  mast_int_new(j,3) / tem_B(j) / RG * Avog / 1E4;                  % Air molecules at 22.2 m

    if (mast_par(j,44) == 1 && mast_par(j,45) == 1 || mast_par(j,44) > 1 && mast_par(j,45) > 1)
       o3_A(j)  = (mast_int_new(j,44) + mast_int_new(j,45))/2; % * air_A(j) / 1E9;     % o3 at 6.3 m in # cm-3
    elseif mast_par(j,44) == 1 && mast_par(j,45) > 1
       o3_A(j)  = mast_int_new(j,44); % * air_A(j) / 1E9;
    elseif mast_par(j,45) == 1 && mast_par(j,44) > 1
       o3_A(j)  = mast_int_new(j,45); % * air_A(j) / 1E9;
    end
    
    if (mast_par(j,42) == 1 && mast_par(j,43) == 1 || mast_par(j,42) > 1 && mast_par(j,43) > 1)
       o3_B(j)  = (mast_int_new(j,42) + mast_int_new(j,43))/2; % * air_B(j) / 1E9;     % o3 at 25.2 m in # cm-3
    elseif mast_par(j,42) == 1 && mast_par(j,43) > 1
       o3_B(j)  = mast_int_new(j,42); % * air_B(j) / 1E9;
    elseif mast_par(j,43) == 1 && mast_par(j,42) > 1
       o3_B(j)  = mast_int_new(j,43); % * air_B(j) / 1E9;
    end
    
    if (mast_par(j,50) == 1 && mast_par(j,51) == 1 || mast_par(j,50) > 1 && mast_par(j,51) > 1)
       so2_A(j) = (mast_int_new(j,50) + mast_int_new(j,51))/2; % * air_A(j) / 1E9;     % so2 at 6.3 m in # cm-3
    elseif mast_par(j,50) == 1 && mast_par(j,51) > 1
       so2_A(j) = mast_int_new(j,50); % * air_A(j) / 1E9;
    elseif mast_par(j,51) == 1 && mast_par(j,50) > 1
       so2_A(j) = mast_int_new(j,50); % * air_A(j) / 1E9;
    end
    
    if (mast_par(j,48) == 1 && mast_par(j,49) == 1 || mast_par(j,48) > 1 && mast_par(j,49) > 1)
       so2_B(j) = (mast_int_new(j,48) + mast_int_new(j,49))/2; % * air_B(j) / 1E9;     % so2 at 25.2 m in # cm-3 
    elseif mast_par(j,48) == 1 && mast_par(j,49) > 1
       so2_B(j) = mast_int_new(j,48); % * air_B(j) / 1E9;
    elseif mast_par(j,49) == 1 && mast_par(j,48) > 1
       so2_B(j) = mast_int_new(j,49); % * air_B(j) / 1E9;
    end
    
    if (mast_par(j,32) == 1 && mast_par(j,33) == 1 || mast_par(j,32) > 1 && mast_par(j,33) > 1)
       no_A(j)  = (mast_int_new(j,32) + mast_int_new(j,33))/2; % * air_A(j) / 1E9;     % no at 6.3 m in # cm-3
    elseif mast_par(j,32) == 1 && mast_par(j,33) > 1
       no_A(j)  = mast_int_new(j,32); % * air_A(j) / 1E9;
    elseif mast_par(j,33) == 1 && mast_par(j,32) > 1
       no_A(j)  = mast_int_new(j,33); % * air_A(j) / 1E9;
    end
    
    if (mast_par(j,30) == 1 && mast_par(j,31) == 1 || mast_par(j,30) > 1 && mast_par(j,31) > 1)
       no_B(j)  = (mast_int_new(j,30) + mast_int_new(j,31))/2; % * air_B(j) / 1E9;     % no at 25.2 m in # cm-3
    elseif mast_par(j,30) == 1 && mast_par(j,31) > 1
       no_B(j)  = mast_int_new(j,30); % * air_B(j) / 1E9;
    elseif mast_par(j,31) == 1 && mast_par(j,30) > 1
       no_B(j)  = mast_int_new(j,31); % * air_B(j) / 1E9;
    end
    
    if (mast_par(j,38) == 1 && mast_par(j,39) == 1 || mast_par(j,38) > 1 && mast_par(j,39) > 1)
       no2_A(j) = (mast_int_new(j,38) + mast_int_new(j,39))/2; % * air_A(j) / 1E9;     % no2 at 6.3 m in # cm-3
    elseif mast_par(j,38) == 1 && mast_par(j,39) > 1
       no2_A(j) = mast_int_new(j,38); % * air_A(j) / 1E9;
    elseif mast_par(j,39) == 1 && mast_par(j,38) > 1
       no2_A(j) = mast_int_new(j,39); % * air_A(j) / 1E9;
    end
    
    if (mast_par(j,36) == 1 && mast_par(j,37) == 1 || mast_par(j,36) > 1 && mast_par(j,37) > 1)
       no2_B(j) = (mast_int_new(j,36) + mast_int_new(j,37))/2; % * air_B(j) / 1E9;     % no2 at 25.2 m in # cm-3
    elseif mast_par(j,36) == 1 && mast_par(j,37) > 1
       no2_B(j) = mast_int_new(j,36); % * air_B(j) / 1E9;
    elseif mast_par(j,37) == 1 && mast_par(j,36) > 1
       no2_B(j) = mast_int_new(j,37); % * air_B(j) / 1E9;
    end
    
    if (mast_par(j,56) == 1 && mast_par(j,57) == 1 || mast_par(j,56) > 1 && mast_par(j,57) > 1)
       h2o_A(j) = (mast_int_new(j,56) + mast_int_new(j,57))/2; % * air_A(j) / 1E3;     % h2o at 6.3 m in # cm-3
    elseif mast_par(j,56) == 1 && mast_par(j,57) > 1
       h2o_A(j) = mast_int_new(j,56); % * air_A(j) / 1E3;  
    elseif mast_par(j,57) == 1 && mast_par(j,56) > 1
       h2o_A(j) = mast_int_new(j,57); % * air_A(j) / 1E3;  
    end
    
    if (mast_par(j,54) == 1 && mast_par(j,55) == 1 || mast_par(j,54) > 1 && mast_par(j,55) > 1)
       h2o_B(j) = (mast_int_new(j,54) + mast_int_new(j,55))/2; % * air_B(j) / 1E3;     % h2o at 25.2 m in # cm-3
    elseif mast_par(j,54) == 1 && mast_par(j,55) > 1
       h2o_B(j) = mast_int_new(j,54); % * air_B(j) / 1E3; 
    elseif mast_par(j,55) == 1 && mast_par(j,54) > 1
       h2o_B(j) = mast_int_new(j,55); % * air_B(j) / 1E3; 
    end
    h2o_1(j) = mast_int_new(j,52) * air_A(j) / 1E3 / Avog * MH2O / 1E3 * 1E6;
    h2o_2(j) = mast_int_new(j,53) * air_A(j) / 1E3 / Avog * MH2O / 1E3 * 1E6;
    h2o_3(j) = mast_int_new(j,54) * air_A(j) / 1E3 / Avog * MH2O / 1E3 * 1E6;
    h2o_4(j) = mast_int_new(j,55) * air_A(j) / 1E3 / Avog * MH2O / 1E3 * 1E6;
    h2o_5(j) = mast_int_new(j,56) * air_A(j) / 1E3 / Avog * MH2O / 1E3 * 1E6;
    h2o_6(j) = mast_int_new(j,57) * air_A(j) / 1E3 / Avog * MH2O / 1E3 * 1E6;
    if (year == 2004 && j > 11184 && j < 12609)
       ES_A(j) = (a0 + a1 * tem_A(j) + a2 * tem_A(j)^2 + a3 * tem_A(j)^3 + a4 * tem_A(j)^4 + a5 * tem_A(j)^5 + a6 * tem_A(j)^6);
       ES_B(j) = (a0 + a1 * tem_B(j) + a2 * tem_B(j)^2 + a3 * tem_B(j)^3 + a4 * tem_B(j)^4 + a5 * tem_B(j)^5 + a6 * tem_B(j)^6);

       h2o_A(j) = mast_int_new(j,82)/100 * ES_A(j) / 1E8 * Avog / tem_A(j) / RG * MAir / MH2O / air_A(j) * 1E3;
       h2o_B(j) = mast_int_new(j,82)/100 * ES_B(j) / 1E8 * Avog / tem_A(j) / RG * MAir / MH2O / air_A(j) * 1E3;

       for k = 4:9
           mast_int_new(j,k) = mast_int_new(j,k) + 273.15;
       end
       ES_1(j) = (a0 + a1 * mast_int_new(j,4) + a2 * mast_int_new(j,4)^2 + a3 * mast_int_new(j,4)^3 + a4 * mast_int_new(j,4)^4 + a5 * mast_int_new(j,4)^5 + a6 * mast_int_new(j,4)^6);
       ES_2(j) = (a0 + a1 * mast_int_new(j,5) + a2 * mast_int_new(j,5)^2 + a3 * mast_int_new(j,5)^3 + a4 * mast_int_new(j,5)^4 + a5 * mast_int_new(j,5)^5 + a6 * mast_int_new(j,5)^6);
       ES_3(j) = (a0 + a1 * mast_int_new(j,6) + a2 * mast_int_new(j,6)^2 + a3 * mast_int_new(j,6)^3 + a4 * mast_int_new(j,6)^4 + a5 * mast_int_new(j,6)^5 + a6 * mast_int_new(j,6)^6);
       ES_4(j) = (a0 + a1 * mast_int_new(j,7) + a2 * mast_int_new(j,7)^2 + a3 * mast_int_new(j,7)^3 + a4 * mast_int_new(j,7)^4 + a5 * mast_int_new(j,7)^5 + a6 * mast_int_new(j,7)^6);
       ES_5(j) = (a0 + a1 * mast_int_new(j,8) + a2 * mast_int_new(j,8)^2 + a3 * mast_int_new(j,8)^3 + a4 * mast_int_new(j,8)^4 + a5 * mast_int_new(j,8)^5 + a6 * mast_int_new(j,8)^6);
       ES_6(j) = (a0 + a1 * mast_int_new(j,9) + a2 * mast_int_new(j,9)^2 + a3 * mast_int_new(j,9)^3 + a4 * mast_int_new(j,9)^4 + a5 * mast_int_new(j,9)^5 + a6 * mast_int_new(j,9)^6);
    
       h2o_1(j) = mast_int_new(j,82)/100 * ES_1(j) / 1E8 * Avog / mast_int_new(j,4) / RG * MAir / MH2O / Avog * MH2O / 1E3 * 1E6;
       h2o_2(j) = mast_int_new(j,82)/100 * ES_2(j) / 1E8 * Avog / mast_int_new(j,5) / RG * MAir / MH2O / Avog * MH2O / 1E3 * 1E6;
       h2o_3(j) = mast_int_new(j,82)/100 * ES_3(j) / 1E8 * Avog / mast_int_new(j,6) / RG * MAir / MH2O / Avog * MH2O / 1E3 * 1E6;
       h2o_4(j) = mast_int_new(j,82)/100 * ES_4(j) / 1E8 * Avog / mast_int_new(j,7) / RG * MAir / MH2O / Avog * MH2O / 1E3 * 1E6;
       h2o_5(j) = mast_int_new(j,82)/100 * ES_5(j) / 1E8 * Avog / mast_int_new(j,8) / RG * MAir / MH2O / Avog * MH2O / 1E3 * 1E6;
       h2o_6(j) = mast_int_new(j,82)/100 * ES_6(j) / 1E8 * Avog / mast_int_new(j,9) / RG * MAir / MH2O / Avog * MH2O / 1E3 * 1E6;
       for k = 4:9
           mast_int_new(j,k) = mast_int_new(j,k) - 273.15;
       end
    end
    
    if (year == 2003 || year == 2004 || year == 2005) || (year == 2006 && j < 1237) || (year == 2010 && j > 3955) % && j < 11665) 
       co_A(j)  = mast_int_new(j,79); % * air_B(j) / 1E9;                           % co at 16.8 m in # cm-3
       co_B(j)  = mast_int_new(j,79); % * air_A(j) / 1E9;                           % co at 16.8 m in # cm-3
    else
       co_A(j)  = (mast_int_new(j,80) + mast_int_new(j,81))/2; % * air_A(j) / 1E9;     % co at 6.3 m in # cm-3
       co_B(j)  = (mast_int_new(j,78) + mast_int_new(j,79))/2; % * air_B(j) / 1E9;     % co at 25.2 m in # cm-3
    end
end


% Output
Savepar = 2;
if Savepar == 2
   if     year == 2003, fid1 = fopen('c:\\michael\\sosa_in\\year//2003//data_measured\\mast_6m_new.txt','w');
   elseif year == 2004, fid1 = fopen('c:\\michael\\sosa_in\\year//2004//data_measured\\mast_6m_new.txt','w');
   elseif year == 2005, fid1 = fopen('c:\\michael\\sosa_in\\year//2005//data_measured\\mast_6m_new.txt','w');
   elseif year == 2006, fid1 = fopen('c:\\michael\\sosa_in\\year//2006//data_measured\\mast_6m_new.txt','w');
   elseif year == 2007, fid1 = fopen('c:\\michael\\sosa_in\\year//2007//data_measured\\mast_6m_new.txt','w');
   elseif year == 2008, fid1 = fopen('c:\\michael\\sosa_in\\year//2008//data_measured\\mast_6m_new.txt','w'); 
   elseif year == 2009, fid1 = fopen('c:\\michael\\sosa_in\\year//2009//data_measured\\mast_6m_new.txt','w'); 
   elseif year == 2010, fid1 = fopen('c:\\michael\\sosa_in\\year//2010//data_measured\\mast_6m_new.txt','w'); end
   for j = 1:length(timp)
       fprintf (fid1, '%10.3f',  timp(j));     % date
       fprintf (fid1, '%20.5f',  o3_A(j));     % o3 at 6.3 m in # cm-3
       fprintf (fid1, '%20.5f',  so2_A(j));    % so2 at 6.3 m in # cm-3
       fprintf (fid1, '%20.5f',  no_A(j));     % no at 6.3 m in # cm-3
       fprintf (fid1, '%20.5f',  no2_A(j));    % no2 at 6.3 m in # cm-3
       if (year == 2004 && j > 2082 && j < 4019)
          fprintf (fid1, '%20.5f', mean(co_A(4019:4259)));     % co at 6.3 m in # cm-3
       else
          fprintf (fid1, '%20.5f',  co_A(j));     % co at 6.3 m in # cm-3
       end
       fprintf (fid1, '%20.5f',  h2o_A(j));    % h2o at 6.3 m in # cm-3
       fprintf (fid1, '%25.0f',  air_A(j));    % Air molecules at 6.3 m
       fprintf (fid1, '%10.2f',  rh_A(j));     % RH at 6.3 m
       fprintf (fid1, '%10.2f',  tem_A(j));    % T at 6.3 m
       fprintf (fid1, '%25.0f',  pres(j));     % Pressure
       fprintf (fid1, '%10.2f',  wd(j));       % WD at 25.2 m
       fprintf (fid1, '\n');  
   end

   if     year == 2003, fid1 = fopen('c:\\michael\\sosa_in\\year//2003//data_measured\\mast_25m_new.txt','w');
   elseif year == 2004, fid1 = fopen('c:\\michael\\sosa_in\\year//2004//data_measured\\mast_25m_new.txt','w');
   elseif year == 2005, fid1 = fopen('c:\\michael\\sosa_in\\year//2005//data_measured\\mast_25m_new.txt','w');
   elseif year == 2006, fid1 = fopen('c:\\michael\\sosa_in\\year//2006//data_measured\\mast_25m_new.txt','w');
   elseif year == 2007, fid1 = fopen('c:\\michael\\sosa_in\\year//2007//data_measured\\mast_25m_new.txt','w');
   elseif year == 2008, fid1 = fopen('c:\\michael\\sosa_in\\year//2009//data_measured\\mast_25m_new.txt','w'); 
   elseif year == 2009, fid1 = fopen('c:\\michael\\sosa_in\\year//2009//data_measured\\mast_25m_new.txt','w'); 
   elseif year == 2010, fid1 = fopen('c:\\michael\\sosa_in\\year//2010//data_measured\\mast_25m_new.txt','w'); end
   for j = 1:length(timp)
       fprintf (fid1, '%10.3f',  timp(j));     % 1  date
       fprintf (fid1, '%20.5f',  o3_B(j));     % 2  o3 at 25.2 m in # cm-3
       fprintf (fid1, '%20.5f',  so2_B(j));    % 3  so2 at 25.2 m in # cm-3 
       fprintf (fid1, '%20.5f',  no_B(j));     % 4  no at 25.2 m in # cm-3
       fprintf (fid1, '%20.5f',  no2_B(j));    % 5  no2 at 25.2 m in # cm-3
       if (year == 2004 && j > 2082 && j < 4019)
          fprintf (fid1, '%20.0f', mean(co_B(4019:4259)));     % co at 6.3 m in # cm-3
       else
          fprintf (fid1, '%20.0f',  co_B(j));     % co at 25.2 m in # cm-3
       end
       fprintf (fid1, '%20.5f',  h2o_B(j));    % 7  h2o at 25.2 m in # cm-3
       fprintf (fid1, '%25.0f',  air_B(j));    % 8  Air molecules at 25.2 m
       fprintf (fid1, '%10.2f',  rh_B(j));     % 9  RH at 25.2 m
       fprintf (fid1, '%10.2f',  tem_B(j));    % 10 T at 25.2 m
       fprintf (fid1, '%25.0f',  pres(j));     % 11 Pressure
       fprintf (fid1, '%10.2f',  wd(j));       % 12 WD at 25.2 m
       fprintf (fid1, '\n');  
   end

   if     year == 2003, fid1 = fopen('c:\\michael\\sosa_in\\year//2003//data_measured\\mast_int_par.txt','w');
   elseif year == 2004, fid1 = fopen('c:\\michael\\sosa_in\\year//2004//data_measured\\mast_int_par.txt','w');
   elseif year == 2005, fid1 = fopen('c:\\michael\\sosa_in\\year//2005//data_measured\\mast_int_par.txt','w');
   elseif year == 2006, fid1 = fopen('c:\\michael\\sosa_in\\year//2006//data_measured\\mast_int_par.txt','w');
   elseif year == 2007, fid1 = fopen('c:\\michael\\sosa_in\\year//2007//data_measured\\mast_int_par.txt','w');
   elseif year == 2008, fid1 = fopen('c:\\michael\\sosa_in\\year//2008//data_measured\\mast_int_par.txt','w');
   elseif year == 2009, fid1 = fopen('c:\\michael\\sosa_in\\year//2009//data_measured\\mast_int_par.txt','w');
   elseif year == 2010, fid1 = fopen('c:\\michael\\sosa_in\\year//2010//data_measured\\mast_int_par.txt','w'); end
   for j = 1:length(timp)
       fprintf (fid1, '%10.3f',  timp(j));     % date
       for i = 1:nr_xy
           for k = x(i):y(i)
               fprintf (fid1, '%3.0f',  mast_par(j,k)); 
           end
       end
       fprintf (fid1, '\n');  
   end

   if     year == 2003, fid1 = fopen('c:\\michael\\sosa_in\\year//2003//data_measured\\mast_temp.txt','w');
   elseif year == 2004, fid1 = fopen('c:\\michael\\sosa_in\\year//2004//data_measured\\mast_temp.txt','w');
   elseif year == 2005, fid1 = fopen('c:\\michael\\sosa_in\\year//2005//data_measured\\mast_temp.txt','w');
   elseif year == 2006, fid1 = fopen('c:\\michael\\sosa_in\\year//2006//data_measured\\mast_temp.txt','w');
   elseif year == 2007, fid1 = fopen('c:\\michael\\sosa_in\\year//2007//data_measured\\mast_temp.txt','w');
   elseif year == 2008, fid1 = fopen('c:\\michael\\sosa_in\\year//2008//data_measured\\mast_temp.txt','w');
   elseif year == 2009, fid1 = fopen('c:\\michael\\sosa_in\\year//2009//data_measured\\mast_temp.txt','w');
   elseif year == 2010, fid1 = fopen('c:\\michael\\sosa_in\\year//2010//data_measured\\mast_temp.txt','w'); end
   for j = 1:length(timp)
       fprintf (fid1, '%10.3f',  timp(j));     % date
       if year == 2003
          for k = 1:5
              fprintf (fid1, '%14.2f',  mast_int_new(j,k+3)+273.15);     % temp at different heights
          end
          if mast_par(j,9) == 3 && mast_par(j,8) == 1
             fprintf (fid1, '%14.2f',  mast_int_new(j,8)+273.15);
          else
             fprintf (fid1, '%14.2f',  mast_int_new(j,9)+273.15);
          end
       elseif year == 2005 && j > 14053 && j < 15334
          for k = 1:5
              fprintf (fid1, '%14.2f',  mast_int_new(j,k+3)+273.15);     % temp at different heights
          end
          fprintf (fid1, '%14.2f',  (mast_int_new(j,8)+273.15) * (mast_int_new(j,8)+273.15)/(mast_int_new(j,7)+273.15));
       elseif year == 2006 && j > 13296 && j < 15574
          for k = 1:5
              fprintf (fid1, '%14.2f',  mast_int_new(j,k+3)+273.15);     % temp at different heights
          end
          fprintf (fid1, '%14.2f',  (mast_int_new(j,8)+273.15) * (mast_int_new(j,8)+273.15)/(mast_int_new(j,7)+273.15));
       elseif year == 2007 && j > 12502
          for k = 1:5
              fprintf (fid1, '%14.2f',  mast_int_new(j,k+3)+273.15);     % temp at different heights
          end
          fprintf (fid1, '%14.2f',  (mast_int_new(j,8)+273.15) * (mast_int_new(j,8)+273.15)/(mast_int_new(j,7)+273.15));
       elseif year == 2008 && j < 1680
          for k = 1:5
              fprintf (fid1, '%14.2f',  mast_int_new(j,k+3)+273.15);     % temp at different heights
          end
          fprintf (fid1, '%14.2f',  (mast_int_new(j,8)+273.15) * (mast_int_new(j,8)+273.15)/(mast_int_new(j,7)+273.15));
       else
          for k = 1:6
              fprintf (fid1, '%14.2f',  mast_int_new(j,k+3)+273.15);     % temp at different heights
          end
       end
       fprintf (fid1, '\n');  
   end

   if     year == 2003, fid1 = fopen('c:\\michael\\sosa_in\\year//2003//data_measured\\mast_h2o.txt','w');
   elseif year == 2004, fid1 = fopen('c:\\michael\\sosa_in\\year//2004//data_measured\\mast_h2o.txt','w');
   elseif year == 2005, fid1 = fopen('c:\\michael\\sosa_in\\year//2005//data_measured\\mast_h2o.txt','w');
   elseif year == 2006, fid1 = fopen('c:\\michael\\sosa_in\\year//2006//data_measured\\mast_h2o.txt','w');
   elseif year == 2007, fid1 = fopen('c:\\michael\\sosa_in\\year//2007//data_measured\\mast_h2o.txt','w'); 
   elseif year == 2008, fid1 = fopen('c:\\michael\\sosa_in\\year//2008//data_measured\\mast_h2o.txt','w'); 
   elseif year == 2009, fid1 = fopen('c:\\michael\\sosa_in\\year//2009//data_measured\\mast_h2o.txt','w'); 
   elseif year == 2010, fid1 = fopen('c:\\michael\\sosa_in\\year//2010//data_measured\\mast_h2o.txt','w'); end
   for j = 1:length(timp)
       fprintf (fid1, '%10.3f',  timp(j));     % date
       if year == 2008 && j > 432 && j < 1344
          fprintf (fid1, '%10.4f',  h2o_1(j));    % h2o at different heights
          fprintf (fid1, '%10.4f',  h2o_2(j));    % h2o at different heights
          fprintf (fid1, '%10.4f',  h2o_3(j));    % h2o at different heights
          fprintf (fid1, '%10.4f',  h2o_4(j));    % h2o at different heights
          fprintf (fid1, '%10.4f',  h2o_5(j));    % h2o at different heights
          fprintf (fid1, '%10.4f',  h2o_5(j));    % h2o at different heights
       else
          fprintf (fid1, '%10.4f',  h2o_1(j));    % h2o at different heights
          fprintf (fid1, '%10.4f',  h2o_2(j));    % h2o at different heights
          fprintf (fid1, '%10.4f',  h2o_3(j));    % h2o at different heights
          fprintf (fid1, '%10.4f',  h2o_4(j));    % h2o at different heights
          fprintf (fid1, '%10.4f',  h2o_5(j));    % h2o at different heights
          fprintf (fid1, '%10.4f',  h2o_6(j));    % h2o at different heights
       end
       fprintf (fid1, '\n');  
   end

   if     year == 2003, fid1 = fopen('c:\\michael\\sosa_in\\year//2003//data_measured\\mast_ws.txt','w');
   elseif year == 2004, fid1 = fopen('c:\\michael\\sosa_in\\year//2004//data_measured\\mast_ws.txt','w');
   elseif year == 2005, fid1 = fopen('c:\\michael\\sosa_in\\year//2005//data_measured\\mast_ws.txt','w');
   elseif year == 2006, fid1 = fopen('c:\\michael\\sosa_in\\year//2006//data_measured\\mast_ws.txt','w');
   elseif year == 2007, fid1 = fopen('c:\\michael\\sosa_in\\year//2007//data_measured\\mast_ws.txt','w');
   elseif year == 2008, fid1 = fopen('c:\\michael\\sosa_in\\year//2008//data_measured\\mast_ws.txt','w');
   elseif year == 2009, fid1 = fopen('c:\\michael\\sosa_in\\year//2009//data_measured\\mast_ws.txt','w');
   elseif year == 2010, fid1 = fopen('c:\\michael\\sosa_in\\year//2010//data_measured\\mast_ws.txt','w'); end
   for j = 1:length(timp)
       fprintf (fid1, '%10.3f',  timp(j));     % date
       if year == 2003 && j < 14645   %11970
          fprintf (fid1, '%10.4f',  mast_int_new(j,10));    % ws at 74 m
          fprintf (fid1, '%10.4f',  mast_int_new(j,12));    % ws at 33.6 m
          fprintf (fid1, '%10.4f',  mast_int_new(j,13));    % ws at 16.8 m
          fprintf (fid1, '%10.4f',  mast_int_new(j,14));    % ws at 8.4 m
%       elseif year == 2003 && j > 11969 && j < 14645
%          fprintf (fid1, '%10.4f',  mast_int_new(j,10));    % ws at 74 m
%          fprintf (fid1, '%10.4f',  mast_int_new(j,12));    % ws at 33.6 m
%          fprintf (fid1, '%10.4f',  mast_int_new(j,13));    % ws at 16.8 m
%          fprintf (fid1, '%10.4f',  mast_int_new(j,14));    % ws at 8.4 m
       else
          fprintf (fid1, '%10.4f',  mast_int_new(j,16));    % ws at 74 m
          fprintf (fid1, '%10.4f',  mast_int_new(j,17));    % ws at 33.6 m
          fprintf (fid1, '%10.4f',  mast_int_new(j,18));    % ws at 16.8 m
          fprintf (fid1, '%10.4f',  mast_int_new(j,19));    % ws at 8.4 m
       end
       fprintf (fid1, '%10.4f',  mast_int_new(j,25));    % wd at 33.6 m
       fprintf (fid1, '%10.4f',  mast_int_new(j,26));    % wd at 16.8 m
       fprintf (fid1, '\n');  
   end
end


% Check of temp and rh gradients are ok
plotpar = 1;
if plotpar == 1
   if     year == 2003, mast_A = load('c:\\michael\\sosa_in\\year//2003//data_measured\\mast_6m_new.txt');
   elseif year == 2004, mast_A = load('c:\\michael\\sosa_in\\year//2004//data_measured\\mast_6m_new.txt');
   elseif year == 2005, mast_A = load('c:\\michael\\sosa_in\\year//2005//data_measured\\mast_6m_new.txt');
   elseif year == 2006, mast_A = load('c:\\michael\\sosa_in\\year//2006//data_measured\\mast_6m_new.txt');
   elseif year == 2007, mast_A = load('c:\\michael\\sosa_in\\year//2007//data_measured\\mast_6m_new.txt');
   elseif year == 2008, mast_A = load('c:\\michael\\sosa_in\\year//2008//data_measured\\mast_6m_new.txt');
   elseif year == 2009, mast_A = load('c:\\michael\\sosa_in\\year//2009//data_measured\\mast_6m_new.txt');
   elseif year == 2010, mast_A = load('c:\\michael\\sosa_in\\year//2010//data_measured\\mast_6m_new.txt'); end

   if     year == 2003, mast_B = load('c:\\michael\\sosa_in\\year//2003//data_measured\\mast_25m_new.txt');
   elseif year == 2004, mast_B = load('c:\\michael\\sosa_in\\year//2004//data_measured\\mast_25m_new.txt');
   elseif year == 2005, mast_B = load('c:\\michael\\sosa_in\\year//2005//data_measured\\mast_25m_new.txt');
   elseif year == 2006, mast_B = load('c:\\michael\\sosa_in\\year//2006//data_measured\\mast_25m_new.txt');
   elseif year == 2007, mast_B = load('c:\\michael\\sosa_in\\year//2007//data_measured\\mast_25m_new.txt'); 
   elseif year == 2008, mast_B = load('c:\\michael\\sosa_in\\year//2008//data_measured\\mast_25m_new.txt'); 
   elseif year == 2009, mast_B = load('c:\\michael\\sosa_in\\year//2009//data_measured\\mast_25m_new.txt'); 
   elseif year == 2010, mast_B = load('c:\\michael\\sosa_in\\year//2010//data_measured\\mast_25m_new.txt'); end

   
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
       if (mast_par(j,38)+mast_par(j,39))/2 ~= 1
          plot(mast_A(j,1), (mast_par(j,38)+mast_par(j,39))/2, 'ko')
       end
       if (mast_par(j,36)+mast_par(j,37))/2 ~= 1
          plot(mast_A(j,1), (mast_par(j,36)+mast_par(j,37))/2, 'kx')
       end
   end
   legend('NO2 - 6 m', 'NO2 - 25 m');
       
   subplot(313)
   hold on
   plot(mast_A(:,1), mast_A(:,4), 'r-')
   plot(mast_B(:,1), mast_B(:,4), 'r--')
   for j = 1:length(mast_par)
       if (mast_par(j,32)+mast_par(j,33))/2 ~= 1
          plot(mast_A(j,1), (mast_par(j,32)+mast_par(j,33))/2, 'ko')
       end
       if (mast_par(j,30)+mast_par(j,31))/2 ~= 1
          plot(mast_A(j,1), (mast_par(j,30)+mast_par(j,31))/2, 'kx')
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
       if (mast_par(j,44)+mast_par(j,45))/2 ~= 1
          plot(mast_A(j,1), (mast_par(j,44)+mast_par(j,45))/2, 'ko')
       end
       if (mast_par(j,42)+mast_par(j,43))/2 ~= 1
          plot(mast_A(j,1), (mast_par(j,42)+mast_par(j,43))/2, 'kx')
       end
   end
   legend('O3 - 6 m', 'O3 - 25 m');
   title(['Year:  ', num2str(year)])

   subplot(312)
   hold on
   plot(mast_A(:,1), mast_A(:,3), 'r-')
   plot(mast_B(:,1), mast_B(:,3), 'r--')
   for j = 1:length(mast_par)
       if (mast_par(j,50)+mast_par(j,51))/2 ~= 1
          plot(mast_A(j,1), (mast_par(j,50)+mast_par(j,51))/2, 'ko')
       end
       if (mast_par(j,48)+mast_par(j,49))/2 ~= 1
          plot(mast_A(j,1), (mast_par(j,48)+mast_par(j,49))/2, 'kx')
       end
   end
   legend('SO2 - 6 m', 'SO2 - 25 m');
       
   subplot(313)
   hold on
   plot(mast_A(:,1), mast_A(:,6), 'r-')
   plot(mast_B(:,1), mast_B(:,6), 'r--')
   for j = 1:length(mast_par)
       if (mast_par(j,80)+mast_par(j,81))/2 ~= 1
          plot(mast_A(j,1), (mast_par(j,80)+mast_par(j,81))/2, 'ko')
       end
       if (mast_par(j,78)+mast_par(j,79))/2 ~= 1
          plot(mast_A(j,1), (mast_par(j,78)+mast_par(j,79))/2, 'kx')
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
       if (mast_par(j,74)+mast_par(j,75))/2 ~= 1
          plot(mast_A(j,1), (mast_par(j,74)+mast_par(j,75))/2+100, 'ko')
       end
       if (mast_par(j,72)+mast_par(j,73))/2 ~= 1
          plot(mast_A(j,1), (mast_par(j,72)+mast_par(j,73))/2+100, 'kx')
       end
   end
   legend('RH - 6 m', 'RH - 25 m');
   title(['Year:  ', num2str(year)])

   subplot(312)
   hold on
   plot(mast_A(:,1), mast_A(:,7), 'b-')
   plot(mast_B(:,1), mast_B(:,7), 'b--')
   for j = 1:length(mast_par)
       if (mast_par(j,56)+mast_par(j,57))/2 ~= 1
          plot(mast_A(j,1), (mast_par(j,56)+mast_par(j,57))/2, 'ko')
       end
       if (mast_par(j,54)+mast_par(j,55))/2 ~= 1
          plot(mast_A(j,1), (mast_par(j,54)+mast_par(j,55))/2, 'kx')
       end
   end
   legend('H2O - 6 m', 'H2O - 25 m');

   subplot(313)
   hold on
   plot(mast_A(:,1), mast_A(:,8), 'r-')
   plot(mast_B(:,1), mast_B(:,8), 'r--')
   legend('Air - 6 m', 'Air - 25 m');
end
break

   if  year == 2003,    temp = load('c:\\michael\\sosa_in\\year//2003//data_measured\\mast_temp.txt');
   elseif year == 2004, temp = load('c:\\michael\\sosa_in\\year//2004//data_measured\\mast_temp.txt');
   elseif year == 2005, temp = load('c:\\michael\\sosa_in\\year//2005//data_measured\\mast_temp.txt');
   elseif year == 2006, temp = load('c:\\michael\\sosa_in\\year//2006//data_measured\\mast_temp.txt');
   elseif year == 2007, temp = load('c:\\michael\\sosa_in\\year//2007//data_measured\\mast_temp.txt');
   elseif year == 2008, temp = load('c:\\michael\\sosa_in\\year//2008//data_measured\\mast_temp.txt');
   elseif year == 2009, temp = load('c:\\michael\\sosa_in\\year//2009//data_measured\\mast_temp.txt');
   elseif year == 2010, temp = load('c:\\michael\\sosa_in\\year//2010//data_measured\\mast_temp.txt'); end

   if  year == 2003,    h2o = load('c:\\michael\\sosa_in\\year//2003//data_measured\\mast_h2o.txt');
   elseif year == 2004, h2o = load('c:\\michael\\sosa_in\\year//2004//data_measured\\mast_h2o.txt');
   elseif year == 2005, h2o = load('c:\\michael\\sosa_in\\year//2005//data_measured\\mast_h2o.txt');
   elseif year == 2006, h2o = load('c:\\michael\\sosa_in\\year//2006//data_measured\\mast_h2o.txt');
   elseif year == 2007, h2o = load('c:\\michael\\sosa_in\\year//2007//data_measured\\mast_h2o.txt');
   elseif year == 2008, h2o = load('c:\\michael\\sosa_in\\year//2008//data_measured\\mast_h2o.txt');
   elseif year == 2009, h2o = load('c:\\michael\\sosa_in\\year//2009//data_measured\\mast_h2o.txt');
   elseif year == 2010, h2o = load('c:\\michael\\sosa_in\\year//2010//data_measured\\mast_h2o.txt'); end

   if  year == 2003,    wsd = load('c:\\michael\\sosa_in\\year//2003//data_measured\\mast_ws.txt');
   elseif year == 2004, wsd = load('c:\\michael\\sosa_in\\year//2004//data_measured\\mast_ws.txt');
   elseif year == 2005, wsd = load('c:\\michael\\sosa_in\\year//2005//data_measured\\mast_ws.txt');
   elseif year == 2006, wsd = load('c:\\michael\\sosa_in\\year//2006//data_measured\\mast_ws.txt');
   elseif year == 2007, wsd = load('c:\\michael\\sosa_in\\year//2007//data_measured\\mast_ws.txt');
   elseif year == 2008, wsd = load('c:\\michael\\sosa_in\\year//2008//data_measured\\mast_ws.txt');
   elseif year == 2009, wsd = load('c:\\michael\\sosa_in\\year//2009//data_measured\\mast_ws.txt');
   elseif year == 2010, wsd = load('c:\\michael\\sosa_in\\year//2010//data_measured\\mast_ws.txt'); end

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
   plot(wsd(:,1), wsd(:,7), 'r-')%
%end 