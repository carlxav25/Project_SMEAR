% program reads the shortwavelength rad data and calculates 5 nm intervals
% between 280 and xxx nm

readin = 1;
if readin == 1
   clear all;
   close all;
   binnr = 45;

   day_month03 = [0 31 59 90 120 151 181 212 243 273 304 334];
   day_month04 = [0 31 60 91 121 152 182 213 244 274 305 335];

   YEAR = input('Year:  ', 's');
   year = eval(YEAR);

   if year == 2013, num_month = 12; else num_month = 12; end

   %*****************************************************************************************************************************************
   %*****************************************************************************************************************************************
   %*****************************************************************************************************************************************

   % Read the swr-distribution file from Hyyti?l?
   swr_dis = load('/Users/boy/Documents/Michael/Malte_in/General/Hyytiala/swr_distribution.txt','w');
   
   % Read sun-data for uvb and uva for comparison
   if     year == 2003, sun = load('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2003/data_measured/sun_data.txt','w');
   elseif year == 2004, sun = load('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2004/data_measured/sun_data.txt','w');
   elseif year == 2005, sun = load('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2005/data_measured/sun_data.txt','w');
   elseif year == 2006, sun = load('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2006/data_measured/sun_data.txt','w');
   elseif year == 2007, sun = load('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2007/data_measured/sun_data.txt','w');
   elseif year == 2008, sun = load('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2008/data_measured/sun_data.txt','w');
   elseif year == 2009, sun = load('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2009/data_measured/sun_data.txt','w');
   elseif year == 2010, sun = load('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2010/data_measured/sun_data.txt','w'); 
   elseif year == 2011, sun = load('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2011/data_measured/sun_data.txt','w'); 
   elseif year == 2012, sun = load('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2012/data_measured/sun_data.txt','w'); 
   elseif year == 2013, sun = load('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2013/data_measured/sun_data.txt','w');
   elseif year == 2014, sun = load('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2014/data_measured/sun_data.txt','w'); end

   for j = 1:length(sun)
       tim_sun(j) = sun(j,1);
       uvb(j)     = sun(j,5);
       uva(j)     = sun(j,6);
       glo(j)     = sun(j,2);
   end

   % Start of the loop for every day
   for mo = 1:num_month
       mo
       if mo == 1,  s = 1; k = 31; end
       if mo == 2
          s = 1; 
          if year == 2004 || year == 2008 || year == 2012
             k = 29; 
          else
             k = 28;
          end 
       end
       if mo == 3,  s = 1; k = 31; end
       if mo == 4,  s = 1; k = 30; end
       if mo == 5,  s = 1; k = 31; end
       if mo == 6,  s = 1; k = 30; end
       if mo == 7,  s = 1; k = 31; end
       if mo == 8,  s = 1; k = 31; end
       if mo == 9,  s = 1; k = 30; end
       if mo == 10, s = 1; k = 31; end
       if mo == 11, s = 1; k = 30; end
       if mo == 12, s = 1; k = 31; end
  
       for j = s:k
          if     year == 2003, filename =    30000 + j + mo*100; filepath  = '/Users/boy/Documents/Michael/Hyyt/Radspectrometer/Server/Year2003/data/';
          elseif year == 2004, filename =    40000 + j + mo*100; filepath  = '/Users/boy/Documents/Michael/Hyyt/Radspectrometer/Server/Year2004/data/';
          elseif year == 2005, filename =    50000 + j + mo*100; filepath  = '/Users/boy/Documents/Michael/Hyyt/Radspectrometer/Server/Year2005/data/';
          elseif year == 2006, filename =    60000 + j + mo*100; filepath  = '/Users/boy/Documents/Michael/Hyyt/Radspectrometer/Server/Year2006/data/';
          elseif year == 2007, filename =    70000 + j + mo*100; filepath  = '/Users/boy/Documents/Michael/Hyyt/Radspectrometer/Server/Year2007/data/'; 
          elseif year == 2008, filename =    80000 + j + mo*100; filepath  = '/Users/boy/Documents/Michael/Hyyt/Radspectrometer/Server/Year2008/data/'; 
          elseif year == 2009, filename =    90000 + j + mo*100; filepath  = '/Users/boy/Documents/Michael/Hyyt/Radspectrometer/Server/Year2009/data/'; 
          elseif year == 2010, filename =   100000 + j + mo*100; filepath  = '/Users/boy/Documents/Michael/Hyyt/Radspectrometer/Server/Year2010/data/'; 
          elseif year == 2011, filename = 20110000 + j + mo*100; filepath  = '/Users/boy/Documents/Michael/Hyyt/Radspectrometer/Server/Year2011/data/'; 
          elseif year == 2012, filename = 20120000 + j + mo*100; filepath  = '/Users/boy/Documents/Michael/Hyyt/Radspectrometer/Server/Year2012/data/'; 
          elseif year == 2013, filename = 20130000 + j + mo*100; filepath  = '/Users/boy/Documents/Michael/Hyyt/Radspectrometer/Server/Year2013/data/'; 
          elseif year == 2014, filename = 20140000 + j + mo*100; filepath  = '/Users/boy/Documents/Michael/Hyyt/Radspectrometer/Server/Year2014/data/'; end

          if year < 2011 
             date = [num2str(filename)];
             if year < 2010
                month = date(2:3);
                date1 = date(1:5);
             else
                month = date(3:4);
                date1 = date(1:6);
             end
       
             if month < 10
                month=['0' num2str(month)];
             else
                month=num2str(month);
             end
      
             if year == 2004 || year == 2008 || year == 2012
                julian = j + day_month04(mo); 
             else
                julian = j + day_month03(mo); 
             end
       
             if month < 10
                filena   = ['Ra0' date1 '.rad'];
             else
                filena   = ['Ra' date1 '.rad'];
             end
         
              date = [num2str(filename)];
             if year < 2010
                month = date(2:3);
                date1 = date(1:5);
             else
                month = date(3:4);
                date1 = date(1:6);
             end
          else 
             date = [num2str(filename)];
             date1 = date(1:8);
     
             if year == 2012
                julian = j + day_month04(mo); 
             else
                julian = j + day_month03(mo); 
             end
       
             filena   = ['Rad' date1 '.txt'];
          end
       
          filename = [filepath filena];
          swfile   = load(filename);

          for i = 1:48, sun_par(i) = 1; end
       
          for i = 2:48
              for k = 2:302
                  if swfile(k,i) < -1000 || isnan(swfile(k,i)) == 1
                     swfile(k,i) = NaN;
                     sun_par(i) = 2;
                  end
              end
          end

          for i = 2:48
              for k = 2:302
                  if swfile(k,i) < 0
                     swfile(k,i) = 0;
                  end
              end
          end
              
          for i = 1:47
              swrad(1,i) = sum(swfile(2:7,i+1));
              for k = 1:binnr
                  swrad(k,i) = sum(swfile(8+k*5-5:12+k*5-5,i+1));
              end
              julianT(i) = julian + i/48 - 1/48 - 7/24/3600;
          end
          for k = 1:binnr
              swrad(k,48) = swrad(k,47);
          end
          julianT(48) = julianT(47) + 1/48;
      
          for i = 1:48
              swr_par(i+julian*48-48) = sun_par(i);     
              time_new(i+julian*48-48) = julianT(i);
              for k = 1:binnr
                  swrad_new(i+julian*48-48,k) = swrad(k,i);
              end
          end
          clear julianT swrad swfile julian 
       end
    end
    swrad_new_cor = swrad_new;
end


% Time change for 2007
if year == 2007
   for j = 1:length(time_new)-1
       if j > 4080
          for k = 1:binnr
              swrad_new_cor(j,k) = swrad_new(j+1,k);
          end
       end
   end
   for k = 1:binnr
       swrad_new_cor(length(time_new),k) = swrad_new(length(time_new),k);
   end
end

% Time change for 2008
if year == 2008
   for j = 1:length(time_new)-1
       if j > 4392
          for k = 1:binnr
              swrad_new_cor(j,k) = swrad_new(j+1,k);
          end
       end
   end
   for k = 1:binnr
       swrad_new_cor(length(time_new),k) = swrad_new(length(time_new),k);
   end
end


% Time change 
for j = 2:length(time_new)
    if year == 2003 || year == 2004 || year == 2005 || year == 2006 || (year == 2007 && j < 4081) || (year == 2008 && j < 4391)
       for k = 1:binnr
           swrad_new_cor(j,k) = swrad_new(j-1,k);
       end
       for k = 1:binnr
           swrad_new_cor(1,k) = swrad_new(1,k);
       end
    end
end


for k = 1:binnr
    swrad_int(:,k) = inter_sosa(swrad_new_cor(:,k), length(swrad_new_cor));
end


% Interpolation for missing data has been change in 2011 to use swr-distribution
% because to many long periods of missing data from radiospectrometer
if year < 2011
   for k = 1:binnr
       for j = 1:length(swrad_int)
           if isnan(swrad_int(j,k)) == 0
              swrad_int_F(j,k) = swrad_int(j,k);
           elseif year == 2003 && j < 145 
              swrad_int_F(j,k) = swrad_int(j,k);
           elseif year == 2006 && j < 145 
              swrad_int_F(j,k) = swrad_int(j,k);
           elseif year == 2011 && j < 145 
              swrad_int_F(j,k) = swrad_int(j,k);
           elseif isnan(swrad_int(j,k)) == 1
              swrad_int_F(j,k) = (swrad_int_F(j-48,k)+swrad_int_F(j-48*2,k)+swrad_int_F(j-48*3,k))/3;
              swr_par(j) = 3;
           end
       end
       for j = length(swrad_int):-1:1
           if isnan(swrad_int(j,k)) == 0
              swrad_int_B(j,k) = swrad_int(j,k);
           elseif year == 2008 && j > 8591 
              swrad_int_B(j,k) = swrad_int(j,k);
           elseif isnan(swrad_int(j,k)) == 1
              swrad_int_B(j,k) = (swrad_int_B(j+48,k)+swrad_int_B(j+48*2,k)+swrad_int_B(j+48*3,k))/3;
              swr_par(j) = 3;
           end
       end
       for j = 1:length(swrad_int)
           if isnan(swrad_int_F(j,k)) == 0 && isnan(swrad_int_B(j,k)) == 0 
              swrad_int_new(j,k) = (swrad_int_F(j,k) + swrad_int_B(j,k)) / 2; 
           elseif isnan(swrad_int_F(j,k)) == 1 && isnan(swrad_int_B(j,k)) == 0 
              swrad_int_new(j,k) = swrad_int_B(j,k); 
           elseif isnan(swrad_int_F(j,k)) == 0 && isnan(swrad_int_B(j,k)) == 1 
              swrad_int_new(j,k) = swrad_int_F(j,k); 
           end
       end
   end

   % Interpolation to sun time-step
   for k = 1:binnr
       swrad_fin = interp1(time_new, swrad_int_new(:,k), tim_sun);
       for j = 1:length(swrad_fin)
           swrad_final(j,k) = swrad_fin(j);
           if isnan(swrad_final(j,k)) == 1, swrad_final(j,k) = 0.; end
       end
   end
else
   % No idea where this factor 2 comes from but it seems to be necessary
   for j = 1:length(swrad_int)
       for k = 1:binnr
           if isnan(swrad_int(j,k)) == 1
              swrad_final(j,k) = swr_dis(k) * glo(j) * 1000 * 2;
              swr_par(j) = 3;
           else
              swrad_final(j,k) = swrad_int(j,k);
          end
       end
   end
end


% Calculation of uv for comparision with sun-data 
for j = 1:length(swrad_final)
    UVB(j) = sum(swrad_final(j,1:8))/1000;
    UVA(j) = sum(swrad_final(j,9:24)/1000);
end
    
    
plotpar = 1;
if plotpar == 1
   figure(1)
   clf
   subplot(211)
   hold on
   plot(tim_sun, UVB,'b-')
   plot(tim_sun, uvb,'r-')
   plot(tim_sun, swr_par, 'k-')
   legend('uvb-rsp', 'uvb')
   title(['Year:  ', num2str(year)])
   
   subplot(212)
   hold on
   plot(tim_sun, UVA,'b-')
   plot(tim_sun, uva,'r-')
   plot(tim_sun, swr_par, 'k-')
   legend('uva-rsp', 'uva')
end
       

%Saving the daily CSA values 
savepr = 1;
if savepr == 1;
   if     year == 2003, fid = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2003/data_measured/swr.txt','w');
   elseif year == 2004, fid = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2004/data_measured/swr.txt','w');
   elseif year == 2005, fid = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2005/data_measured/swr.txt','w');
   elseif year == 2006, fid = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2006/data_measured/swr.txt','w');
   elseif year == 2007, fid = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2007/data_measured/swr.txt','w'); 
   elseif year == 2008, fid = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2008/data_measured/swr.txt','w'); 
   elseif year == 2009, fid = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2009/data_measured/swr.txt','w'); 
   elseif year == 2010, fid = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2010/data_measured/swr.txt','w'); 
   elseif year == 2011, fid = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2011/data_measured/swr.txt','w'); 
   elseif year == 2012, fid = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2012/data_measured/swr.txt','w'); 
   elseif year == 2013, fid = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2013/data_measured/swr.txt','w');
   elseif year == 2014, fid = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2014/data_measured/swr.txt','w'); end
   for i = 1:length(tim_sun)
       fprintf (fid, '%7.3f', tim_sun(i));    
       for k = 1:binnr
           fprintf (fid, '%10.2f',  swrad_final(i,k)); 
       end      
       fprintf (fid, '%3.0f', swr_par(i));
       fprintf (fid, '\n');    
   end
end

