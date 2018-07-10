clear all

% Program reads the data from the sme files and writes the data in an
% output file used in carboeuroflux (Michael Boy June 2004)

% Open sme files for every month

YEAR = input('Year:  ', 's');
year = eval(YEAR);

day_month_03 = [0 31 59 90 120 151 181 212 243 273 304 334];
day_month_04 = [0 31 60 91 121 152 182 213 244 274 305 335];
if year == 2004 || year == 2008 || year == 2012, day_month = day_month_04; else day_month = day_month_03; end


if year == 2013, num_month = 12; else num_month = 12; end


% Open mme files for every month
for mo = 1:num_month
    mo
    if year == 2011
       if mo == 1,      sun = load('/Users/boy/Documents/Michael/Hyyt/Atmos/smear1101.rad');
       elseif mo == 2,  sun = load('/Users/boy/Documents/Michael/Hyyt/Atmos/smear1102.rad');
       elseif mo == 3,  sun = load('/Users/boy/Documents/Michael/Hyyt/Atmos/smear1103.rad');
       elseif mo == 4,  sun = load('/Users/boy/Documents/Michael/Hyyt/Atmos/smear1104.rad');
       elseif mo == 5,  sun = load('/Users/boy/Documents/Michael/Hyyt/Atmos/smear1105.rad');
       elseif mo == 6,  sun = load('/Users/boy/Documents/Michael/Hyyt/Atmos/smear1106.rad'); 
       elseif mo == 7,  sun = load('/Users/boy/Documents/Michael/Hyyt/Atmos/smear1107.rad'); 
       elseif mo == 8,  sun = load('/Users/boy/Documents/Michael/Hyyt/Atmos/smear1108.rad'); 
       elseif mo == 9,  sun = load('/Users/boy/Documents/Michael/Hyyt/Atmos/smear1109.rad'); 
       elseif mo == 10, sun = load('/Users/boy/Documents/Michael/Hyyt/Atmos/smear1110.rad'); 
       elseif mo == 11, sun = load('/Users/boy/Documents/Michael/Hyyt/Atmos/smear1111.rad'); 
       elseif mo == 12, sun = load('/Users/boy/Documents/Michael/Hyyt/Atmos/smear1112.rad'); end
    end
    if year == 2012
       if mo == 1,      sun = load('/Users/boy/Documents/Michael/Hyyt/Atmos/smear1201.rad');
       elseif mo == 2,  sun = load('/Users/boy/Documents/Michael/Hyyt/Atmos/smear1202.rad');
       elseif mo == 3,  sun = load('/Users/boy/Documents/Michael/Hyyt/Atmos/smear1203.rad');
       elseif mo == 4,  sun = load('/Users/boy/Documents/Michael/Hyyt/Atmos/smear1204.rad');
       elseif mo == 5,  sun = load('/Users/boy/Documents/Michael/Hyyt/Atmos/smear1205.rad');
       elseif mo == 6,  sun = load('/Users/boy/Documents/Michael/Hyyt/Atmos/smear1206.rad'); 
       elseif mo == 7,  sun = load('/Users/boy/Documents/Michael/Hyyt/Atmos/smear1207.rad'); 
       elseif mo == 8,  sun = load('/Users/boy/Documents/Michael/Hyyt/Atmos/smear1208.rad'); 
       elseif mo == 9,  sun = load('/Users/boy/Documents/Michael/Hyyt/Atmos/smear1209.rad'); 
       elseif mo == 10, sun = load('/Users/boy/Documents/Michael/Hyyt/Atmos/smear1210.rad'); 
       elseif mo == 11, sun = load('/Users/boy/Documents/Michael/Hyyt/Atmos/smear1211.rad'); 
       elseif mo == 12, sun = load('/Users/boy/Documents/Michael/Hyyt/Atmos/smear1212.rad'); end
    end
    if year == 2013
       if mo == 1,      sun = load('/Users/boy/Documents/Michael/Hyyt/Atmos/smear1301.rad');
       elseif mo == 2,  sun = load('/Users/boy/Documents/Michael/Hyyt/Atmos/smear1302.rad');
       elseif mo == 3,  sun = load('/Users/boy/Documents/Michael/Hyyt/Atmos/smear1303.rad');
       elseif mo == 4,  sun = load('/Users/boy/Documents/Michael/Hyyt/Atmos/smear1304.rad');
       elseif mo == 5,  sun = load('/Users/boy/Documents/Michael/Hyyt/Atmos/smear1305.rad');
       elseif mo == 6,  sun = load('/Users/boy/Documents/Michael/Hyyt/Atmos/smear1306.rad'); 
       elseif mo == 7,  sun = load('/Users/boy/Documents/Michael/Hyyt/Atmos/smear1307.rad'); 
       elseif mo == 8,  sun = load('/Users/boy/Documents/Michael/Hyyt/Atmos/smear1308.rad'); 
       elseif mo == 9,  sun = load('/Users/boy/Documents/Michael/Hyyt/Atmos/smear1309.rad'); 
       elseif mo == 10, sun = load('/Users/boy/Documents/Michael/Hyyt/Atmos/smear1310.rad'); 
       elseif mo == 11, sun = load('/Users/boy/Documents/Michael/Hyyt/Atmos/smear1311.rad'); 
       elseif mo == 12, sun = load('/Users/boy/Documents/Michael/Hyyt/Atmos/smear1312.rad'); end
    end
    if year == 2014
       if mo == 1,      sun = load('/Users/boy/Documents/Michael/Hyyt/Atmos/smear1401.rad');
       elseif mo == 2,  sun = load('/Users/boy/Documents/Michael/Hyyt/Atmos/smear1402.rad');
       elseif mo == 3,  sun = load('/Users/boy/Documents/Michael/Hyyt/Atmos/smear1403.rad');
       elseif mo == 4,  sun = load('/Users/boy/Documents/Michael/Hyyt/Atmos/smear1404.rad');
       elseif mo == 5,  sun = load('/Users/boy/Documents/Michael/Hyyt/Atmos/smear1405.rad');
       elseif mo == 6,  sun = load('/Users/boy/Documents/Michael/Hyyt/Atmos/smear1406.rad'); 
       elseif mo == 7,  sun = load('/Users/boy/Documents/Michael/Hyyt/Atmos/smear1407.rad'); 
       elseif mo == 8,  sun = load('/Users/boy/Documents/Michael/Hyyt/Atmos/smear1408.rad'); 
       elseif mo == 9,  sun = load('/Users/boy/Documents/Michael/Hyyt/Atmos/smear1409.rad'); 
       elseif mo == 10, sun = load('/Users/boy/Documents/Michael/Hyyt/Atmos/smear1410.rad'); 
       elseif mo == 11, sun = load('/Users/boy/Documents/Michael/Hyyt/Atmos/smear1411.rad'); 
       elseif mo == 12, sun = load('/Users/boy/Documents/Michael/Hyyt/Atmos/smear1412.rad'); end
    end
    row  = length(sun);

    for j = 1:row
        date = num2str(sun(j,1));
        mon = eval(date(5:6));
        day = eval(date(7:8));
        hou = eval(date(9:10));
        min = eval(date(11:12));
        sec = eval(date(13:14));
        time(j) = day + hou/24 + min/24/60 + sec/24/60/60;

    
       % Negative data set to 0.00 beside net
       for k = 2:24
           if sun(j,k)  == -999.;  sun(j,k)  = NaN; sun_par(j,k) = 2; end
       end
       for k = 2:6
           if sun(j,k) < 0., sun(j,k) = 0.; end
       end
       for k = 8:12
           if sun(j,k) < 0., sun(j,k) = 0.; end
       end

       if sun(j,9) == 0
          alb(j) = 0;
       else
          alb(j) = sun(j,8) / sun(j,9);
       end
       if alb(j) > 0.5, alb(j) = 0.5; end

       tim_f(j+day_month(mo)*48)    = time(j) + day_month(mo);
       sun_f(j+day_month(mo)*48,1)  = sun(j,9);  % Global
       sun_f(j+day_month(mo)*48,2)  = sun(j,8);  % Ref. global
       sun_f(j+day_month(mo)*48,3)  = sun(j,3);  % UV-B
       sun_f(j+day_month(mo)*48,4)  = sun(j,2);  % UV-A
       sun_f(j+day_month(mo)*48,5)  = sun(j,11); % PAR
       sun_f(j+day_month(mo)*48,6)  = sun(j,5);  % Diff. global
       sun_f(j+day_month(mo)*48,7)  = sun(j,6);  % Dir. global
       sun_f(j+day_month(mo)*48,8)  = alb(j);    % Albedo
       sun_f(j+day_month(mo)*48,9)  = sun(j,7);  % Net
       sun_f(j+day_month(mo)*48,10) = sun(j,15); % LW_in
       sun_f(j+day_month(mo)*48,11) = sun(j,16); % LW_out
       sun_f(j+day_month(mo)*48,12) = sun(j,13); % LW_can
    end
    clear sun alb time
end


% 2011
if year == 2011
   % diffGlob and dirGlob radiation not available for the whole year
   sun_f(:,6) = 0.; sun_par(:,6) = 5;
   sun_f(:,7) = 0.; sun_par(:,7) = 5;
   % albedo, net and ref. global are not available after day 262
   for j = 12603:length(sun_f)
       sun_f(j,2) = 0.;  sun_par(j,2) = 5;
       sun_f(j,8) = 0.;  sun_par(j,8) = 5;
       sun_f(j,9) = 0.;  sun_par(j,9) = 5;
   end
end

% 2012
if year == 2012
   % net, reflected, direct and diffuse radiation and also albedo are not available for the whole year
   sun_f(:,2) = 0.; sun_par(:,2) = 5;
   sun_f(:,6) = 0.; sun_par(:,6) = 5;
   sun_f(:,7) = 0.; sun_par(:,7) = 5;
   sun_f(:,8) = 0.; sun_par(:,8) = 5;
   sun_f(:,9) = 0.; sun_par(:,9) = 5;
end

% 2013
if year == 2013 | year == 2014
   % net, reflected, direct and diffuse radiation and also albedo are not available for the whole year
   sun_f(:,2) = 0.; sun_par(:,2) = 5;
   sun_f(:,6) = 0.; sun_par(:,6) = 5;
   sun_f(:,7) = 0.; sun_par(:,7) = 5;
   sun_f(:,8) = 0.; sun_par(:,8) = 5;
   sun_f(:,9) = 0.; sun_par(:,9) = 5;
   sun_f(:,12) = 0.; sun_par(:,12) = 5;
end



% Interpolation for max of 5 hours by inter_sosa
for k = 1:12
    sun_int(:,k) = sun_f(:,k);
    sun_int(:,k) = inter_sosa(sun_f(:,k), length(sun_f)-10);
end

for j = 1:length(sun_int)
    if sun_int(j,1) > 0
       sun_int(j,13) = sun_int(j,1) / sun_int(j,10);
    else
       sun_int(j,13) = 0;
    end
end

for k = 1:12
    if year == 2013 && (k == 10 || k == 11)
        for j = 1:length(sun_int)
            sun_int_F(j,k) = 0.;
            sun_par(j,k) = 3;
        end
    else    
        for j = 1:length(sun_int)
           if isnan(sun_int(j,k)) == 0
              sun_int_F(j,k) = sun_int(j,k);
              sun_par(j,k) = 1;            
           elseif isnan(sun_int(j,k)) == 1 
              sun_int_F(j,k) = (sun_int_F(j-48,k) + sun_int_F(j-48*2,k) + sun_int_F(j-48*3,k))/3;
              sun_par(j,k) = 3;
           end
       end
    end
    for j = length(sun_int):-1:1
        if isnan(sun_int(j,k)) == 0
           sun_int_B(j,k) = sun_int(j,k);
           sun_par(j,k) = 1;
        elseif isnan(sun_int(j,k)) == 1 && j < length(sun_int)-144
           sun_int_B(j,k) = (sun_int_B(j+48,k) + sun_int_B(j+48*2,k) + sun_int_B(j+48*3,k))/3;
           sun_par(j,k) = 3;
        else
           sun_int_B(j,k) = NaN;
           sun_par(j,k) = 3;
        end
    end
    for j = 1:length(sun_int)
        if isnan(sun_int_F(j,k)) == 0 && isnan(sun_int_B(j,k)) == 0 
           sun_int_new(j,k) = (sun_int_F(j,k) + sun_int_B(j,k)) / 2; 
        elseif isnan(sun_int_F(j,k)) == 1 && isnan(sun_int_B(j,k)) == 0 
           sun_int_new(j,k) = sun_int_B(j,k); 
        elseif isnan(sun_int_F(j,k)) == 0 && isnan(sun_int_B(j,k)) == 1 
           sun_int_new(j,k) = sun_int_F(j,k); 
        end
    end
end


% 2011
if year == 2011
   % diffGlob and dirGlob radiation not available for the whole year
   sun_par(:,6) = 5;
   sun_par(:,7) = 5;
   % diff and dir are needed for input in SOSA and for this reason we use
   % 50 % of global radiation for both of them
   for j = 1:length(sun_int_new)
       sun_int_new(j,6) = sun_int_new(j,1) * 0.5;
       sun_int_new(j,7) = sun_int_new(j,1) * 0.5;
   end
   % albedo, net and ref. global are not available after day 262 but albedo
   % is needed for SOSA so it is set to 0.3 for this days
   for j = 12603:length(sun_f)
       sun_int_new(j,8) = 0.3;
       sun_par(j,2) = 5;
       sun_par(j,8) = 5;
       sun_par(j,9) = 5;
   end
end


% 2012
if year == 2012
   % diff and dir are needed for input in SOSA and for this reason we use
   % 50 % of global radiation for both of them
   for j = 1:length(sun_int_new)
       sun_int_new(j,6) = sun_int_new(j,1) * 0.5;
       sun_int_new(j,7) = sun_int_new(j,1) * 0.5;
   end
   % albedo is not available for the whole year so we put it to 0.3
   for j = 1:length(sun_int_new)
       sun_int_new(j,8) = 0.3;
       
       sun_par(:,2) = 5;
       sun_par(:,6) = 5;
       sun_par(:,7) = 5;
       sun_par(:,8) = 5;
       sun_par(:,9) = 5;

   end
end


% 2013
if year == 2013
   % diff and dir are needed for input in SOSA and for this reason we use
   % 50 % of global radiation for both of them
   for j = 1:length(sun_int_new)
       sun_int_new(j,6) = sun_int_new(j,1) * 0.5;
       sun_int_new(j,7) = sun_int_new(j,1) * 0.5;
   end
   % albedo is not available for the whole year so we put it to 0.3
   for j = 1:length(sun_int_new)
       sun_int_new(j,8) = 0.3;
       
       sun_par(:,2) = 5;
       sun_par(:,6) = 5;
       sun_par(:,7) = 5;
       sun_par(:,8) = 5;
       sun_par(:,9) = 5;

   end
end


figure(1)
clf
subplot(411)
hold on
plot(tim_f, sun_int_new(:,1), 'b-');
plot(tim_f, sun_int_new(:,2), 'r-');
legend('global rad', 'refl. global rad')
title(['Year:  ', num2str(year)])

subplot(412)
hold on
plot(tim_f, sun_int_new(:,6), 'r-');
plot(tim_f, sun_int_new(:,7), 'k-');
plot(tim_f, sun_int_new(:,9), 'b-');
legend('diff. global rad', 'dir global rad', 'net rad')

subplot(413)
hold on
plot(tim_f, sun_int_new(:,3), 'b-');
plot(tim_f, sun_int_new(:,4), 'r-');
plot(tim_f, sun_int_new(:,5)/10, 'k-');
legend('uvb', 'uva', 'par/10')

subplot(414)
hold on
plot(tim_f, sun_int_new(:,8), 'b-');
legend('albedo')


figure(2)
hold on
plot(tim_f, sun_int_new(:,10), 'r-');
plot(tim_f, sun_int_new(:,11), 'b-');




% Output in the right order if Savepar = 1
Savepar = 1;
if Savepar == 1
   if     year == 2011, fid = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2011/data_measured/sun_data.txt','w'); end
   if     year == 2012, fid = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2012/data_measured/sun_data.txt','w'); end
   if     year == 2013, fid = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2013/data_measured/sun_data.txt','w'); end
   if     year == 2014, fid = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2014/data_measured/sun_data.txt','w'); end
   for j = 1:length(tim_f)
       fprintf (fid, '%8.3f',   tim_f(j));          % time
       fprintf (fid, '%15.5f',  sun_int_new(j,1));  % global radiation
       fprintf (fid, '%15.5f',  sun_int_new(j,2));  % reflected global radiation
       fprintf (fid, '%15.5f',  sun_int_new(j,8));  % albedo
       fprintf (fid, '%15.5f',  sun_int_new(j,3));  % uvb
       fprintf (fid, '%15.5f',  sun_int_new(j,4));  % uva
       fprintf (fid, '%15.5f',  sun_int_new(j,5));  % par
       fprintf (fid, '%15.5f',  sun_int_new(j,6));  % diff global radiaton
       fprintf (fid, '%15.5f',  sun_int_new(j,7));  % dir global radiation
       fprintf (fid, '%15.5f',  sun_int_new(j,9));  % net radiation
       fprintf (fid, '\n');  
    end    

   if     year == 2011, fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2011/data_measured/sun_int_par.txt','w'); end
   if     year == 2012, fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2012/data_measured/sun_int_par.txt','w'); end
   if     year == 2013, fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2013/data_measured/sun_int_par.txt','w'); end
   if     year == 2014, fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2014/data_measured/sun_int_par.txt','w'); end
   for j = 1:length(tim_f)
       fprintf (fid1, '%10.3f',  tim_f(j));     % date
       fprintf (fid1, '%3.0f',   sun_par(j,1)); 
       fprintf (fid1, '%3.0f',   sun_par(j,2)); 
       fprintf (fid1, '%3.0f',   sun_par(j,8)); 
       fprintf (fid1, '%3.0f',   sun_par(j,3)); 
       fprintf (fid1, '%3.0f',   sun_par(j,4)); 
       fprintf (fid1, '%3.0f',   sun_par(j,5)); 
       fprintf (fid1, '%3.0f',   sun_par(j,6)); 
       fprintf (fid1, '%3.0f',   sun_par(j,7)); 
       fprintf (fid1, '%3.0f',   sun_par(j,9)); 
       fprintf (fid1, '\n');  
   end
end

clear sun time
    