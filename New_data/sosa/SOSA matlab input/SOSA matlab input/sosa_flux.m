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

if year == 2013, num_month = 12; else num_month = 12; end


% Open mme files for every month
for mo = 1:num_month
    mo
    if year == 2003
       if mo == 1,      flux = load('/Users/boy/Documents/Michael/Hyyt/Flux/s0301_233c.flx');
       elseif mo == 2,  flux = load('/Users/boy/Documents/Michael/Hyyt/Flux/s0302_233c.flx');
       elseif mo == 3,  flux = load('/Users/boy/Documents/Michael/Hyyt/Flux/s0303_233c.flx');
       elseif mo == 4,  flux = load('/Users/boy/Documents/Michael/Hyyt/Flux/s0304_233c.flx');
       elseif mo == 5,  flux = load('/Users/boy/Documents/Michael/Hyyt/Flux/s0305_233c.flx');
       elseif mo == 6,  flux = load('/Users/boy/Documents/Michael/Hyyt/Flux/s0306_233c.flx'); 
       elseif mo == 7,  flux = load('/Users/boy/Documents/Michael/Hyyt/Flux/s0307_233c.flx'); 
       elseif mo == 8,  flux = load('/Users/boy/Documents/Michael/Hyyt/Flux/s0308_233c.flx'); 
       elseif mo == 9,  flux = load('/Users/boy/Documents/Michael/Hyyt/Flux/s0309_233c.flx'); 
       elseif mo == 10, flux = load('/Users/boy/Documents/Michael/Hyyt/Flux/s0310_233c.flx'); 
       elseif mo == 11, flux = load('/Users/boy/Documents/Michael/Hyyt/Flux/s0311_233c.flx'); 
       elseif mo == 12, flux = load('/Users/boy/Documents/Michael/Hyyt/Flux/s0312_233c.flx'); end
    elseif year == 2004
       if mo == 1,      flux = load('/Users/boy/Documents/Michael/Hyyt/Flux/s0401_233c.flx');
       elseif mo == 2,  flux = load('/Users/boy/Documents/Michael/Hyyt/Flux/s0402_233c.flx');
       elseif mo == 3,  flux = load('/Users/boy/Documents/Michael/Hyyt/Flux/s0403_233c.flx');
       elseif mo == 4,  flux = load('/Users/boy/Documents/Michael/Hyyt/Flux/s0404_233c.flx');
       elseif mo == 5,  flux = load('/Users/boy/Documents/Michael/Hyyt/Flux/s0405_233c.flx');
       elseif mo == 6,  flux = load('/Users/boy/Documents/Michael/Hyyt/Flux/s0406_233c.flx'); 
       elseif mo == 7,  flux = load('/Users/boy/Documents/Michael/Hyyt/Flux/s0407_233c.flx'); 
       elseif mo == 8,  flux = load('/Users/boy/Documents/Michael/Hyyt/Flux/s0408_233c.flx'); 
       elseif mo == 9,  flux = load('/Users/boy/Documents/Michael/Hyyt/Flux/s0409_233c.flx'); 
       elseif mo == 10, flux = load('/Users/boy/Documents/Michael/Hyyt/Flux/s0410_233c.flx'); 
       elseif mo == 11, flux = load('/Users/boy/Documents/Michael/Hyyt/Flux/s0411_233c.flx'); 
       elseif mo == 12, flux = load('/Users/boy/Documents/Michael/Hyyt/Flux/s0412_233c.flx'); end
    elseif year == 2005
       if mo == 1,      flux = load('/Users/boy/Documents/Michael/Hyyt/Flux/s0501_233c.flx');
       elseif mo == 2,  flux = load('/Users/boy/Documents/Michael/Hyyt/Flux/s0502_233c.flx');
       elseif mo == 3,  flux = load('/Users/boy/Documents/Michael/Hyyt/Flux/s0503_233c.flx');
       elseif mo == 4,  flux = load('/Users/boy/Documents/Michael/Hyyt/Flux/s0504_233c.flx');
       elseif mo == 5,  flux = load('/Users/boy/Documents/Michael/Hyyt/Flux/s0505_233c.flx');
       elseif mo == 6,  flux = load('/Users/boy/Documents/Michael/Hyyt/Flux/s0506_233c.flx'); 
       elseif mo == 7,  flux = load('/Users/boy/Documents/Michael/Hyyt/Flux/s0507_233c.flx'); 
       elseif mo == 8,  flux = load('/Users/boy/Documents/Michael/Hyyt/Flux/s0508_233c.flx'); 
       elseif mo == 9,  flux = load('/Users/boy/Documents/Michael/Hyyt/Flux/s0509_233c.flx'); 
       elseif mo == 10, flux = load('/Users/boy/Documents/Michael/Hyyt/Flux/s0510_233c.flx'); 
       elseif mo == 11, flux = load('/Users/boy/Documents/Michael/Hyyt/Flux/s0511_233c.flx'); 
       elseif mo == 12, flux = load('/Users/boy/Documents/Michael/Hyyt/Flux/s0512_233c.flx'); end
    elseif year == 2006
       if mo == 1,      flux = load('/Users/boy/Documents/Michael/Hyyt/Flux/s0601_233c.flx');
       elseif mo == 2,  flux = load('/Users/boy/Documents/Michael/Hyyt/Flux/s0602_233c.flx');
       elseif mo == 3,  flux = load('/Users/boy/Documents/Michael/Hyyt/Flux/s0603_233c.flx');
       elseif mo == 4,  flux = load('/Users/boy/Documents/Michael/Hyyt/Flux/s0604_233c.flx');
       elseif mo == 5,  flux = load('/Users/boy/Documents/Michael/Hyyt/Flux/s0605_233c.flx');
       elseif mo == 6,  flux = load('/Users/boy/Documents/Michael/Hyyt/Flux/s0606_233c.flx'); 
       elseif mo == 7,  flux = load('/Users/boy/Documents/Michael/Hyyt/Flux/s0607_233c.flx'); 
       elseif mo == 8,  flux = load('/Users/boy/Documents/Michael/Hyyt/Flux/s0608_233c.flx'); 
       elseif mo == 9,  flux = load('/Users/boy/Documents/Michael/Hyyt/Flux/s0609_233c.flx'); 
       elseif mo == 10, flux = load('/Users/boy/Documents/Michael/Hyyt/Flux/s0610_233c.flx'); 
       elseif mo == 11, flux = load('/Users/boy/Documents/Michael/Hyyt/Flux/s0611_233c.flx'); 
       elseif mo == 12, flux = load('/Users/boy/Documents/Michael/Hyyt/Flux/s0612_233c.flx'); end
    elseif year == 2007
       if mo == 1,      flux = load('/Users/boy/Documents/Michael/Hyyt/Flux/s0701_233c.flx');
       elseif mo == 2,  flux = load('/Users/boy/Documents/Michael/Hyyt/Flux/s0702_233c.flx');
       elseif mo == 3,  flux = load('/Users/boy/Documents/Michael/Hyyt/Flux/s0703_233c.flx');
       elseif mo == 4,  flux = load('/Users/boy/Documents/Michael/Hyyt/Flux/s0704_233c.flx');
       elseif mo == 5,  flux = load('/Users/boy/Documents/Michael/Hyyt/Flux/s0705_233c.flx');
       elseif mo == 6,  flux = load('/Users/boy/Documents/Michael/Hyyt/Flux/s0706_233c.flx');
       elseif mo == 7,  flux = load('/Users/boy/Documents/Michael/Hyyt/Flux/s0707_233c.flx'); 
       elseif mo == 8,  flux = load('/Users/boy/Documents/Michael/Hyyt/Flux/s0708_233c.flx'); 
       elseif mo == 9,  flux = load('/Users/boy/Documents/Michael/Hyyt/Flux/s0709_233c.flx'); 
       elseif mo == 10, flux = load('/Users/boy/Documents/Michael/Hyyt/Flux/s0710_233c.flx'); 
       elseif mo == 11, flux = load('/Users/boy/Documents/Michael/Hyyt/Flux/s0711_233c.flx'); 
       elseif mo == 12, flux = load('/Users/boy/Documents/Michael/Hyyt/Flux/s0712_233c.flx'); end
    elseif year == 2008
       if mo == 1,      flux = load('/Users/boy/Documents/Michael/Hyyt/Flux/s0801_233c.flx');
       elseif mo == 2,  flux = load('/Users/boy/Documents/Michael/Hyyt/Flux/s0802_233c.flx');
       elseif mo == 3,  flux = load('/Users/boy/Documents/Michael/Hyyt/Flux/s0803_233c.flx');
       elseif mo == 4,  flux = load('/Users/boy/Documents/Michael/Hyyt/Flux/s0804_233c.flx');
       elseif mo == 5,  flux = load('/Users/boy/Documents/Michael/Hyyt/Flux/s0805_233c.flx');
       elseif mo == 6,  flux = load('/Users/boy/Documents/Michael/Hyyt/Flux/s0806_233c.flx');
       elseif mo == 7,  flux = load('/Users/boy/Documents/Michael/Hyyt/Flux/s0807_233c.flx');
       elseif mo == 8,  flux = load('/Users/boy/Documents/Michael/Hyyt/Flux/s0808_233c.flx');
       elseif mo == 9,  flux = load('/Users/boy/Documents/Michael/Hyyt/Flux/s0809_233c.flx');
       elseif mo == 10, flux = load('/Users/boy/Documents/Michael/Hyyt/Flux/s0810_233c.flx');
       elseif mo == 11, flux = load('/Users/boy/Documents/Michael/Hyyt/Flux/s0811_233c.flx');
       elseif mo == 12, flux = load('/Users/boy/Documents/Michael/Hyyt/Flux/s0812_233c.flx'); end
    elseif year == 2009
       if mo == 1,      flux = load('/Users/boy/Documents/Michael/Hyyt/Flux/s0901_233c.flx');
       elseif mo == 2,  flux = load('/Users/boy/Documents/Michael/Hyyt/Flux/s0902_233c.flx');
       elseif mo == 3,  flux = load('/Users/boy/Documents/Michael/Hyyt/Flux/s0903_233c.flx');
       elseif mo == 4,  flux = load('/Users/boy/Documents/Michael/Hyyt/Flux/s0904_233c.flx');
       elseif mo == 5,  flux = load('/Users/boy/Documents/Michael/Hyyt/Flux/s0905_233c.flx');
       elseif mo == 6,  flux = load('/Users/boy/Documents/Michael/Hyyt/Flux/s0906_233c.flx');
       elseif mo == 7,  flux = load('/Users/boy/Documents/Michael/Hyyt/Flux/s0907_233c.flx');
       elseif mo == 8,  flux = load('/Users/boy/Documents/Michael/Hyyt/Flux/s0908_233c.flx');
       elseif mo == 9,  flux = load('/Users/boy/Documents/Michael/Hyyt/Flux/s0909_233c.flx');
       elseif mo == 10, flux = load('/Users/boy/Documents/Michael/Hyyt/Flux/s0910_233c.flx');
       elseif mo == 11, flux = load('/Users/boy/Documents/Michael/Hyyt/Flux/s0911_233c.flx');
       elseif mo == 12, flux = load('/Users/boy/Documents/Michael/Hyyt/Flux/s0912_233c.flx'); end
    elseif year == 2010
       if mo == 1,      flux = load('/Users/boy/Documents/Michael/Hyyt/Flux/s1001_233c.flx');
       elseif mo == 2,  flux = load('/Users/boy/Documents/Michael/Hyyt/Flux/s1002_233c.flx');
       elseif mo == 3,  flux = load('/Users/boy/Documents/Michael/Hyyt/Flux/s1003_233c.flx');
       elseif mo == 4,  flux = load('/Users/boy/Documents/Michael/Hyyt/Flux/s1004_233c.flx');
       elseif mo == 5,  flux = load('/Users/boy/Documents/Michael/Hyyt/Flux/s1005_233c.flx');
       elseif mo == 6,  flux = load('/Users/boy/Documents/Michael/Hyyt/Flux/s1006_233c.flx');
       elseif mo == 7,  flux = load('/Users/boy/Documents/Michael/Hyyt/Flux/s1007_233c.flx');
       elseif mo == 8,  flux = load('/Users/boy/Documents/Michael/Hyyt/Flux/s1008_233c.flx');
       elseif mo == 9,  flux = load('/Users/boy/Documents/Michael/Hyyt/Flux/s1009_233c.flx');
       elseif mo == 10, flux = load('/Users/boy/Documents/Michael/Hyyt/Flux/s1010_233c.flx');
       elseif mo == 11, flux = load('/Users/boy/Documents/Michael/Hyyt/Flux/s1011_233c.flx');
       elseif mo == 12, flux = load('/Users/boy/Documents/Michael/Hyyt/Flux/s1012_233c.flx'); end
    elseif year == 2011
       if mo == 1,      flux = load('/Users/boy/Documents/Michael/Hyyt/Flux/s1101_233c.flx');
       elseif mo == 2,  flux = load('/Users/boy/Documents/Michael/Hyyt/Flux/s1102_233c.flx');
       elseif mo == 3,  flux = load('/Users/boy/Documents/Michael/Hyyt/Flux/s1103_233c.flx');
       elseif mo == 4,  flux = load('/Users/boy/Documents/Michael/Hyyt/Flux/s1104_233c.flx');
       elseif mo == 5,  flux = load('/Users/boy/Documents/Michael/Hyyt/Flux/s1105_233c.flx');
       elseif mo == 6,  flux = load('/Users/boy/Documents/Michael/Hyyt/Flux/s1106_233c.flx');
       elseif mo == 7,  flux = load('/Users/boy/Documents/Michael/Hyyt/Flux/s1107_233c.flx');
       elseif mo == 8,  flux = load('/Users/boy/Documents/Michael/Hyyt/Flux/s1108_233c.flx');
       elseif mo == 9,  flux = load('/Users/boy/Documents/Michael/Hyyt/Flux/s1109_233c.flx');
       elseif mo == 10, flux = load('/Users/boy/Documents/Michael/Hyyt/Flux/s1110_233c.flx');
       elseif mo == 11, flux = load('/Users/boy/Documents/Michael/Hyyt/Flux/s1111_233c.flx');
       elseif mo == 12, flux = load('/Users/boy/Documents/Michael/Hyyt/Flux/s1112_233c.flx'); end
    elseif year == 2012
       if mo == 1,      flux = load('/Users/boy/Documents/Michael/Hyyt/Flux/s1201_233c.flx');
       elseif mo == 2,  flux = load('/Users/boy/Documents/Michael/Hyyt/Flux/s1202_233c.flx');
       elseif mo == 3,  flux = load('/Users/boy/Documents/Michael/Hyyt/Flux/s1203_233c.flx');
       elseif mo == 4,  flux = load('/Users/boy/Documents/Michael/Hyyt/Flux/s1204_233c.flx');
       elseif mo == 5,  flux = load('/Users/boy/Documents/Michael/Hyyt/Flux/s1205_233c.flx');
       elseif mo == 6,  flux = load('/Users/boy/Documents/Michael/Hyyt/Flux/s1206_233c.flx');
       elseif mo == 7,  flux = load('/Users/boy/Documents/Michael/Hyyt/Flux/s1207_233c.flx');
       elseif mo == 8,  flux = load('/Users/boy/Documents/Michael/Hyyt/Flux/s1208_233c.flx');
       elseif mo == 9,  flux = load('/Users/boy/Documents/Michael/Hyyt/Flux/s1209_233c.flx');
       elseif mo == 10, flux = load('/Users/boy/Documents/Michael/Hyyt/Flux/s1210_233c.flx');
       elseif mo == 11, flux = load('/Users/boy/Documents/Michael/Hyyt/Flux/s1211_233c.flx');
       elseif mo == 12, flux = load('/Users/boy/Documents/Michael/Hyyt/Flux/s1212_233c.flx'); end
    elseif year == 2013
       if mo == 1,      flux = load('/Users/boy/Documents/Michael/Hyyt/Flux/s1301_233c.flx');
       elseif mo == 2,  flux = load('/Users/boy/Documents/Michael/Hyyt/Flux/s1302_233c.flx');
       elseif mo == 3,  flux = load('/Users/boy/Documents/Michael/Hyyt/Flux/s1303_233c.flx');
       elseif mo == 4,  flux = load('/Users/boy/Documents/Michael/Hyyt/Flux/s1304_233c.flx');
       elseif mo == 5,  flux = load('/Users/boy/Documents/Michael/Hyyt/Flux/s1305_233c.flx');
       elseif mo == 6,  flux = load('/Users/boy/Documents/Michael/Hyyt/Flux/s1306_233c.flx');
       elseif mo == 7,  flux = load('/Users/boy/Documents/Michael/Hyyt/Flux/s1307_233c.flx');
       elseif mo == 8,  flux = load('/Users/boy/Documents/Michael/Hyyt/Flux/s1308_233c.flx');
       elseif mo == 9,  flux = load('/Users/boy/Documents/Michael/Hyyt/Flux/s1309_233c.flx');
       elseif mo == 10, flux = load('/Users/boy/Documents/Michael/Hyyt/Flux/s1310_233c.flx');
       elseif mo == 11, flux = load('/Users/boy/Documents/Michael/Hyyt/Flux/s1311_233c.flx');
       elseif mo == 12, flux = load('/Users/boy/Documents/Michael/Hyyt/Flux/s1312_233c.flx'); end
    elseif year == 2014
       if mo == 1,      flux = load('/Users/boy/Documents/Michael/Hyyt/Flux/s1401_233c.flx');
       elseif mo == 2,  flux = load('/Users/boy/Documents/Michael/Hyyt/Flux/s1402_233c.flx');
       elseif mo == 3,  flux = load('/Users/boy/Documents/Michael/Hyyt/Flux/s1403_233c.flx');
       elseif mo == 4,  flux = load('/Users/boy/Documents/Michael/Hyyt/Flux/s1404_233c.flx');
       elseif mo == 5,  flux = load('/Users/boy/Documents/Michael/Hyyt/Flux/s1405_233c.flx');
       elseif mo == 6,  flux = load('/Users/boy/Documents/Michael/Hyyt/Flux/s1406_233c.flx');
       elseif mo == 7,  flux = load('/Users/boy/Documents/Michael/Hyyt/Flux/s1407_233c.flx');
       elseif mo == 8,  flux = load('/Users/boy/Documents/Michael/Hyyt/Flux/s1408_233c.flx');
       elseif mo == 9,  flux = load('/Users/boy/Documents/Michael/Hyyt/Flux/s1409_233c.flx');
       elseif mo == 10, flux = load('/Users/boy/Documents/Michael/Hyyt/Flux/s1410_233c.flx');
       elseif mo == 11, flux = load('/Users/boy/Documents/Michael/Hyyt/Flux/s1411_233c.flx');
       elseif mo == 12, flux = load('/Users/boy/Documents/Michael/Hyyt/Flux/s1412_233c.flx'); end
    end
    row  = length(flux);

    for j = 1:row
        day = flux(j,2);
        hou = flux(j,3);
        min = flux(j,4);
        time(j) = day + hou/24 + min/24/60;
        
        for k = 1:47
            if flux(j,k) == -999.
               flux(j,k) = NaN;
            end
        end

        if year == 2004 || year == 2008 || year == 2012
           timp(j+day_month_04(mo)*48) = time(j);
           for k = 1:47, flux_new(j+day_month_04(mo)*48,k) = flux(j,k); end
        else
           timp(j+day_month_03(mo)*48) = time(j);
           for k = 1:47, flux_new(j+day_month_03(mo)*48,k) = flux(j,k); end
        end
    end
    clear time flux
end

x = [5 18 25];
y = [11 20 25];
nr_xy = 3;

for i = 1:nr_xy
    for k = x(i):y(i)
        for j = 1:length(flux_new)
            flux_par(j,k) = 1;
            if isnan(flux_new(j,k)) == 1, flux_par(j,k) = 2; end
        end
        flux_int(:,k) = inter_sosa(flux_new(:,k), length(flux_new));
    end
end

for i = 1:nr_xy
    for k = x(i):y(i)
        for j = 1:length(flux_int)
            if isnan(flux_int(j,k)) == 0
               flux_int_F(j,k) = flux_int(j,k);
               flux_par(j,k) = 1;
            elseif j < 165 
               flux_int_F(j,k) = flux_int(j,k);
               flux_par(j,k) = 3;
            elseif isnan(flux_int(j,k)) == 1 
               flux_int_F(j,k) = (flux_int_F(j-48,k) + flux_int_F(j-48*2,k) + flux_int_F(j-48*3,k))/3;
               flux_par(j,k) = 3;
            end
        end
        for j = length(flux_int):-1:1
            if isnan(flux_int(j,k)) == 0
               flux_int_B(j,k) = flux_int(j,k);
               flux_par(j,k) = 1;
            elseif (year == 2004 && j > 17403) 
               flux_int_B(j,k) = flux_int(j,k);
               flux_par(j,k) = 3;
            elseif j > 17355 
               flux_int_B(j,k) = flux_int(j,k);
               flux_par(j,k) = 3;
            % Only as long as 2013 is run for 6 month !!!
            elseif (year == 2013 && j > 8680) 
               flux_int_B(j,k) = flux_int(j,k);
               flux_par(j,k) = 3;
            elseif isnan(flux_int(j,k)) == 1 && j < length(flux_int)
               flux_int_B(j,k) = (flux_int_B(j+48,k) + flux_int_B(j+48*2,k) + flux_int_B(j+48*3,k))/3;
               flux_par(j,k) = 3;
            end
        end
        for j = 1:length(flux_int)
            if isnan(flux_int_F(j,k)) == 0 && isnan(flux_int_B(j,k)) == 0 
               flux_int_new(j,k) = (flux_int_F(j,k) + flux_int_B(j,k)) / 2; 
            elseif isnan(flux_int_F(j,k)) == 1 && isnan(flux_int_B(j,k)) == 0 
               flux_int_new(j,k) = flux_int_B(j,k); 
            elseif isnan(flux_int_F(j,k)) == 0 && isnan(flux_int_B(j,k)) == 1 
               flux_int_new(j,k) = flux_int_F(j,k); 
            end
        end
    end
end
    


% Output
Savepar = 2;
if Savepar == 2
   if     year == 2003, fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2003/data_measured/flux_23m.txt','w');
   elseif year == 2004, fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2004/data_measured/flux_23m.txt','w');
   elseif year == 2005, fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2005/data_measured/flux_23m.txt','w');
   elseif year == 2006, fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2006/data_measured/flux_23m.txt','w');
   elseif year == 2007, fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2007/data_measured/flux_23m.txt','w'); 
   elseif year == 2008, fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2008/data_measured/flux_23m.txt','w'); 
   elseif year == 2009, fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2009/data_measured/flux_23m.txt','w'); 
   elseif year == 2010, fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2010/data_measured/flux_23m.txt','w'); 
   elseif year == 2011, fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2011/data_measured/flux_23m.txt','w');
   elseif year == 2012, fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2012/data_measured/flux_23m.txt','w');
   elseif year == 2013, fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2013/data_measured/flux_23m.txt','w');
   elseif year == 2014, fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2014/data_measured/flux_23m.txt','w'); end
   for j = 1:length(timp)
       fprintf (fid1, '%10.3f',  timp(j));                % 1  = date
       fprintf (fid1, '%15.3f',  flux_int_new(j,10));     % 2  = u* in m/s
       fprintf (fid1, '%15.3f',  flux_int_new(j,11));     % 3  = MOL in m
       fprintf (fid1, '%15.3f',  flux_int_new(j,9));      % 4  = tau in m2/s2
       fprintf (fid1, '%15.3f',  flux_int_new(j,5));      % 5  = sensible heat flux in W/m2
       fprintf (fid1, '%15.3f',  flux_int_new(j,6));      % 6  = latent heat flux in W/m2
       fprintf (fid1, '%15.3f',  flux_int_new(j,7));      % 7  = water vapour flux in mmo/m2/s
       fprintf (fid1, '%15.3f',  flux_int_new(j,18));     % 8  = average wind component u m/s
       fprintf (fid1, '%15.3f',  flux_int_new(j,19));     % 9  = average wind component v m/s
       fprintf (fid1, '%15.3f',  flux_int_new(j,20));     % 10 = average wind component w m/s
       fprintf (fid1, '%15.3f',  flux_int_new(j,25));     % 11 = average wind direction degree
       fprintf (fid1, '\n');  
   end

   if     year == 2003, fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2003/data_measured/flux_int_par.txt','w');
   elseif year == 2004, fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2004/data_measured/flux_int_par.txt','w');
   elseif year == 2005, fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2005/data_measured/flux_int_par.txt','w');
   elseif year == 2006, fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2006/data_measured/flux_int_par.txt','w');
   elseif year == 2007, fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2007/data_measured/flux_int_par.txt','w'); 
   elseif year == 2008, fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2008/data_measured/flux_int_par.txt','w'); 
   elseif year == 2009, fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2009/data_measured/flux_int_par.txt','w'); 
   elseif year == 2010, fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2010/data_measured/flux_int_par.txt','w'); 
   elseif year == 2011, fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2011/data_measured/flux_int_par.txt','w');
   elseif year == 2012, fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2012/data_measured/flux_int_par.txt','w');
   elseif year == 2013, fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2013/data_measured/flux_int_par.txt','w'); 
   elseif year == 2014, fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2014/data_measured/flux_int_par.txt','w'); end
   for j = 1:length(timp)
       fprintf (fid1, '%10.3f',  timp(j));     % date
       for i = 1:nr_xy
           for k = x(i):y(i)
               fprintf (fid1, '%3.0f',  flux_par(j,k)); 
           end
       end
       fprintf (fid1, '\n');  
   end
end


% Check of temp and rh gradients are ok
plotpar = 1;
if plotpar == 1
   if     year == 2003, flux_A = load('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2003/data_measured/flux_23m.txt');
   elseif year == 2004, flux_A = load('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2004/data_measured/flux_23m.txt');
   elseif year == 2005, flux_A = load('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2005/data_measured/flux_23m.txt');
   elseif year == 2006, flux_A = load('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2006/data_measured/flux_23m.txt');
   elseif year == 2007, flux_A = load('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2007/data_measured/flux_23m.txt');
   elseif year == 2008, flux_A = load('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2008/data_measured/flux_23m.txt');
   elseif year == 2009, flux_A = load('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2009/data_measured/flux_23m.txt');
   elseif year == 2010, flux_A = load('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2010/data_measured/flux_23m.txt'); 
   elseif year == 2011, flux_A = load('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2011/data_measured/flux_23m.txt');
   elseif year == 2012, flux_A = load('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2012/data_measured/flux_23m.txt');
   elseif year == 2013, flux_A = load('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2013/data_measured/flux_23m.txt');
   elseif year == 2014, flux_A = load('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2014/data_measured/flux_23m.txt'); end

   
   figure(1)
   clf
   subplot(211)
   hold on
   plot(flux_A(:,1), flux_A(:,2), 'r-')
   for j = 1:length(flux_par)
       if flux_par(j,10) ~= 1
          plot(flux_A(j,1), flux_par(j,10), 'ko')
       end
   end
   legend('U star')
   title(['Year:  ', num2str(year)])
   
       
   subplot(212)
   hold on
   plot(flux_A(:,1), flux_A(:,3), 'r-')
   for j = 1:length(flux_par)
       if flux_par(j,11) ~= 1
          plot(flux_A(j,1), flux_par(j,11), 'ko')
       end
   end
   legend('MOL')
       

   
   figure(2)
   clf
   subplot(311)
   hold on
   plot(flux_A(:,1), flux_A(:,5), 'r-')
   %for j = 1:length(flux_par)
   %    if flux_par(j,10) ~= 1
   %       plot(flux_A(j,1), flux_par(j,10), 'ko')
   %    end
   %end
   legend('Sensible heat flux')
   title(['Year:  ', num2str(year)])
   
       
   subplot(312)
   hold on
   plot(flux_A(:,1), flux_A(:,6), 'r-')
   %for j = 1:length(flux_par)
   %    if flux_par(j,11) ~= 1
   %       plot(flux_A(j,1), flux_par(j,11), 'ko')
   %    end
   %end
   legend('latent heat flux')


   subplot(313)
   hold on
   plot(flux_A(:,1), flux_A(:,7), 'r-')
   %for j = 1:length(flux_par)
   %    if flux_par(j,11) ~= 1
   %       plot(flux_A(j,1), flux_par(j,11), 'ko')
   %    end
   %end
   legend('water vapour flux')


   
   figure(3)
   clf
   subplot(411)
   hold on
   plot(flux_A(:,1), flux_A(:,8), 'r-')
   %for j = 1:length(flux_par)
   %    if flux_par(j,10) ~= 1
   %       plot(flux_A(j,1), flux_par(j,10), 'ko')
   %    end
   %end
   legend('average wind component u')
   title(['Year:  ', num2str(year)])
   
       
   subplot(412)
   hold on
   plot(flux_A(:,1), flux_A(:,9), 'r-')
   %for j = 1:length(flux_par)
   %    if flux_par(j,11) ~= 1
   %       plot(flux_A(j,1), flux_par(j,11), 'ko')
   %    end
   %end
   legend('average wind component v')


   subplot(413)
   hold on
   plot(flux_A(:,1), flux_A(:,10), 'r-')
   %for j = 1:length(flux_par)
   %    if flux_par(j,11) ~= 1
   %       plot(flux_A(j,1), flux_par(j,11), 'ko')
   %    end
   %end
   legend('average wind component w')


   subplot(414)
   hold on
   plot(flux_A(:,1), flux_A(:,11), 'r-')
   %for j = 1:length(flux_par)
   %    if flux_par(j,11) ~= 1
   %       plot(flux_A(j,1), flux_par(j,11), 'ko')
   %    end
   %end
   legend('average wind direction')

end

