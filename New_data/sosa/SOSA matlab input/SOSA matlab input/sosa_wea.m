clear all

% Program reads the data from the wea files and writes the data in an
% output file used in carboeuroflux (Michael Boy June 2012)

% Open sme files for every month

YEAR = input('Year:  ', 's');
year = eval(YEAR);

day_month_03 = [0 31 59 90 120 151 181 212 243 273 304 334];
day_month_04 = [0 31 60 91 121 152 182 213 244 274 305 335];
if year == 2004 || year == 2008, day_month = day_month_04; else day_month = day_month_03; end


if year == 2011, num_month = 12; else num_month = 12; end


% Open mme files for every month
for mo = 1:num_month
    mo
    if year == 2010
       if mo == 1,      wea = load('c:\HY-data\BOY\documents\Hyyt\Precipitation\\smear1001.wme');
       elseif mo == 2,  wea = load('c:\HY-data\BOY\documents\Hyyt\Precipitation\\smear1002.wme');
       elseif mo == 3,  wea = load('c:\HY-data\BOY\documents\Hyyt\Precipitation\\smear1003.wme');
       elseif mo == 4,  wea = load('c:\HY-data\BOY\documents\Hyyt\Precipitation\\smear1004.wme');
       elseif mo == 5,  wea = load('c:\HY-data\BOY\documents\Hyyt\Precipitation\\smear1005.wme');
       elseif mo == 6,  wea = load('c:\HY-data\BOY\documents\Hyyt\Precipitation\\smear1006.wme'); 
       elseif mo == 7,  wea = load('c:\HY-data\BOY\documents\Hyyt\Precipitation\\smear1007.wme'); 
       elseif mo == 8,  wea = load('c:\HY-data\BOY\documents\Hyyt\Precipitation\\smear1008.wme'); 
       elseif mo == 9,  wea = load('c:\HY-data\BOY\documents\Hyyt\Precipitation\\smear1009.wme'); 
       elseif mo == 10, wea = load('c:\HY-data\BOY\documents\Hyyt\Precipitation\\smear1010.wme'); 
       elseif mo == 11, wea = load('c:\HY-data\BOY\documents\Hyyt\Precipitation\\smear1011.wme'); 
       elseif mo == 12, wea = load('c:\HY-data\BOY\documents\Hyyt\Precipitation\\smear1012.wme'); end
    end
    if year == 2011
       if mo == 1,      wea = load('c:\HY-data\BOY\documents\Hyyt\Precipitation\\smear1101.wme');
       elseif mo == 2,  wea = load('c:\HY-data\BOY\documents\Hyyt\Precipitation\\smear1102.wme');
       elseif mo == 3,  wea = load('c:\HY-data\BOY\documents\Hyyt\Precipitation\\smear1103.wme');
       elseif mo == 4,  wea = load('c:\HY-data\BOY\documents\Hyyt\Precipitation\\smear1104.wme');
       elseif mo == 5,  wea = load('c:\HY-data\BOY\documents\Hyyt\Precipitation\\smear1105.wme');
       elseif mo == 6,  wea = load('c:\HY-data\BOY\documents\Hyyt\Precipitation\\smear1106.wme'); 
       elseif mo == 7,  wea = load('c:\HY-data\BOY\documents\Hyyt\Precipitation\\smear1107.wme'); 
       elseif mo == 8,  wea = load('c:\HY-data\BOY\documents\Hyyt\Precipitation\\smear1108.wme'); 
       elseif mo == 9,  wea = load('c:\HY-data\BOY\documents\Hyyt\Precipitation\\smear1109.wme'); 
       elseif mo == 10, wea = load('c:\HY-data\BOY\documents\Hyyt\Precipitation\\smear1110.wme'); 
       elseif mo == 11, wea = load('c:\HY-data\BOY\documents\Hyyt\Precipitation\\smear1111.wme'); 
       elseif mo == 12, wea = load('c:\HY-data\BOY\documents\Hyyt\Precipitation\\smear1112.wme'); end
    end
    row  = length(wea);

    for j = 1:row
        date = num2str(wea(j,1));
        mon = eval(date(5:6));
        day = eval(date(7:8));
        hou = eval(date(9:10));
        min = eval(date(11:12));
        sec = eval(date(13:14));
        time(j) = day + hou/24 + min/24/60 + sec/24/60/60;

    
       % -999 data set to NaN
       for k = 2:12
           if wea(j,k)  == -999.;  wea(j,k)  = NaN; wea_par(j,k) = 2; end
       end

       tim_f(j+day_month(mo)*48)    = time(j) + day_month(mo);
       wea_f(j+day_month(mo)*48,1)  = wea(j,2);   % visibility in units km
       wea_f(j+day_month(mo)*48,2)  = wea(j,3);   % Visibilitymin - minimum visibility in units km
       wea_f(j+day_month(mo)*48,3)  = wea(j,4);   % Visibilitymax - maximum visibility in units km
       wea_f(j+day_month(mo)*48,4)  = wea(j,5);   % Precipint - precipitation intensity in units mm/h
       wea_f(j+day_month(mo)*48,5)  = wea(j,6);   % Precipintmin - minimum precipitation intensity in units mm/h
       wea_f(j+day_month(mo)*48,6)  = wea(j,7);   % Precipintmax - maximum precipitation intensity in units mm/h
       wea_f(j+day_month(mo)*48,7)  = wea(j,8);   % Precipacc - Precipitation in unit mm
       wea_f(j+day_month(mo)*48,8)  = wea(j,9);   % Snowfallacc - snowfall in unit mm
       wea_f(j+day_month(mo)*48,9)  = wea(j,10);  % Wthcode - WMO synop code for most frequent weather type (see code table below)
       wea_f(j+day_month(mo)*48,10) = wea(j,11);  % Wthcodemin - WMO synop code for "best" weather type (see code table below)
       wea_f(j+day_month(mo)*48,11) = wea(j,12);  % Wthcodemax - WMO synop code for "worst" weather type (see code table below)
       %wea_f(j+day_month(mo)*48,12) = wea(j,13);  % Rainfallacc - rainfall in unit mm
       %wea_f(j+day_month(mo)*48,13) = wea(j,14);  % SWS - rain indicator signal in units mV
    end
    clear wea time
end


% Interpolation for max of 5 hours by inter_sosa
for k = 1:11
    wea_int(:,k) = wea_f(:,k);
    wea_int(:,k) = inter_sosa(wea_f(:,k), length(wea_f)-10);
end


for k = 1:11
    for j = 1:length(wea_int)
        if isnan(wea_int(j,k)) == 0
           wea_int_F(j,k) = wea_int(j,k);
           wea_par(j,k) = 1;            
        elseif isnan(wea_int(j,k)) == 1 
           wea_int_F(j,k) = (wea_int_F(j-48,k) + wea_int_F(j-48*2,k) + wea_int_F(j-48*3,k))/3;
           wea_par(j,k) = 3;
        end
    end
    for j = length(wea_int):-1:1
        if isnan(wea_int(j,k)) == 0
           wea_int_B(j,k) = wea_int(j,k);
           wea_par(j,k) = 1;
       elseif isnan(wea_int(j,k)) == 1 && j < length(wea_int)
           wea_int_B(j,k) = (wea_int_B(j+48,k) + wea_int_B(j+48*2,k) + wea_int_B(j+48*3,k))/3;
           wea_par(j,k) = 3;
        end
    end
    for j = 1:length(wea_int)
        if isnan(wea_int_F(j,k)) == 0 && isnan(wea_int_B(j,k)) == 0 
           wea_int_new(j,k) = (wea_int_F(j,k) + wea_int_B(j,k)) / 2; 
        elseif isnan(wea_int_F(j,k)) == 1 && isnan(wea_int_B(j,k)) == 0 
           wea_int_new(j,k) = wea_int_B(j,k); 
        elseif isnan(wea_int_F(j,k)) == 0 && isnan(wea_int_B(j,k)) == 1 
           wea_int_new(j,k) = wea_int_F(j,k); 
        end
    end
    for j = 1:365    
        wea_ave(j,k) = sum(wea_int_new(j*24-24+1:j*24-12,k));
    end
end



figure(1)
clf
subplot(311)
hold on
plot(tim_f, wea_int_new(:,1), 'r-');
plot(tim_f, wea_int_new(:,2), 'c-');
plot(tim_f, wea_int_new(:,3), 'b-');
legend('visibility', 'min', 'max')
title(['Year:  ', num2str(year)])

subplot(312)
hold on
plot(tim_f, wea_int_new(:,4), 'r-');
plot(tim_f, wea_int_new(:,5), 'c-');
plot(tim_f, wea_int_new(:,6), 'b-');
legend('precipitation', 'min', 'max')

subplot(313)
hold on
plot(tim_f, wea_int_new(:,7), 'r-');
plot(tim_f, wea_int_new(:,8), 'b-');
legend('precipacc', 'snowfallacc')



% Output in the right order if Savepar = 1
Savepar = 2;
if Savepar == 1
   if     year == 2011, fid = fopen('c://HY-data//BOY//documents//sosa_in//year//2011//data_measured//wea_data.txt','w'); end
   for j = 1:length(tim_f)
       fprintf (fid, '%8.3f',   tim_f(j));          % time
       fprintf (fid, '%15.5f',  wea_int_new(j,1));  % global radiation
       fprintf (fid, '%15.5f',  wea_int_new(j,2));  % reflected global radiation
       fprintf (fid, '%15.5f',  wea_int_new(j,8));  % albedo
       fprintf (fid, '%15.5f',  wea_int_new(j,3));  % uvb
       fprintf (fid, '%15.5f',  wea_int_new(j,4));  % uva
       fprintf (fid, '%15.5f',  wea_int_new(j,5));  % par
       fprintf (fid, '%15.5f',  wea_int_new(j,6));  % diff global radiaton
       fprintf (fid, '%15.5f',  wea_int_new(j,7));  % dir global radiation
       fprintf (fid, '%15.5f',  wea_int_new(j,9));  % net radiation
       fprintf (fid, '\n');  
    end    

   if     year == 2011, fid1 = fopen('c://HY-data//BOY//documents//sosa_in//year//2011//data_measured//wea_int_par.txt','w'); end
   for j = 1:length(tim_f)
       fprintf (fid1, '%10.3f',  tim_f(j));     % date
       for k = 1:9
           fprintf (fid1, '%3.0f',  wea_par(j,k)); 
       end
       fprintf (fid1, '\n');  
   end
end


% Washout effect for the year 2010 in Luxis paper
if year == 2010
   luxi = load('c:\HY-data\BOY\documents\Papers\55 - Luxi Hyytiälä\\SOSAA_2010_kinetic_classification.txt'); 
   for j = 1:365
       luxi_time(j) = luxi(j,1);
       luxi_data(j,1) = luxi(j,2); % event day both in measurements and model
       luxi_data(j,2) = luxi(j,3); % non-event day both in measurements and model
       luxi_data(j,3) = luxi(j,4); % modelled event starting from the smallest particle sizes, in measurements only the tail of event or bumps in nucleation mode
       luxi_data(j,4) = luxi(j,5); % event in measurements, non-event in model
       luxi_data(j,5) = luxi(j,6); % non-event in measurements, strong event in model
       luxi_data(j,6) = luxi(j,7); % non-event in measurements, weak event in model
       for k = 1:6
           if luxi_data(j,k) == 0, luxi_data(j,k) = NaN; end
       end
   end
   
   figure(2)
   clf
   hold on
   plot(wea_ave(:,5),luxi_data(:,1), 'mo'); 
   plot(wea_ave(:,5),luxi_data(:,2)+1, 'ro'); 
   plot(wea_ave(:,5),luxi_data(:,3)+2, 'go'); 
   plot(wea_ave(:,5),luxi_data(:,4)+3, 'co'); 
   plot(wea_ave(:,5),luxi_data(:,5)+4, 'bo'); 
   plot(wea_ave(:,5),luxi_data(:,6)+5, 'ko'); 
   %plot(luxi_time, wea_ave(:,7), 'ro'); 
end    
clear wea time

