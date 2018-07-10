clear all

% Program reads the data from the sme files and writes the data in an
% output file used in carboeuroflux (Michael Boy June 2004)

% Open sme files for every month

YEAR = input('Year:  ', 's');
year = eval(YEAR);

day_month_03 = [0 31 59 90 120 151 181 212 243 273 304 334];
day_month_04 = [0 31 60 91 121 152 182 213 244 274 305 335];
if year == 2004 || year == 2008, day_month = day_month_04; else day_month = day_month_03; end


if year == 2010, num_month = 12; else num_month = 12; end


% Open mme files for every month
for mo = 1:num_month
    mo
    if year == 2003
       if mo == 1,      sun = load('/Users/boy/Documents/Michael/Hyyt/Sun_data/smear0301.sme');
       elseif mo == 2,  sun = load('/Users/boy/Documents/Michael/Hyyt/Sun_data/smear0302.sme');
       elseif mo == 3,  sun = load('/Users/boy/Documents/Michael/Hyyt/Sun_data/smear0303.sme');
       elseif mo == 4,  sun = load('/Users/boy/Documents/Michael/Hyyt/Sun_data/smear0304.sme');
       elseif mo == 5,  sun = load('/Users/boy/Documents/Michael/Hyyt/Sun_data/smear0305.sme');
       elseif mo == 6,  sun = load('/Users/boy/Documents/Michael/Hyyt/Sun_data/smear0306.sme'); 
       elseif mo == 7,  sun = load('/Users/boy/Documents/Michael/Hyyt/Sun_data/smear0307.sme'); 
       elseif mo == 8,  sun = load('/Users/boy/Documents/Michael/Hyyt/Sun_data/smear0308.sme'); 
       elseif mo == 9,  sun = load('/Users/boy/Documents/Michael/Hyyt/Sun_data/smear0309.sme'); 
       elseif mo == 10, sun = load('/Users/boy/Documents/Michael/Hyyt/Sun_data/smear0310.sme'); 
       elseif mo == 11, sun = load('/Users/boy/Documents/Michael/Hyyt/Sun_data/smear0311.sme'); 
       elseif mo == 12, sun = load('/Users/boy/Documents/Michael/Hyyt/Sun_data/smear0312.sme'); end
    elseif year == 2004
       if mo == 1,      sun = load('/Users/boy/Documents/Michael/Hyyt/Sun_data/smear0401.sme');
       elseif mo == 2,  sun = load('/Users/boy/Documents/Michael/Hyyt/Sun_data/smear0402.sme');
       elseif mo == 3,  sun = load('/Users/boy/Documents/Michael/Hyyt/Sun_data/smear0403.sme');
       elseif mo == 4,  sun = load('/Users/boy/Documents/Michael/Hyyt/Sun_data/smear0404.sme');
       elseif mo == 5,  sun = load('/Users/boy/Documents/Michael/Hyyt/Sun_data/smear0405.sme');
       elseif mo == 6,  sun = load('/Users/boy/Documents/Michael/Hyyt/Sun_data/smear0406.sme'); 
       elseif mo == 7,  sun = load('/Users/boy/Documents/Michael/Hyyt/Sun_data/smear0407.sme'); 
       elseif mo == 8,  sun = load('/Users/boy/Documents/Michael/Hyyt/Sun_data/smear0408.sme'); 
       elseif mo == 9,  sun = load('/Users/boy/Documents/Michael/Hyyt/Sun_data/smear0409.sme'); 
       elseif mo == 10, sun = load('/Users/boy/Documents/Michael/Hyyt/Sun_data/smear0410.sme'); 
       elseif mo == 11, sun = load('/Users/boy/Documents/Michael/Hyyt/Sun_data/smear0411.sme'); 
       elseif mo == 12, sun = load('/Users/boy/Documents/Michael/Hyyt/Sun_data/smear0412.sme'); end
    elseif year == 2005
       if mo == 1,      sun = load('/Users/boy/Documents/Michael/Hyyt/Sun_data/smear0501.sme');
       elseif mo == 2,  sun = load('/Users/boy/Documents/Michael/Hyyt/Sun_data/smear0502.sme');
       elseif mo == 3,  sun = load('/Users/boy/Documents/Michael/Hyyt/Sun_data/smear0503.sme');
       elseif mo == 4,  sun = load('/Users/boy/Documents/Michael/Hyyt/Sun_data/smear0504.sme');
       elseif mo == 5,  sun = load('/Users/boy/Documents/Michael/Hyyt/Sun_data/smear0505.sme');
       elseif mo == 6,  sun = load('/Users/boy/Documents/Michael/Hyyt/Sun_data/smear0506.sme'); 
       elseif mo == 7,  sun = load('/Users/boy/Documents/Michael/Hyyt/Sun_data/smear0507.sme'); 
       elseif mo == 8,  sun = load('/Users/boy/Documents/Michael/Hyyt/Sun_data/smear0508.sme'); 
       elseif mo == 9,  sun = load('/Users/boy/Documents/Michael/Hyyt/Sun_data/smear0509.sme'); 
       elseif mo == 10, sun = load('/Users/boy/Documents/Michael/Hyyt/Sun_data/smear0510.sme'); 
       elseif mo == 11, sun = load('/Users/boy/Documents/Michael/Hyyt/Sun_data/smear0511.sme'); 
       elseif mo == 12, sun = load('/Users/boy/Documents/Michael/Hyyt/Sun_data/smear0512.sme'); end
    elseif year == 2006
       if mo == 1,      sun = load('/Users/boy/Documents/Michael/Hyyt/Sun_data/smear0601.sme');
       elseif mo == 2,  sun = load('/Users/boy/Documents/Michael/Hyyt/Sun_data/smear0602.sme');
       elseif mo == 3,  sun = load('/Users/boy/Documents/Michael/Hyyt/Sun_data/smear0603.sme');
       elseif mo == 4,  sun = load('/Users/boy/Documents/Michael/Hyyt/Sun_data/smear0604.sme');
       elseif mo == 5,  sun = load('/Users/boy/Documents/Michael/Hyyt/Sun_data/smear0605.sme');
       elseif mo == 6,  sun = load('/Users/boy/Documents/Michael/Hyyt/Sun_data/smear0606.sme'); 
       elseif mo == 7,  sun = load('/Users/boy/Documents/Michael/Hyyt/Sun_data/smear0607.sme'); 
       elseif mo == 8,  sun = load('/Users/boy/Documents/Michael/Hyyt/Sun_data/smear0608.sme'); 
       elseif mo == 9,  sun = load('/Users/boy/Documents/Michael/Hyyt/Sun_data/smear0609.sme'); 
       elseif mo == 10, sun = load('/Users/boy/Documents/Michael/Hyyt/Sun_data/smear0610.sme'); 
       elseif mo == 11, sun = load('/Users/boy/Documents/Michael/Hyyt/Sun_data/smear0611.sme'); 
       elseif mo == 12, sun = load('/Users/boy/Documents/Michael/Hyyt/Sun_data/smear0612.sme'); end
    elseif year == 2007
       if mo == 1,      sun = load('/Users/boy/Documents/Michael/Hyyt/Sun_data/smear0701.sme');
       elseif mo == 2,  sun = load('/Users/boy/Documents/Michael/Hyyt/Sun_data/smear0702.sme');
       elseif mo == 3,  sun = load('/Users/boy/Documents/Michael/Hyyt/Sun_data/smear0703.sme');
       elseif mo == 4,  sun = load('/Users/boy/Documents/Michael/Hyyt/Sun_data/smear0704.sme');
       elseif mo == 5,  sun = load('/Users/boy/Documents/Michael/Hyyt/Sun_data/smear0705.sme');
       elseif mo == 6,  sun = load('/Users/boy/Documents/Michael/Hyyt/Sun_data/smear0706.sme');
       elseif mo == 7,  sun = load('/Users/boy/Documents/Michael/Hyyt/Sun_data/smear0707.sme'); 
       elseif mo == 8,  sun = load('/Users/boy/Documents/Michael/Hyyt/Sun_data/smear0708.sme'); 
       elseif mo == 9,  sun = load('/Users/boy/Documents/Michael/Hyyt/Sun_data/smear0709.sme'); 
       elseif mo == 10, sun = load('/Users/boy/Documents/Michael/Hyyt/Sun_data/smear0710.sme'); 
       elseif mo == 11, sun = load('/Users/boy/Documents/Michael/Hyyt/Sun_data/smear0711.sme'); 
       elseif mo == 12, sun = load('/Users/boy/Documents/Michael/Hyyt/Sun_data/smear0712.sme');end
    elseif year == 2008
       if mo == 1,      sun = load('/Users/boy/Documents/Michael/Hyyt/Sun_data/smear0801.sme');
       elseif mo == 2,  sun = load('/Users/boy/Documents/Michael/Hyyt/Sun_data/smear0802.sme');
       elseif mo == 3,  sun = load('/Users/boy/Documents/Michael/Hyyt/Sun_data/smear0803.sme');
       elseif mo == 4,  sun = load('/Users/boy/Documents/Michael/Hyyt/Sun_data/smear0804.sme');
       elseif mo == 5,  sun = load('/Users/boy/Documents/Michael/Hyyt/Sun_data/smear0805.sme');
       elseif mo == 6,  sun = load('/Users/boy/Documents/Michael/Hyyt/Sun_data/smear0806.sme');
       elseif mo == 7,  sun = load('/Users/boy/Documents/Michael/Hyyt/Sun_data/smear0807.sme');
       elseif mo == 8,  sun = load('/Users/boy/Documents/Michael/Hyyt/Sun_data/smear0808.sme');
       elseif mo == 9,  sun = load('/Users/boy/Documents/Michael/Hyyt/Sun_data/smear0809.sme');
       elseif mo == 10, sun = load('/Users/boy/Documents/Michael/Hyyt/Sun_data/smear0810.sme');
       elseif mo == 11, sun = load('/Users/boy/Documents/Michael/Hyyt/Sun_data/smear0811.sme');
       elseif mo == 12, sun = load('/Users/boy/Documents/Michael/Hyyt/Sun_data/smear0812.sme'); end
    elseif year == 2009
       if mo == 1,      sun = load('/Users/boy/Documents/Michael/Hyyt/Sun_data/smear0901.sme');
       elseif mo == 2,  sun = load('/Users/boy/Documents/Michael/Hyyt/Sun_data/smear0902.sme');
       elseif mo == 3,  sun = load('/Users/boy/Documents/Michael/Hyyt/Sun_data/smear0903.sme');
       elseif mo == 4,  sun = load('/Users/boy/Documents/Michael/Hyyt/Sun_data/smear0904.sme');
       elseif mo == 5,  sun = load('/Users/boy/Documents/Michael/Hyyt/Sun_data/smear0905.sme');
       elseif mo == 6,  sun = load('/Users/boy/Documents/Michael/Hyyt/Sun_data/smear0906.sme');
       elseif mo == 7,  sun = load('/Users/boy/Documents/Michael/Hyyt/Sun_data/smear0907.sme');
       elseif mo == 8,  sun = load('/Users/boy/Documents/Michael/Hyyt/Sun_data/smear0908.sme');
       elseif mo == 9,  sun = load('/Users/boy/Documents/Michael/Hyyt/Sun_data/smear0909.sme');
       elseif mo == 10, sun = load('/Users/boy/Documents/Michael/Hyyt/Sun_data/smear0910.sme');
       elseif mo == 11, sun = load('/Users/boy/Documents/Michael/Hyyt/Sun_data/smear0911.sme');
       elseif mo == 12, sun = load('/Users/boy/Documents/Michael/Hyyt/Sun_data/smear0912.sme'); end
    elseif year == 2010
       if mo == 1,      sun = load('/Users/boy/Documents/Michael/Hyyt/Sun_data/smear1001.sme');
       elseif mo == 2,  sun = load('/Users/boy/Documents/Michael/Hyyt/Sun_data/smear1002.sme');
       elseif mo == 3,  sun = load('/Users/boy/Documents/Michael/Hyyt/Sun_data/smear1003.sme');
       elseif mo == 4,  sun = load('/Users/boy/Documents/Michael/Hyyt/Sun_data/smear1004.sme');
       elseif mo == 5,  sun = load('/Users/boy/Documents/Michael/Hyyt/Sun_data/smear1005.sme');
       elseif mo == 6,  sun = load('/Users/boy/Documents/Michael/Hyyt/Sun_data/smear1006.sme');
       elseif mo == 7,  sun = load('/Users/boy/Documents/Michael/Hyyt/Sun_data/smear1007.sme');
       elseif mo == 8,  sun = load('/Users/boy/Documents/Michael/Hyyt/Sun_data/smear1008.sme');
       elseif mo == 9,  sun = load('/Users/boy/Documents/Michael/Hyyt/Sun_data/smear1009.sme');
       elseif mo == 10, sun = load('/Users/boy/Documents/Michael/Hyyt/Sun_data/smear1010.sme');
       elseif mo == 11, sun = load('/Users/boy/Documents/Michael/Hyyt/Sun_data/smear1011.sme');
       elseif mo == 12, sun = load('/Users/boy/Documents/Michael/Hyyt/Sun_data/smear1012.sme'); end
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


    
       % Negative data set to 0.00
       for k = 2:15
           if sun(j,k)  == -999.;  sun(j,k)  = NaN; sun_par(j,k) = 2; end
       end
       for k = 2:6
           if sun(j,k) < 0., sun(j,k) = 0.; end
       end
       for k = 8:11
           if sun(j,k) < 0., sun(j,k) = 0.; end
       end

       if sun(j,9) == 0
          alb(j) = 0;
       else
          alb(j) = sun(j,8) / sun(j,9);
       end
       if alb(j) > 0.5, alb(j) = 0.5; end

       tim_f(j+day_month(mo)*48)    = time(j) + day_month(mo);
       sun_f(j+day_month(mo)*48,1)  = sun(j,9);
       sun_f(j+day_month(mo)*48,2)  = sun(j,8);
       sun_f(j+day_month(mo)*48,3)  = sun(j,3);
       sun_f(j+day_month(mo)*48,4)  = sun(j,2);
       sun_f(j+day_month(mo)*48,5)  = sun(j,11);
       sun_f(j+day_month(mo)*48,6)  = sun(j,5);
       sun_f(j+day_month(mo)*48,7)  = sun(j,6);
       sun_f(j+day_month(mo)*48,8)  = alb(j);
       sun_f(j+day_month(mo)*48,9)  = sun(j,7);
       sun_f(j+day_month(mo)*48,10) = sun(j,14);
       sun_f(j+day_month(mo)*48,11) = sun(j,13);
    end
    clear sun alb time
end

       
% Interpolation for max of 5 hours by inter_sosa
for k = 1:11
    sun_int(:,k) = inter_sosa(sun_f(:,k), length(sun_f)-10);
end


for j = 1:length(sun_int)
    if sun_int(j,1) > 0
       sun_int(j,12) = sun_int(j,1) / sun_int(j,10);
    else
       sun_int(j,12) = 0;
    end
end


for k = 1:1
    for j = 1:length(sun_int)
        if isnan(sun_int(j,k)) == 0
           sun_int_F(j,k) = sun_int(j,k);
           sun_par(j,k) = 1;            
        elseif j < 165 
           sun_int_F(j,k) = sun_int(j,k);
           sun_par(j,k) = 3;
        elseif isnan(sun_int(j,k)) == 1 
           sun_int_F(j,k) = (sun_int_F(j-48,k) + sun_int_F(j-48*2,k) + sun_int_F(j-48*3,k))/3;
           sun_par(j,k) = 3;
        end
    end
    for j = length(sun_int):-1:1
        if isnan(sun_int(j,k)) == 0
           sun_int_B(j,k) = sun_int(j,k);
           sun_par(j,k) = 1;
        elseif (year == 2004 && j > 17403) 
           sun_int_B(j,k) = sun_int(j,k);
           sun_par(j,k) = 3;
        elseif (year == 2008 && j > 8592) 
           sun_int_B(j,k) = sun_int(j,k);
           sun_par(j,k) = 3;
        elseif j > 17355 
           sun_int_B(j,k) = sun_int(j,k);
           sun_par(j,k) = 3;
       elseif isnan(sun_int(j,k)) == 1 && j < length(sun_int)
           sun_int_B(j,k) = (sun_int_B(j+48,k) + sun_int_B(j+48*2,k) + sun_int_B(j+48*3,k))/3;
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


break


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



% Output in the right order if Savepar = 1
Savepar = 1;
if Savepar == 1
   if     year == 2003, fid = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2003/data_measured/sun_data.txt','w');
   elseif year == 2004, fid = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2004/data_measured/sun_data.txt','w');
   elseif year == 2005, fid = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2005/data_measured/sun_data.txt','w');
   elseif year == 2006, fid = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2006/data_measured/sun_data.txt','w');
   elseif year == 2007, fid = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2007/data_measured/sun_data.txt','w');
   elseif year == 2008, fid = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2008/data_measured/sun_data.txt','w');
   elseif year == 2009, fid = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2009/data_measured/sun_data.txt','w');
   elseif year == 2010, fid = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2010/data_measured/sun_data.txt','w'); end
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

   if     year == 2003, fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2003/data_measured/sun_int_par.txt','w');
   elseif year == 2004, fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2004/data_measured/sun_int_par.txt','w');
   elseif year == 2005, fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2005/data_measured/sun_int_par.txt','w');
   elseif year == 2006, fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2006/data_measured/sun_int_par.txt','w');
   elseif year == 2007, fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2007/data_measured/sun_int_par.txt','w'); 
   elseif year == 2008, fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2008/data_measured/sun_int_par.txt','w'); 
   elseif year == 2009, fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2009/data_measured/sun_int_par.txt','w'); 
   elseif year == 2010, fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2010/data_measured/sun_int_par.txt','w'); end
   for j = 1:length(tim_f)
       fprintf (fid1, '%10.3f',  tim_f(j));     % date
       for k = 1:9
           fprintf (fid1, '%3.0f',  sun_par(j,k)); 
       end
       fprintf (fid1, '\n');  
   end
end

clear sun time
    