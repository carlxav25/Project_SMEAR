clear all
close all

YEAR = input('Year:  ', 's');
year = eval(YEAR);

if year == 2013, num_month = 12; else num_month = 12; end

day_month_03 = [0 31 59 90 120 151 181 212 243 273 304 334 365];
day_month_04 = [0 31 60 91 121 152 182 213 244 274 305 335 366];

if     year == 2003, swr = load('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2003/data_measured/swr.txt');
elseif year == 2004, swr = load('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2004/data_measured/swr.txt');
elseif year == 2005, swr = load('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2005/data_measured/swr.txt');
elseif year == 2006, swr = load('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2006/data_measured/swr.txt');
elseif year == 2007, swr = load('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2007/data_measured/swr.txt');
elseif year == 2008, swr = load('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2008/data_measured/swr.txt');
elseif year == 2009, swr = load('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2009/data_measured/swr.txt');
elseif year == 2010, swr = load('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2010/data_measured/swr.txt'); 
elseif year == 2011, swr = load('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2011/data_measured/swr.txt'); 
elseif year == 2012, swr = load('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2012/data_measured/swr.txt'); 
elseif year == 2013, swr = load('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2013/data_measured/swr.txt'); 
elseif year == 2014, swr = load('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2014/data_measured/swr.txt'); end

if     year == 2003, mast = load('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2003/data_measured/mast_6m_new.txt');
elseif year == 2004, mast = load('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2004/data_measured/mast_6m_new.txt');
elseif year == 2005, mast = load('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2005/data_measured/mast_6m_new.txt');
elseif year == 2006, mast = load('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2006/data_measured/mast_6m_new.txt');
elseif year == 2007, mast = load('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2007/data_measured/mast_6m_new.txt'); 
elseif year == 2008, mast = load('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2008/data_measured/mast_6m_new.txt'); 
elseif year == 2009, mast = load('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2009/data_measured/mast_6m_new.txt'); 
elseif year == 2010, mast = load('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2010/data_measured/mast_6m_new.txt'); 
elseif year == 2011, mast = load('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2011/data_measured/mast_6m_new.txt'); 
elseif year == 2012, mast = load('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2012/data_measured/mast_6m_new.txt'); 
elseif year == 2013, mast = load('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2013/data_measured/mast_6m_new.txt');
elseif year == 2014, mast = load('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2014/data_measured/mast_6m_new.txt'); end

% This is because SO2 is measured only at 25 m in 2014
if year == 2014, mastB = load('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2014/data_measured/mast_25m_new.txt'); end


if     year == 2003, sun = load('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2003/data_measured/sun_data.txt');
elseif year == 2004, sun = load('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2004/data_measured/sun_data.txt');
elseif year == 2005, sun = load('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2005/data_measured/sun_data.txt');
elseif year == 2006, sun = load('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2006/data_measured/sun_data.txt');
elseif year == 2007, sun = load('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2007/data_measured/sun_data.txt');
elseif year == 2008, sun = load('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2008/data_measured/sun_data.txt');
elseif year == 2009, sun = load('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2009/data_measured/sun_data.txt');
elseif year == 2010, sun = load('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2010/data_measured/sun_data.txt');
elseif year == 2011, sun = load('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2011/data_measured/sun_data.txt'); 
elseif year == 2012, sun = load('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2012/data_measured/sun_data.txt'); 
elseif year == 2013, sun = load('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2013/data_measured/sun_data.txt');
elseif year == 2014, sun = load('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2014/data_measured/sun_data.txt'); end

if     year == 2003, temp = load('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2003/data_measured/mast_temp.txt');
elseif year == 2004, temp = load('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2004/data_measured/mast_temp.txt');
elseif year == 2005, temp = load('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2005/data_measured/mast_temp.txt');
elseif year == 2006, temp = load('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2006/data_measured/mast_temp.txt');
elseif year == 2007, temp = load('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2007/data_measured/mast_temp.txt');
elseif year == 2008, temp = load('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2008/data_measured/mast_temp.txt');
elseif year == 2009, temp = load('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2009/data_measured/mast_temp.txt');
elseif year == 2010, temp = load('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2010/data_measured/mast_temp.txt');
elseif year == 2011, temp = load('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2011/data_measured/mast_temp.txt'); 
elseif year == 2012, temp = load('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2012/data_measured/mast_temp.txt'); 
elseif year == 2013, temp = load('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2013/data_measured/mast_temp.txt');
elseif year == 2014, temp = load('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2014/data_measured/mast_temp.txt'); end

if     year == 2003, h2o = load('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2003/data_measured/mast_h2o.txt');
elseif year == 2004, h2o = load('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2004/data_measured/mast_h2o.txt');
elseif year == 2005, h2o = load('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2005/data_measured/mast_h2o.txt');
elseif year == 2006, h2o = load('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2006/data_measured/mast_h2o.txt');
elseif year == 2007, h2o = load('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2007/data_measured/mast_h2o.txt');
elseif year == 2008, h2o = load('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2008/data_measured/mast_h2o.txt');
elseif year == 2009, h2o = load('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2009/data_measured/mast_h2o.txt');
elseif year == 2010, h2o = load('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2010/data_measured/mast_h2o.txt'); 
elseif year == 2011, h2o = load('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2011/data_measured/mast_h2o.txt'); 
elseif year == 2012, h2o = load('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2012/data_measured/mast_h2o.txt'); 
elseif year == 2013, h2o = load('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2013/data_measured/mast_h2o.txt');
elseif year == 2014, h2o = load('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2014/data_measured/mast_h2o.txt'); end

if     year == 2003, wsd = load('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2003/data_measured/mast_ws.txt');
elseif year == 2004, wsd = load('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2004/data_measured/mast_ws.txt');
elseif year == 2005, wsd = load('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2005/data_measured/mast_ws.txt');
elseif year == 2006, wsd = load('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2006/data_measured/mast_ws.txt');
elseif year == 2007, wsd = load('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2007/data_measured/mast_ws.txt');
elseif year == 2008, wsd = load('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2008/data_measured/mast_ws.txt');
elseif year == 2009, wsd = load('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2009/data_measured/mast_ws.txt');
elseif year == 2010, wsd = load('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2010/data_measured/mast_ws.txt'); 
elseif year == 2011, wsd = load('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2011/data_measured/mast_ws.txt'); 
elseif year == 2012, wsd = load('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2012/data_measured/mast_ws.txt'); 
elseif year == 2013, wsd = load('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2013/data_measured/mast_ws.txt');
elseif year == 2014, wsd = load('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2014/data_measured/mast_ws.txt'); end

if     year == 2003, flux = load('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2003/data_measured/flux_23m.txt');
elseif year == 2004, flux = load('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2004/data_measured/flux_23m.txt');
elseif year == 2005, flux = load('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2005/data_measured/flux_23m.txt');
elseif year == 2006, flux = load('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2006/data_measured/flux_23m.txt');
elseif year == 2007, flux = load('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2007/data_measured/flux_23m.txt');
elseif year == 2008, flux = load('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2008/data_measured/flux_23m.txt');
elseif year == 2009, flux = load('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2009/data_measured/flux_23m.txt');
elseif year == 2010, flux = load('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2010/data_measured/flux_23m.txt');
elseif year == 2011, flux = load('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2011/data_measured/flux_23m.txt'); 
elseif year == 2012, flux = load('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2012/data_measured/flux_23m.txt');
elseif year == 2013, flux = load('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2013/data_measured/flux_23m.txt');
elseif year == 2014, flux = load('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2014/data_measured/flux_23m.txt'); end
   
if     year == 2003,  cs = load('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2003/data_measured/cs_hyy.txt','w');
elseif year == 2004,  cs = load('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2004/data_measured/cs_hyy.txt','w');
elseif year == 2005,  cs = load('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2005/data_measured/cs_hyy.txt','w');
elseif year == 2006,  cs = load('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2006/data_measured/cs_hyy.txt','w');
elseif year == 2007,  cs = load('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2007/data_measured/cs_hyy.txt','w');
elseif year == 2008,  cs = load('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2008/data_measured/cs_hyy.txt','w');
elseif year == 2009,  cs = load('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2009/data_measured/cs_hyy.txt','w');
elseif year == 2010,  cs = load('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2010/data_measured/cs_hyy.txt','w');
elseif year == 2011,  cs = load('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2011/data_measured/cs_hyy.txt','w'); 
elseif year == 2012,  cs = load('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2012/data_measured/cs_hyy.txt','w'); 
elseif year == 2013,  cs = load('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2013/data_measured/cs_hyy.txt','w');
elseif year == 2014,  cs = load('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2014/data_measured/cs_hyy.txt','w'); end

if     year == 2003,  coa = load('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2003/data_measured/coa_par.txt','w');
elseif year == 2004,  coa = load('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2004/data_measured/coa_par.txt','w');
elseif year == 2005,  coa = load('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2005/data_measured/coa_par.txt','w');
elseif year == 2006,  coa = load('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2006/data_measured/coa_par.txt','w');
elseif year == 2007,  coa = load('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2007/data_measured/coa_par.txt','w');
elseif year == 2008,  coa = load('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2008/data_measured/coa_par.txt','w');
elseif year == 2009,  coa = load('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2009/data_measured/coa_par.txt','w');
elseif year == 2010,  coa = load('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2010/data_measured/coa_par.txt','w');
elseif year == 2011,  coa = load('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2011/data_measured/coa_par.txt','w'); 
elseif year == 2012,  coa = load('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2012/data_measured/coa_par.txt','w'); 
elseif year == 2013,  coa = load('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2013/data_measured/coa_par.txt','w'); 
elseif year == 2014,  coa = load('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2014/data_measured/coa_par.txt','w'); end
   
    
if   year == 2004 || year == 2008 || year == 2012, day_month = day_month_04;
else day_month = day_month_03; end


% Problem with the CS values for 2011 and 2012 so read in data from Tuomo
if year == 2011 || year == 2012 || year == 2013  || year == 2014
   if year == 2011, cs_tuomo = load('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2011/data_measured/cs_new.txt','w'); end
   if year == 2012, cs_tuomo = load('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2012/data_measured/cs_new.txt','w'); end
   if year == 2013, cs_tuomo = load('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2013/data_measured/cs_new.txt','w'); end
   if year == 2014, cs_tuomo = load('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2014/data_measured/cs_new.txt','w'); end
   for j = 1:day_month(13)*48+1
       cs_tuomo_time_new(j) = 1+j/24/2;
   end
   
   if year == 2011 || year == 2012 
      for j = 1:length(cs_tuomo)
          cs_tuomo_time_old(j) = cs_tuomo(j,1);
      end
      cs_h2so4= interp1(cs_tuomo_time_old, cs_tuomo(:,2), cs_tuomo_time_new, 'linear');   
   end
   
   if  year == 2013  || year == 2014

      % Gap filling for long missing data sets
      k = 2;
      for j = 1:length(cs_tuomo)
          if isnan(cs_tuomo(j,k)) == 0
             cs_tuomo_F(j,k) = cs_tuomo(j,k);
          elseif isnan(cs_tuomo(j,k)) == 1 & j>144
             cs_tuomo_F(j,k) = (cs_tuomo_F(j-48,k) + cs_tuomo_F(j-48*2,k) + cs_tuomo_F(j-48*3,k))/3;
          else
             cs_tuomo_F(j,k) = cs_tuomo(j,k);
          end
      end
      for j = length(cs_tuomo):-1:1
          if isnan(cs_tuomo(j,k)) == 0
             cs_tuomo_B(j,k) = cs_tuomo(j,k);
          elseif isnan(cs_tuomo(j,k)) == 1 && j < length(cs_tuomo)-144
             cs_tuomo_B(j,k) = (cs_tuomo_B(j+48,k) + cs_tuomo_B(j+48*2,k) + cs_tuomo_B(j+48*3,k))/3;
          else
             cs_tuomo_B(j,k) = cs_tuomo(j,k);
          end
      end
      for j = 1:length(cs_tuomo)
          if isnan(cs_tuomo_F(j,k)) == 0 && isnan(cs_tuomo_B(j,k)) == 0 
             cs_tuomo_int(j,k) = (cs_tuomo_F(j,k) + cs_tuomo_B(j,k)) / 2; 
          elseif isnan(cs_tuomo_F(j,k)) == 1 && isnan(cs_tuomo_B(j,k)) == 0 
             cs_tuomo_int(j,k) = cs_tuomo_B(j,k); 
          elseif isnan(cs_tuomo_F(j,k)) == 0 && isnan(cs_tuomo_B(j,k)) == 1 
            cs_tuomo_int(j,k) = cs_tuomo_F(j,k); 
          end
      end
      
       
      j1 = 2;
      for j = 1:length(cs_tuomo)
          T_date = datevec(cs_tuomo(j,1));
          cs_tuomo_time_oldx(j) = day_month_03(T_date(2)) + T_date(3) + T_date(4)/24 + T_date(5)/24/60 + T_date(6)/24/60/60;
          if j ==  1; 
              cs_tuomo_time_old(1) = cs_tuomo_time_oldx(1); 
              cs_tuomo_new(1,2) = cs_tuomo_int(1,2);
          end
          if j > 1 && cs_tuomo_time_oldx(j) > cs_tuomo_time_old(j1-1) 
             cs_tuomo_time_old(j1) = cs_tuomo_time_oldx(j);
             cs_tuomo_new(j1,2) = cs_tuomo_int(j,2);
             j1 = j1 +1;
          end
      end
   end


   cs_h2so4= interp1(cs_tuomo_time_old, cs_tuomo_new(:,2), cs_tuomo_time_new, 'linear');
   cs_h2so4(length(cs_h2so4)-1) = cs_h2so4(length(cs_h2so4)-2);
   cs_h2so4(length(cs_h2so4))   = cs_h2so4(length(cs_h2so4)-2);
end

[swr_x swr_y] = size(swr);


for j = 1:num_month
    if year == 2014
       if     j == 1,   fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2014/data_input/M01/hyy_mix.txt','w');
       elseif j == 2,   fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2014/data_input/M02/hyy_mix.txt','w');
       elseif j == 3,   fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2014/data_input/M03/hyy_mix.txt','w');
       elseif j == 4,   fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2014/data_input/M04/hyy_mix.txt','w');
       elseif j == 5,   fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2014/data_input/M05/hyy_mix.txt','w');
       elseif j == 6,   fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2014/data_input/M06/hyy_mix.txt','w'); 
       elseif j == 7,   fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2014/data_input/M07/hyy_mix.txt','w');
       elseif j == 8,   fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2014/data_input/M08/hyy_mix.txt','w');
       elseif j == 9,   fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2014/data_input/M09/hyy_mix.txt','w');
       elseif j == 10,  fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2014/data_input/M10/hyy_mix.txt','w'); 
       elseif j == 11,  fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2014/data_input/M11/hyy_mix.txt','w');
       elseif j == 12,  fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2014/data_input/M12/hyy_mix.txt','w'); 
       end

       if     j == 1,   fid2 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2014/data_input/M01/hyy_swr.txt','w');
       elseif j == 2,   fid2 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2014/data_input/M02/hyy_swr.txt','w');
       elseif j == 3,   fid2 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2014/data_input/M03/hyy_swr.txt','w');
       elseif j == 4,   fid2 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2014/data_input/M04/hyy_swr.txt','w');
       elseif j == 5,   fid2 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2014/data_input/M05/hyy_swr.txt','w');
       elseif j == 6,   fid2 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2014/data_input/M06/hyy_swr.txt','w'); 
       elseif j == 7,   fid2 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2014/data_input/M07/hyy_swr.txt','w');
       elseif j == 8,   fid2 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2014/data_input/M08/hyy_swr.txt','w');
       elseif j == 9,   fid2 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2014/data_input/M09/hyy_swr.txt','w');
       elseif j == 10,  fid2 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2014/data_input/M10/hyy_swr.txt','w');
       elseif j == 11,  fid2 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2014/data_input/M11/hyy_swr.txt','w');
       elseif j == 12,  fid2 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2014/data_input/M12/hyy_swr.txt','w'); 
       end

       if     j == 1,   fid3 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2014/data_input/M01/hyy_gas_new.txt','w');
       elseif j == 2,   fid3 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2014/data_input/M02/hyy_gas_new.txt','w');
       elseif j == 3,   fid3 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2014/data_input/M03/hyy_gas_new.txt','w');
       elseif j == 4,   fid3 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2014/data_input/M04/hyy_gas_new.txt','w');
       elseif j == 5,   fid3 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2014/data_input/M05/hyy_gas_new.txt','w');
       elseif j == 6,   fid3 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2014/data_input/M06/hyy_gas_new.txt','w'); 
       elseif j == 7,   fid3 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2014/data_input/M07/hyy_gas_new.txt','w');
       elseif j == 8,   fid3 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2014/data_input/M08/hyy_gas_new.txt','w');
       elseif j == 9,   fid3 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2014/data_input/M09/hyy_gas_new.txt','w');
       elseif j == 10,  fid3 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2014/data_input/M10/hyy_gas_new.txt','w'); 
       elseif j == 11,  fid3 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2014/data_input/M11/hyy_gas_new.txt','w');
       elseif j == 12,  fid3 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2014/data_input/M12/hyy_gas_new.txt','w'); 
       end
    end
    
    if year == 2013
       if     j == 1,   fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2013/data_input/M01/hyy_mix.txt','w');
       elseif j == 2,   fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2013/data_input/M02/hyy_mix.txt','w');
       elseif j == 3,   fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2013/data_input/M03/hyy_mix.txt','w');
       elseif j == 4,   fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2013/data_input/M04/hyy_mix.txt','w');
       elseif j == 5,   fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2013/data_input/M05/hyy_mix.txt','w');
       elseif j == 6,   fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2013/data_input/M06/hyy_mix.txt','w'); 
       elseif j == 7,   fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2013/data_input/M07/hyy_mix.txt','w');
       elseif j == 8,   fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2013/data_input/M08/hyy_mix.txt','w');
       elseif j == 9,   fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2013/data_input/M09/hyy_mix.txt','w');
       elseif j == 10,  fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2013/data_input/M10/hyy_mix.txt','w'); 
       elseif j == 11,  fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2013/data_input/M11/hyy_mix.txt','w');
       elseif j == 12,  fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2013/data_input/M12/hyy_mix.txt','w'); 
       end

       if     j == 1,   fid2 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2013/data_input/M01/hyy_swr.txt','w');
       elseif j == 2,   fid2 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2013/data_input/M02/hyy_swr.txt','w');
       elseif j == 3,   fid2 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2013/data_input/M03/hyy_swr.txt','w');
       elseif j == 4,   fid2 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2013/data_input/M04/hyy_swr.txt','w');
       elseif j == 5,   fid2 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2013/data_input/M05/hyy_swr.txt','w');
       elseif j == 6,   fid2 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2013/data_input/M06/hyy_swr.txt','w'); 
       elseif j == 7,   fid2 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2013/data_input/M07/hyy_swr.txt','w');
       elseif j == 8,   fid2 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2013/data_input/M08/hyy_swr.txt','w');
       elseif j == 9,   fid2 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2013/data_input/M09/hyy_swr.txt','w');
       elseif j == 10,  fid2 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2013/data_input/M10/hyy_swr.txt','w');
       elseif j == 11,  fid2 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2013/data_input/M11/hyy_swr.txt','w');
       elseif j == 12,  fid2 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2013/data_input/M12/hyy_swr.txt','w'); 
       end

       if     j == 1,   fid3 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2013/data_input/M01/hyy_gas_new.txt','w');
       elseif j == 2,   fid3 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2013/data_input/M02/hyy_gas_new.txt','w');
       elseif j == 3,   fid3 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2013/data_input/M03/hyy_gas_new.txt','w');
       elseif j == 4,   fid3 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2013/data_input/M04/hyy_gas_new.txt','w');
       elseif j == 5,   fid3 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2013/data_input/M05/hyy_gas_new.txt','w');
       elseif j == 6,   fid3 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2013/data_input/M06/hyy_gas_new.txt','w'); 
       elseif j == 7,   fid3 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2013/data_input/M07/hyy_gas_new.txt','w');
       elseif j == 8,   fid3 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2013/data_input/M08/hyy_gas_new.txt','w');
       elseif j == 9,   fid3 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2013/data_input/M09/hyy_gas_new.txt','w');
       elseif j == 10,  fid3 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2013/data_input/M10/hyy_gas_new.txt','w'); 
       elseif j == 11,  fid3 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2013/data_input/M11/hyy_gas_new.txt','w');
       elseif j == 12,  fid3 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2013/data_input/M12/hyy_gas_new.txt','w'); 
       end
    end
    
    if year == 2012
       if     j == 1,   fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2012/data_input/M01/hyy_mix.txt','w');
       elseif j == 2,   fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2012/data_input/M02/hyy_mix.txt','w');
       elseif j == 3,   fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2012/data_input/M03/hyy_mix.txt','w');
       elseif j == 4,   fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2012/data_input/M04/hyy_mix.txt','w');
       elseif j == 5,   fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2012/data_input/M05/hyy_mix.txt','w');
       elseif j == 6,   fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2012/data_input/M06/hyy_mix.txt','w'); 
       elseif j == 7,   fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2012/data_input/M07/hyy_mix.txt','w');
       elseif j == 8,   fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2012/data_input/M08/hyy_mix.txt','w');
       elseif j == 9,   fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2012/data_input/M09/hyy_mix.txt','w');
       elseif j == 10,  fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2012/data_input/M10/hyy_mix.txt','w'); 
       elseif j == 11,  fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2012/data_input/M11/hyy_mix.txt','w');
       elseif j == 12,  fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2012/data_input/M12/hyy_mix.txt','w'); 
       end

       if     j == 1,   fid2 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2012/data_input/M01/hyy_swr.txt','w');
       elseif j == 2,   fid2 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2012/data_input/M02/hyy_swr.txt','w');
       elseif j == 3,   fid2 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2012/data_input/M03/hyy_swr.txt','w');
       elseif j == 4,   fid2 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2012/data_input/M04/hyy_swr.txt','w');
       elseif j == 5,   fid2 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2012/data_input/M05/hyy_swr.txt','w');
       elseif j == 6,   fid2 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2012/data_input/M06/hyy_swr.txt','w'); 
       elseif j == 7,   fid2 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2012/data_input/M07/hyy_swr.txt','w');
       elseif j == 8,   fid2 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2012/data_input/M08/hyy_swr.txt','w');
       elseif j == 9,   fid2 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2012/data_input/M09/hyy_swr.txt','w');
       elseif j == 10,  fid2 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2012/data_input/M10/hyy_swr.txt','w');
       elseif j == 11,  fid2 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2012/data_input/M11/hyy_swr.txt','w');
       elseif j == 12,  fid2 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2012/data_input/M12/hyy_swr.txt','w'); 
       end

       if     j == 1,   fid3 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2012/data_input/M01/hyy_gas_new.txt','w');
       elseif j == 2,   fid3 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2012/data_input/M02/hyy_gas_new.txt','w');
       elseif j == 3,   fid3 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2012/data_input/M03/hyy_gas_new.txt','w');
       elseif j == 4,   fid3 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2012/data_input/M04/hyy_gas_new.txt','w');
       elseif j == 5,   fid3 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2012/data_input/M05/hyy_gas_new.txt','w');
       elseif j == 6,   fid3 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2012/data_input/M06/hyy_gas_new.txt','w'); 
       elseif j == 7,   fid3 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2012/data_input/M07/hyy_gas_new.txt','w');
       elseif j == 8,   fid3 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2012/data_input/M08/hyy_gas_new.txt','w');
       elseif j == 9,   fid3 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2012/data_input/M09/hyy_gas_new.txt','w');
       elseif j == 10,  fid3 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2012/data_input/M10/hyy_gas_new.txt','w'); 
       elseif j == 11,  fid3 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2012/data_input/M11/hyy_gas_new.txt','w');
       elseif j == 12,  fid3 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2012/data_input/M12/hyy_gas_new.txt','w'); 
       end
    end
    
    if year == 2011
       if     j == 1,   fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2011/data_input/M01/hyy_mix.txt','w');
       elseif j == 2,   fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2011/data_input/M02/hyy_mix.txt','w');
       elseif j == 3,   fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2011/data_input/M03/hyy_mix.txt','w');
       elseif j == 4,   fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2011/data_input/M04/hyy_mix.txt','w');
       elseif j == 5,   fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2011/data_input/M05/hyy_mix.txt','w');
       elseif j == 6,   fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2011/data_input/M06/hyy_mix.txt','w'); 
       elseif j == 7,   fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2011/data_input/M07/hyy_mix.txt','w');
       elseif j == 8,   fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2011/data_input/M08/hyy_mix.txt','w');
       elseif j == 9,   fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2011/data_input/M09/hyy_mix.txt','w');
       elseif j == 10,  fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2011/data_input/M10/hyy_mix.txt','w'); 
       elseif j == 11,  fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2011/data_input/M11/hyy_mix.txt','w');
       elseif j == 12,  fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2011/data_input/M12/hyy_mix.txt','w'); 
       end

       if     j == 1,   fid2 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2011/data_input/M01/hyy_swr.txt','w');
       elseif j == 2,   fid2 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2011/data_input/M02/hyy_swr.txt','w');
       elseif j == 3,   fid2 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2011/data_input/M03/hyy_swr.txt','w');
       elseif j == 4,   fid2 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2011/data_input/M04/hyy_swr.txt','w');
       elseif j == 5,   fid2 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2011/data_input/M05/hyy_swr.txt','w');
       elseif j == 6,   fid2 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2011/data_input/M06/hyy_swr.txt','w'); 
       elseif j == 7,   fid2 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2011/data_input/M07/hyy_swr.txt','w');
       elseif j == 8,   fid2 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2011/data_input/M08/hyy_swr.txt','w');
       elseif j == 9,   fid2 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2011/data_input/M09/hyy_swr.txt','w');
       elseif j == 10,  fid2 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2011/data_input/M10/hyy_swr.txt','w');
       elseif j == 11,  fid2 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2011/data_input/M11/hyy_swr.txt','w');
       elseif j == 12,  fid2 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2011/data_input/M12/hyy_swr.txt','w'); 
       end

       if     j == 1,   fid3 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2011/data_input/M01/hyy_gas_new.txt','w');
       elseif j == 2,   fid3 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2011/data_input/M02/hyy_gas_new.txt','w');
       elseif j == 3,   fid3 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2011/data_input/M03/hyy_gas_new.txt','w');
       elseif j == 4,   fid3 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2011/data_input/M04/hyy_gas_new.txt','w');
       elseif j == 5,   fid3 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2011/data_input/M05/hyy_gas_new.txt','w');
       elseif j == 6,   fid3 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2011/data_input/M06/hyy_gas_new.txt','w'); 
       elseif j == 7,   fid3 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2011/data_input/M07/hyy_gas_new.txt','w');
       elseif j == 8,   fid3 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2011/data_input/M08/hyy_gas_new.txt','w');
       elseif j == 9,   fid3 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2011/data_input/M09/hyy_gas_new.txt','w');
       elseif j == 10,  fid3 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2011/data_input/M10/hyy_gas_new.txt','w'); 
       elseif j == 11,  fid3 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2011/data_input/M11/hyy_gas_new.txt','w');
       elseif j == 12,  fid3 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2011/data_input/M12/hyy_gas_new.txt','w'); 
       end
    end
    
    if year == 2010
       if     j == 1,   fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2010/data_input/M01/hyy_mix.txt','w');
       elseif j == 2,   fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2010/data_input/M02/hyy_mix.txt','w');
       elseif j == 3,   fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2010/data_input/M03/hyy_mix.txt','w');
       elseif j == 4,   fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2010/data_input/M04/hyy_mix.txt','w');
       elseif j == 5,   fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2010/data_input/M05/hyy_mix.txt','w');
       elseif j == 6,   fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2010/data_input/M06/hyy_mix.txt','w'); 
       elseif j == 7,   fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2010/data_input/M07/hyy_mix.txt','w');
       elseif j == 8,   fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2010/data_input/M08/hyy_mix.txt','w');
       elseif j == 9,   fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2010/data_input/M09/hyy_mix.txt','w');
       elseif j == 10,  fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2010/data_input/M10/hyy_mix.txt','w'); 
       elseif j == 11,  fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2010/data_input/M11/hyy_mix.txt','w');
       elseif j == 12,  fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2010/data_input/M12/hyy_mix.txt','w'); 
       end

       if     j == 1,   fid2 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2010/data_input/M01/hyy_swr.txt','w');
       elseif j == 2,   fid2 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2010/data_input/M02/hyy_swr.txt','w');
       elseif j == 3,   fid2 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2010/data_input/M03/hyy_swr.txt','w');
       elseif j == 4,   fid2 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2010/data_input/M04/hyy_swr.txt','w');
       elseif j == 5,   fid2 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2010/data_input/M05/hyy_swr.txt','w');
       elseif j == 6,   fid2 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2010/data_input/M06/hyy_swr.txt','w'); 
       elseif j == 7,   fid2 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2010/data_input/M07/hyy_swr.txt','w');
       elseif j == 8,   fid2 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2010/data_input/M08/hyy_swr.txt','w');
       elseif j == 9,   fid2 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2010/data_input/M09/hyy_swr.txt','w');
       elseif j == 10,  fid2 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2010/data_input/M10/hyy_swr.txt','w');
       elseif j == 11,  fid2 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2010/data_input/M11/hyy_swr.txt','w');
       elseif j == 12,  fid2 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2010/data_input/M12/hyy_swr.txt','w'); 
       end

       if     j == 1,   fid3 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2010/data_input/M01/hyy_gas_new.txt','w');
       elseif j == 2,   fid3 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2010/data_input/M02/hyy_gas_new.txt','w');
       elseif j == 3,   fid3 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2010/data_input/M03/hyy_gas_new.txt','w');
       elseif j == 4,   fid3 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2010/data_input/M04/hyy_gas_new.txt','w');
       elseif j == 5,   fid3 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2010/data_input/M05/hyy_gas_new.txt','w');
       elseif j == 6,   fid3 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2010/data_input/M06/hyy_gas_new.txt','w'); 
       elseif j == 7,   fid3 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2010/data_input/M07/hyy_gas_new.txt','w');
       elseif j == 8,   fid3 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2010/data_input/M08/hyy_gas_new.txt','w');
       elseif j == 9,   fid3 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2010/data_input/M09/hyy_gas_new.txt','w');
       elseif j == 10,  fid3 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2010/data_input/M10/hyy_gas_new.txt','w'); 
       elseif j == 11,  fid3 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2010/data_input/M11/hyy_gas_new.txt','w');
       elseif j == 12,  fid3 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2010/data_input/M12/hyy_gas_new.txt','w'); 
       end
    end

    if year == 2009
       if     j == 1,   fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2009/data_input/M01/hyy_mix.txt','w');
       elseif j == 2,   fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2009/data_input/M02/hyy_mix.txt','w');
       elseif j == 3,   fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2009/data_input/M03/hyy_mix.txt','w');
       elseif j == 4,   fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2009/data_input/M04/hyy_mix.txt','w');
       elseif j == 5,   fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2009/data_input/M05/hyy_mix.txt','w');
       elseif j == 6,   fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2009/data_input/M06/hyy_mix.txt','w'); 
       elseif j == 7,   fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2009/data_input/M07/hyy_mix.txt','w');
       elseif j == 8,   fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2009/data_input/M08/hyy_mix.txt','w');
       elseif j == 9,   fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2009/data_input/M09/hyy_mix.txt','w');
       elseif j == 10,  fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2009/data_input/M10/hyy_mix.txt','w'); 
       elseif j == 11,  fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2009/data_input/M11/hyy_mix.txt','w');
       elseif j == 12,  fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2009/data_input/M12/hyy_mix.txt','w'); 
       end

       if     j == 1,   fid2 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2009/data_input/M01/hyy_swr.txt','w');
       elseif j == 2,   fid2 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2009/data_input/M02/hyy_swr.txt','w');
       elseif j == 3,   fid2 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2009/data_input/M03/hyy_swr.txt','w');
       elseif j == 4,   fid2 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2009/data_input/M04/hyy_swr.txt','w');
       elseif j == 5,   fid2 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2009/data_input/M05/hyy_swr.txt','w');
       elseif j == 6,   fid2 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2009/data_input/M06/hyy_swr.txt','w'); 
       elseif j == 7,   fid2 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2009/data_input/M07/hyy_swr.txt','w');
       elseif j == 8,   fid2 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2009/data_input/M08/hyy_swr.txt','w');
       elseif j == 9,   fid2 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2009/data_input/M09/hyy_swr.txt','w');
       elseif j == 10,  fid2 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2009/data_input/M10/hyy_swr.txt','w');
       elseif j == 11,  fid2 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2009/data_input/M11/hyy_swr.txt','w');
       elseif j == 12,  fid2 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2009/data_input/M12/hyy_swr.txt','w'); 
       end

       if     j == 1,   fid3 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2009/data_input/M01/hyy_gas_new.txt','w');
       elseif j == 2,   fid3 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2009/data_input/M02/hyy_gas_new.txt','w');
       elseif j == 3,   fid3 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2009/data_input/M03/hyy_gas_new.txt','w');
       elseif j == 4,   fid3 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2009/data_input/M04/hyy_gas_new.txt','w');
       elseif j == 5,   fid3 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2009/data_input/M05/hyy_gas_new.txt','w');
       elseif j == 6,   fid3 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2009/data_input/M06/hyy_gas_new.txt','w'); 
       elseif j == 7,   fid3 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2009/data_input/M07/hyy_gas_new.txt','w');
       elseif j == 8,   fid3 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2009/data_input/M08/hyy_gas_new.txt','w');
       elseif j == 9,   fid3 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2009/data_input/M09/hyy_gas_new.txt','w');
       elseif j == 10,  fid3 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2009/data_input/M10/hyy_gas_new.txt','w'); 
       elseif j == 11,  fid3 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2009/data_input/M11/hyy_gas_new.txt','w');
       elseif j == 12,  fid3 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2009/data_input/M12/hyy_gas_new.txt','w'); 
       end
    end

    if year == 2008
       if     j == 1,   fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2008/data_input/M01/hyy_mix.txt','w');
       elseif j == 2,   fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2008/data_input/M02/hyy_mix.txt','w');
       elseif j == 3,   fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2008/data_input/M03/hyy_mix.txt','w');
       elseif j == 4,   fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2008/data_input/M04/hyy_mix.txt','w');
       elseif j == 5,   fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2008/data_input/M05/hyy_mix.txt','w');
       elseif j == 6,   fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2008/data_input/M06/hyy_mix.txt','w'); 
       elseif j == 7,   fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2008/data_input/M07/hyy_mix.txt','w');
       elseif j == 8,   fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2008/data_input/M08/hyy_mix.txt','w');
       elseif j == 9,   fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2008/data_input/M09/hyy_mix.txt','w');
       elseif j == 10,  fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2008/data_input/M10/hyy_mix.txt','w'); 
       elseif j == 11,  fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2008/data_input/M11/hyy_mix.txt','w');
       elseif j == 12,  fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2008/data_input/M12/hyy_mix.txt','w'); 
       end

       if     j == 1,   fid2 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2008/data_input/M01/hyy_swr.txt','w');
       elseif j == 2,   fid2 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2008/data_input/M02/hyy_swr.txt','w');
       elseif j == 3,   fid2 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2008/data_input/M03/hyy_swr.txt','w');
       elseif j == 4,   fid2 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2008/data_input/M04/hyy_swr.txt','w');
       elseif j == 5,   fid2 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2008/data_input/M05/hyy_swr.txt','w');
       elseif j == 6,   fid2 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2008/data_input/M06/hyy_swr.txt','w'); 
       elseif j == 7,   fid2 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2008/data_input/M07/hyy_swr.txt','w');
       elseif j == 8,   fid2 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2008/data_input/M08/hyy_swr.txt','w');
       elseif j == 9,   fid2 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2008/data_input/M09/hyy_swr.txt','w');
       elseif j == 10,  fid2 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2008/data_input/M10/hyy_swr.txt','w');
       elseif j == 11,  fid2 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2008/data_input/M11/hyy_swr.txt','w');
       elseif j == 12,  fid2 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2008/data_input/M12/hyy_swr.txt','w'); 
       end

       if     j == 1,   fid3 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2008/data_input/M01/hyy_gas_new.txt','w');
       elseif j == 2,   fid3 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2008/data_input/M02/hyy_gas_new.txt','w');
       elseif j == 3,   fid3 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2008/data_input/M03/hyy_gas_new.txt','w');
       elseif j == 4,   fid3 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2008/data_input/M04/hyy_gas_new.txt','w');
       elseif j == 5,   fid3 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2008/data_input/M05/hyy_gas_new.txt','w');
       elseif j == 6,   fid3 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2008/data_input/M06/hyy_gas_new.txt','w'); 
       elseif j == 7,   fid3 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2008/data_input/M07/hyy_gas_new.txt','w');
       elseif j == 8,   fid3 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2008/data_input/M08/hyy_gas_new.txt','w');
       elseif j == 9,   fid3 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2008/data_input/M09/hyy_gas_new.txt','w');
       elseif j == 10,  fid3 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2008/data_input/M10/hyy_gas_new.txt','w'); 
       elseif j == 11,  fid3 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2008/data_input/M11/hyy_gas_new.txt','w');
       elseif j == 12,  fid3 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2008/data_input/M12/hyy_gas_new.txt','w'); 
       end
    end

    if year == 2007
       if     j == 1,   fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2007/data_input/M01/hyy_mix.txt','w');
       elseif j == 2,   fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2007/data_input/M02/hyy_mix.txt','w');
       elseif j == 3,   fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2007/data_input/M03/hyy_mix.txt','w');
       elseif j == 4,   fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2007/data_input/M04/hyy_mix.txt','w');
       elseif j == 5,   fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2007/data_input/M05/hyy_mix.txt','w');
       elseif j == 6,   fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2007/data_input/M06/hyy_mix.txt','w');
       elseif j == 7,   fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2007/data_input/M07/hyy_mix.txt','w');
       elseif j == 8,   fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2007/data_input/M08/hyy_mix.txt','w');
       elseif j == 9,   fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2007/data_input/M09/hyy_mix.txt','w');
       elseif j == 10,  fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2007/data_input/M10/hyy_mix.txt','w');
       elseif j == 11,  fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2007/data_input/M11/hyy_mix.txt','w');
       elseif j == 12,  fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2007/data_input/M12/hyy_mix.txt','w'); end

       if     j == 1,   fid2 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2007/data_input/M01/hyy_swr.txt','w');
       elseif j == 2,   fid2 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2007/data_input/M02/hyy_swr.txt','w');
       elseif j == 3,   fid2 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2007/data_input/M03/hyy_swr.txt','w');
       elseif j == 4,   fid2 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2007/data_input/M04/hyy_swr.txt','w');
       elseif j == 5,   fid2 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2007/data_input/M05/hyy_swr.txt','w');
       elseif j == 6,   fid2 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2007/data_input/M06/hyy_swr.txt','w');
       elseif j == 7,   fid2 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2007/data_input/M07/hyy_swr.txt','w');
       elseif j == 8,   fid2 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2007/data_input/M08/hyy_swr.txt','w');
       elseif j == 9,   fid2 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2007/data_input/M09/hyy_swr.txt','w');
       elseif j == 10,  fid2 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2007/data_input/M10/hyy_swr.txt','w');
       elseif j == 11,  fid2 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2007/data_input/M11/hyy_swr.txt','w');
       elseif j == 12,  fid2 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2007/data_input/M12/hyy_swr.txt','w'); end

       if     j == 1,   fid3 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2007/data_input/M01/hyy_gas_new.txt','w');
       elseif j == 2,   fid3 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2007/data_input/M02/hyy_gas_new.txt','w');
       elseif j == 3,   fid3 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2007/data_input/M03/hyy_gas_new.txt','w');
       elseif j == 4,   fid3 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2007/data_input/M04/hyy_gas_new.txt','w');
       elseif j == 5,   fid3 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2007/data_input/M05/hyy_gas_new.txt','w');
       elseif j == 6,   fid3 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2007/data_input/M06/hyy_gas_new.txt','w');
       elseif j == 7,   fid3 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2007/data_input/M07/hyy_gas_new.txt','w');
       elseif j == 8,   fid3 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2007/data_input/M08/hyy_gas_new.txt','w');
       elseif j == 9,   fid3 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2007/data_input/M09/hyy_gas_new.txt','w');
       elseif j == 10,  fid3 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2007/data_input/M10/hyy_gas_new.txt','w');
       elseif j == 11,  fid3 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2007/data_input/M11/hyy_gas_new.txt','w');
       elseif j == 12,  fid3 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2007/data_input/M12/hyy_gas_new.txt','w'); end
    end

    if year == 2006
       if     j == 1,  fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2006/data_input/M01/hyy_mix.txt','w');
       elseif j == 2,  fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2006/data_input/M02/hyy_mix.txt','w');
       elseif j == 3,  fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2006/data_input/M03/hyy_mix.txt','w');
       elseif j == 4,  fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2006/data_input/M04/hyy_mix.txt','w');
       elseif j == 5,  fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2006/data_input/M05/hyy_mix.txt','w');
       elseif j == 6,  fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2006/data_input/M06/hyy_mix.txt','w');
       elseif j == 7,  fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2006/data_input/M07/hyy_mix.txt','w'); 
       elseif j == 8,  fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2006/data_input/M08/hyy_mix.txt','w'); 
       elseif j == 9,  fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2006/data_input/M09/hyy_mix.txt','w'); 
       elseif j == 10, fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2006/data_input/M10/hyy_mix.txt','w'); 
       elseif j == 11, fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2006/data_input/M11/hyy_mix.txt','w'); 
       elseif j == 12, fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2006/data_input/M12/hyy_mix.txt','w'); end

       if     j == 1,  fid2 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2006/data_input/M01/hyy_swr.txt','w');
       elseif j == 2,  fid2 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2006/data_input/M02/hyy_swr.txt','w');
       elseif j == 3,  fid2 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2006/data_input/M03/hyy_swr.txt','w');
       elseif j == 4,  fid2 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2006/data_input/M04/hyy_swr.txt','w');
       elseif j == 5,  fid2 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2006/data_input/M05/hyy_swr.txt','w');
       elseif j == 6,  fid2 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2006/data_input/M06/hyy_swr.txt','w');
       elseif j == 7,  fid2 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2006/data_input/M07/hyy_swr.txt','w'); 
       elseif j == 8,  fid2 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2006/data_input/M08/hyy_swr.txt','w'); 
       elseif j == 9,  fid2 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2006/data_input/M09/hyy_swr.txt','w'); 
       elseif j == 10, fid2 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2006/data_input/M10/hyy_swr.txt','w'); 
       elseif j == 11, fid2 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2006/data_input/M11/hyy_swr.txt','w'); 
       elseif j == 12, fid2 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2006/data_input/M12/hyy_swr.txt','w'); end

       if     j == 1,  fid3 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2006/data_input/M01/hyy_gas_new.txt','w');
       elseif j == 2,  fid3 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2006/data_input/M02/hyy_gas_new.txt','w');
       elseif j == 3,  fid3 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2006/data_input/M03/hyy_gas_new.txt','w');
       elseif j == 4,  fid3 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2006/data_input/M04/hyy_gas_new.txt','w');
       elseif j == 5,  fid3 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2006/data_input/M05/hyy_gas_new.txt','w');
       elseif j == 6,  fid3 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2006/data_input/M06/hyy_gas_new.txt','w');
       elseif j == 7,  fid3 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2006/data_input/M07/hyy_gas_new.txt','w'); 
       elseif j == 8,  fid3 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2006/data_input/M08/hyy_gas_new.txt','w'); 
       elseif j == 9,  fid3 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2006/data_input/M09/hyy_gas_new.txt','w'); 
       elseif j == 10, fid3 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2006/data_input/M10/hyy_gas_new.txt','w'); 
       elseif j == 11, fid3 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2006/data_input/M11/hyy_gas_new.txt','w'); 
       elseif j == 12, fid3 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2006/data_input/M12/hyy_gas_new.txt','w'); end
    end

    if year == 2005
       if     j == 1,  fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2005/data_input/M01/hyy_mix.txt','w');
       elseif j == 2,  fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2005/data_input/M02/hyy_mix.txt','w');
       elseif j == 3,  fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2005/data_input/M03/hyy_mix.txt','w');
       elseif j == 4,  fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2005/data_input/M04/hyy_mix.txt','w');
       elseif j == 5,  fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2005/data_input/M05/hyy_mix.txt','w');
       elseif j == 6,  fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2005/data_input/M06/hyy_mix.txt','w');
       elseif j == 7,  fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2005/data_input/M07/hyy_mix.txt','w'); 
       elseif j == 8,  fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2005/data_input/M08/hyy_mix.txt','w'); 
       elseif j == 9,  fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2005/data_input/M09/hyy_mix.txt','w'); 
       elseif j == 10, fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2005/data_input/M10/hyy_mix.txt','w'); 
       elseif j == 11, fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2005/data_input/M11/hyy_mix.txt','w'); 
       elseif j == 12, fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2005/data_input/M12/hyy_mix.txt','w'); end

       if     j == 1,  fid2 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2005/data_input/M01/hyy_swr.txt','w');
       elseif j == 2,  fid2 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2005/data_input/M02/hyy_swr.txt','w');
       elseif j == 3,  fid2 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2005/data_input/M03/hyy_swr.txt','w');
       elseif j == 4,  fid2 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2005/data_input/M04/hyy_swr.txt','w');
       elseif j == 5,  fid2 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2005/data_input/M05/hyy_swr.txt','w');
       elseif j == 6,  fid2 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2005/data_input/M06/hyy_swr.txt','w');
       elseif j == 7,  fid2 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2005/data_input/M07/hyy_swr.txt','w'); 
       elseif j == 8,  fid2 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2005/data_input/M08/hyy_swr.txt','w'); 
       elseif j == 9,  fid2 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2005/data_input/M09/hyy_swr.txt','w'); 
       elseif j == 10, fid2 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2005/data_input/M10/hyy_swr.txt','w'); 
       elseif j == 11, fid2 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2005/data_input/M11/hyy_swr.txt','w'); 
       elseif j == 12, fid2 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2005/data_input/M12/hyy_swr.txt','w'); end

       if     j == 1,  fid3 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2005/data_input/M01/hyy_gas_new.txt','w');
       elseif j == 2,  fid3 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2005/data_input/M02/hyy_gas_new.txt','w');
       elseif j == 3,  fid3 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2005/data_input/M03/hyy_gas_new.txt','w');
       elseif j == 4,  fid3 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2005/data_input/M04/hyy_gas_new.txt','w');
       elseif j == 5,  fid3 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2005/data_input/M05/hyy_gas_new.txt','w');
       elseif j == 6,  fid3 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2005/data_input/M06/hyy_gas_new.txt','w');
       elseif j == 7,  fid3 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2005/data_input/M07/hyy_gas_new.txt','w'); 
       elseif j == 8,  fid3 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2005/data_input/M08/hyy_gas_new.txt','w'); 
       elseif j == 9,  fid3 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2005/data_input/M09/hyy_gas_new.txt','w'); 
       elseif j == 10, fid3 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2005/data_input/M10/hyy_gas_new.txt','w'); 
       elseif j == 11, fid3 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2005/data_input/M11/hyy_gas_new.txt','w'); 
       elseif j == 12, fid3 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2005/data_input/M12/hyy_gas_new.txt','w'); end
    end

    if year == 2004
       if     j == 1,  fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2004/data_input/M01/hyy_mix.txt','w');
       elseif j == 2,  fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2004/data_input/M02/hyy_mix.txt','w');
       elseif j == 3,  fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2004/data_input/M03/hyy_mix.txt','w');
       elseif j == 4,  fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2004/data_input/M04/hyy_mix.txt','w');
       elseif j == 5,  fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2004/data_input/M05/hyy_mix.txt','w');
       elseif j == 6,  fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2004/data_input/M06/hyy_mix.txt','w');
       elseif j == 7,  fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2004/data_input/M07/hyy_mix.txt','w'); 
       elseif j == 8,  fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2004/data_input/M08/hyy_mix.txt','w'); 
       elseif j == 9,  fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2004/data_input/M09/hyy_mix.txt','w'); 
       elseif j == 10, fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2004/data_input/M10/hyy_mix.txt','w'); 
       elseif j == 11, fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2004/data_input/M11/hyy_mix.txt','w'); 
       elseif j == 12, fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2004/data_input/M12/hyy_mix.txt','w'); end

       if     j == 1,  fid2 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2004/data_input/M01/hyy_swr.txt','w');
       elseif j == 2,  fid2 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2004/data_input/M02/hyy_swr.txt','w');
       elseif j == 3,  fid2 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2004/data_input/M03/hyy_swr.txt','w');
       elseif j == 4,  fid2 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2004/data_input/M04/hyy_swr.txt','w');
       elseif j == 5,  fid2 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2004/data_input/M05/hyy_swr.txt','w');
       elseif j == 6,  fid2 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2004/data_input/M06/hyy_swr.txt','w');
       elseif j == 7,  fid2 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2004/data_input/M07/hyy_swr.txt','w'); 
       elseif j == 8,  fid2 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2004/data_input/M08/hyy_swr.txt','w'); 
       elseif j == 9,  fid2 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2004/data_input/M09/hyy_swr.txt','w'); 
       elseif j == 10, fid2 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2004/data_input/M10/hyy_swr.txt','w'); 
       elseif j == 11, fid2 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2004/data_input/M11/hyy_swr.txt','w'); 
       elseif j == 12, fid2 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2004/data_input/M12/hyy_swr.txt','w'); end

       if     j == 1,  fid3 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2004/data_input/M01/hyy_gas_new.txt','w');
       elseif j == 2,  fid3 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2004/data_input/M02/hyy_gas_new.txt','w');
       elseif j == 3,  fid3 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2004/data_input/M03/hyy_gas_new.txt','w');
       elseif j == 4,  fid3 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2004/data_input/M04/hyy_gas_new.txt','w');
       elseif j == 5,  fid3 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2004/data_input/M05/hyy_gas_new.txt','w');
       elseif j == 6,  fid3 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2004/data_input/M06/hyy_gas_new.txt','w');
       elseif j == 7,  fid3 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2004/data_input/M07/hyy_gas_new.txt','w'); 
       elseif j == 8,  fid3 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2004/data_input/M08/hyy_gas_new.txt','w'); 
       elseif j == 9,  fid3 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2004/data_input/M09/hyy_gas_new.txt','w'); 
       elseif j == 10, fid3 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2004/data_input/M10/hyy_gas_new.txt','w'); 
       elseif j == 11, fid3 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2004/data_input/M11/hyy_gas_new.txt','w'); 
       elseif j == 12, fid3 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2004/data_input/M12/hyy_gas_new.txt','w'); end
    end

    if year == 2003
       if     j == 1,  fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2003/data_input/M01/hyy_mix.txt','w');
       elseif j == 2,  fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2003/data_input/M02/hyy_mix.txt','w');
       elseif j == 3,  fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2003/data_input/M03/hyy_mix.txt','w');
       elseif j == 4,  fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2003/data_input/M04/hyy_mix.txt','w');
       elseif j == 5,  fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2003/data_input/M05/hyy_mix.txt','w');
       elseif j == 6,  fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2003/data_input/M06/hyy_mix.txt','w');
       elseif j == 7,  fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2003/data_input/M07/hyy_mix.txt','w'); 
       elseif j == 8,  fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2003/data_input/M08/hyy_mix.txt','w'); 
       elseif j == 9,  fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2003/data_input/M09/hyy_mix.txt','w'); 
       elseif j == 10, fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2003/data_input/M10/hyy_mix.txt','w'); 
       elseif j == 11, fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2003/data_input/M11/hyy_mix.txt','w'); 
       elseif j == 12, fid1 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2003/data_input/M12/hyy_mix.txt','w'); end

       if     j == 1,  fid2 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2003/data_input/M01/hyy_swr.txt','w');
       elseif j == 2,  fid2 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2003/data_input/M02/hyy_swr.txt','w');
       elseif j == 3,  fid2 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2003/data_input/M03/hyy_swr.txt','w');
       elseif j == 4,  fid2 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2003/data_input/M04/hyy_swr.txt','w');
       elseif j == 5,  fid2 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2003/data_input/M05/hyy_swr.txt','w');
       elseif j == 6,  fid2 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2003/data_input/M06/hyy_swr.txt','w');
       elseif j == 7,  fid2 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2003/data_input/M07/hyy_swr.txt','w'); 
       elseif j == 8,  fid2 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2003/data_input/M08/hyy_swr.txt','w'); 
       elseif j == 9,  fid2 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2003/data_input/M09/hyy_swr.txt','w'); 
       elseif j == 10, fid2 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2003/data_input/M10/hyy_swr.txt','w'); 
       elseif j == 11, fid2 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2003/data_input/M11/hyy_swr.txt','w'); 
       elseif j == 12, fid2 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2003/data_input/M12/hyy_swr.txt','w'); end

       if     j == 1,  fid3 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2003/data_input/M01/hyy_gas_new.txt','w');
       elseif j == 2,  fid3 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2003/data_input/M02/hyy_gas_new.txt','w');
       elseif j == 3,  fid3 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2003/data_input/M03/hyy_gas_new.txt','w');
       elseif j == 4,  fid3 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2003/data_input/M04/hyy_gas_new.txt','w');
       elseif j == 5,  fid3 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2003/data_input/M05/hyy_gas_new.txt','w');
       elseif j == 6,  fid3 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2003/data_input/M06/hyy_gas_new.txt','w');
       elseif j == 7,  fid3 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2003/data_input/M07/hyy_gas_new.txt','w'); 
       elseif j == 8,  fid3 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2003/data_input/M08/hyy_gas_new.txt','w'); 
       elseif j == 9,  fid3 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2003/data_input/M09/hyy_gas_new.txt','w'); 
       elseif j == 10, fid3 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2003/data_input/M10/hyy_gas_new.txt','w'); 
       elseif j == 11, fid3 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2003/data_input/M11/hyy_gas_new.txt','w'); 
       elseif j == 12, fid3 = fopen('/Users/boy/Documents/Michael/sosa_in/Hyy/year/2003/data_input/M12/hyy_gas_new.txt','w'); end
    end

    for i = (1+day_month(j)*48): (day_month(j+1)*48)
        % Problem with CS-calculations and therefor using direct data from Tuomo
        if year == 2011 || year == 2012 || year == 2013 || year == 2014  
           if mast(i,9) < 60
              cs_hno3(i) = cs_h2so4(i)/1000;
           else
              cs_hno3(i) = cs_h2so4(i)/1000 + cs_h2so4(i)*(mast(i,9)-60)*2.5/1000;
           end
        end
        
        fprintf (fid1, '%15.6f',  h2o(i,1));    % 1 date and time
        
        % No direct and diffuse radiation in 2014
        if year == 2014  
           fprintf (fid1, '%15.6f',  0.5*sun(i,2));    % 2 diffuse global radiation
           fprintf (fid1, '%15.6f',  0.5*sun(i,2));    % 3 direct global radiation
        else
           fprintf (fid1, '%15.6f',  sun(i,8));    % 2 diffuse global radiation
           fprintf (fid1, '%15.6f',  sun(i,9));    % 3 direct global radiation
        end
        
        % Problem with CS-calculations and therefor using direct data from Tuomo for 2011 and 2012
        if year == 2011 || year == 2012 || year == 2013 || year == 2014  
           fprintf (fid1, '%15.6f',  cs_h2so4(i));   % 4 cs - sum of dmps and aps with rh-correction
        else
           fprintf (fid1, '%15.6f',  cs(i,7));     % 4 cs - sum of dmps and aps with rh-correction
        end
        fprintf (fid1, '%15.6f',  flux(i,2));   % 5 u* in m/s
        fprintf (fid1, '%15.6f',  temp(i,2));   % 6 temperature in K at 67.2 m
        fprintf (fid1, '%15.6f',  temp(i,3));   % 7 temperature in K  at 50.4 m
        fprintf (fid1, '%15.6f',  temp(i,4));   % 8 temperature in K  at 33.6 m
        fprintf (fid1, '%15.6f',  temp(i,5));   % 9 temperature in K  at 16.8 m
        fprintf (fid1, '%15.6f',  temp(i,6));   % 10 temperature in K  at 8.4 m
        fprintf (fid1, '%15.6f',  temp(i,7));   % 11 temperature in K  at 4.2 m
        fprintf (fid1, '%15.6f',  h2o(i,2));    % 12 specific humitiy in kg/m3 at 67.2 m
        fprintf (fid1, '%15.6f',  h2o(i,3));    % 13 specific humitiy in kg/m3 at 50.4 m
        fprintf (fid1, '%15.6f',  h2o(i,4));    % 14 specific humitiy in kg/m3 at 33.6 m
        fprintf (fid1, '%15.6f',  h2o(i,5));    % 15 specific humitiy in kg/m3 at 16.8 m
        fprintf (fid1, '%15.6f',  h2o(i,6));    % 16 specific humitiy in kg/m3 at 8.4 m
        fprintf (fid1, '%15.6f',  h2o(i,7));    % 17 specific humitiy in kg/m3 at 4.2 m
        
        % No wind measurements at 74 m in 2014
        if year == 2014 
            fprintf (fid1, '%15.6f',  wsd(i,3));    % 18 ws in m/s at 74 m
        else
            fprintf (fid1, '%15.6f',  wsd(i,2));    % 18 ws in m/s at 74 m
        end
        fprintf (fid1, '%15.6f',  wsd(i,3));    % 19 ws in m/s  at 33.6 m
        fprintf (fid1, '%15.6f',  wsd(i,4));    % 20 ws in m/s  at 16.8 m
        fprintf (fid1, '%15.6f',  wsd(i,5));    % 21 ws in m/s  at 8.4 m
        fprintf (fid1, '%15.6f',  wsd(i,6));    % 22 wd at 33.6 m
        fprintf (fid1, '%15.6f',  wsd(i,7));    % 23 wd at 16.8 m
        % Problem with CS-calculations and therefor using direct data from Tuomo for 2011 and 2012
        if year == 2011 || year == 2012 || year == 2013 || year == 2014  
           fprintf (fid1, '%15.6f',  cs_hno3(i));  % 24 cs - sum of dmps and aps with rh-correction for HNO3
        else
           fprintf (fid1, '%15.6f',  cs(i,10));    % 24 cs - sum of dmps and aps with rh-correction for HNO3
        end
        fprintf (fid1, '%15.6f',  sun(i,2));    % 25 global radiation
        fprintf (fid1, '%15.6f',  sun(i,7));    % 26 par radiation
        fprintf (fid1, '%15.6f',  coa(i,2));    % 27 coa for 1 nm - sum of dmps and aps with rh-correction for HNO3
        
        % No albedo for 2014 
        if year == 2014 
            fprintf (fid1, '%15.6f',  0.2);    % 28 albedo
        else
            fprintf (fid1, '%15.6f',  sun(i,4));    % 28 albedo
        end
        fprintf (fid1, '%15.3f',  flux(i,8));   % 29 = average wind component u m/s
        fprintf (fid1, '%15.3f',  flux(i,9));   % 30 = average wind component v m/s
        fprintf (fid1, '%15.3f',  flux(i,10));  % 31 = average wind component w m/s
        fprintf (fid1, '%15.3f',  flux(i,11));  % 32 = average wind direction degree        
        fprintf (fid1, '\n');  

        fprintf (fid3, '%10.3f',  mast(i,1));     % 1  date
        fprintf (fid3, '%20.5f',  mast(i,2));     % 2  o3 at 6 m in ppb
        if year == 2013
           fprintf (fid3, '%20.5f',  mast(i,3));     % 3  so2 at 6 m in ppb 
        elseif year == 2014
           fprintf (fid3, '%20.5f',  mastB(i,3));    % 3  so2 at 25.2 m in ppb 
        end
        fprintf (fid3, '%20.5f',  mast(i,4));     % 4  no at 6 m in ppb
        fprintf (fid3, '%20.5f',  mast(i,5));     % 5  no2 at 6 m in ppb
        fprintf (fid3, '%20.5f',  mast(i,6));     % 6  co at 6 m in ppb
        fprintf (fid3, '%20.5f',  mast(i,7));     % 7  h2o at 6 m in ppt
        fprintf (fid3, '%25.0f',  mast(i,8));     % 8  Air molecules at 6 m
        fprintf (fid3, '%10.2f',  mast(i,9));     % 9  RH at 6 m
        fprintf (fid3, '%10.2f',  mast(i,10));    % 10 T at 6 m
        fprintf (fid3, '%25.0f',  mast(i,11));    % 11 Pressure
        fprintf (fid3, '%10.2f',  mast(i,12));    % 12 WD at 6 m
        
        fprintf (fid3, '\n');  
       
        for k = 1:swr_y
            fprintf (fid2, '%10.2f',  swr(i,k));  % swr data for 5 nm intervals
        end    
        fprintf (fid2, '\n');  
    end

    % to get 31 days in each month
    for i = (1+day_month(j+1)*48-day_month(j)*48):1488
        fprintf (fid1, '%15.6f',  h2o(day_month(j+1)*48,1));    % 1  date and time
        
        % No direct and diffuse radiation in 2014
        if year == 2014  
           fprintf (fid1, '%15.6f',  0.5*sun(day_month(j+1)*48,2));    % 2  diffuse global radiation
           fprintf (fid1, '%15.6f',  0.5*sun(day_month(j+1)*48,2));    % 3  direct global radiation
        else
           fprintf (fid1, '%15.6f',  sun(day_month(j+1)*48,8));    % 2  diffuse global radiation
           fprintf (fid1, '%15.6f',  sun(day_month(j+1)*48,9));    % 3  direct global radiation
        end           
           
        % Problem with CS-calculations and therefor using direct data from Tuomo for 2011 and 2012
        if year == 2011 || year == 2012 || year == 2013 || year == 2014  
           fprintf (fid1, '%15.6f',  cs_h2so4(day_month(j+1)*48));   % 4 cs - sum of dmps and aps with rh-correction
        else     
           fprintf (fid1, '%15.6f',  cs(day_month(j+1)*48,7));     % 4  cs - sum of dmps and aps with rh-correction
        end
        fprintf (fid1, '%15.6f',  flux(day_month(j+1)*48,2));   % 5  u* in m/s
        fprintf (fid1, '%15.6f',  temp(day_month(j+1)*48,2));   % 6  temperature in K at 67.2 m
        fprintf (fid1, '%15.6f',  temp(day_month(j+1)*48,3));   % 7  temperature in K  at 50.4 m
        fprintf (fid1, '%15.6f',  temp(day_month(j+1)*48,4));   % 8  temperature in K  at 33.6 m
        fprintf (fid1, '%15.6f',  temp(day_month(j+1)*48,5));   % 9  temperature in K  at 16.8 m
        fprintf (fid1, '%15.6f',  temp(day_month(j+1)*48,6));   % 10 temperature in K  at 8.4 m
        fprintf (fid1, '%15.6f',  temp(day_month(j+1)*48,7));   % 11 temperature in K  at 4.2 m
        fprintf (fid1, '%15.6f',  h2o(day_month(j+1)*48,2));    % 12 specific humitiy in kg/m3 at 67.2 m
        fprintf (fid1, '%15.6f',  h2o(day_month(j+1)*48,3));    % 13 specific humitiy in kg/m3 at 50.4 m
        fprintf (fid1, '%15.6f',  h2o(day_month(j+1)*48,4));    % 14 specific humitiy in kg/m3 at 33.6 m
        fprintf (fid1, '%15.6f',  h2o(day_month(j+1)*48,5));    % 15 specific humitiy in kg/m3 at 16.8 m
        fprintf (fid1, '%15.6f',  h2o(day_month(j+1)*48,6));    % 16 specific humitiy in kg/m3 at 8.4 m
        fprintf (fid1, '%15.6f',  h2o(day_month(j+1)*48,7));    % 17 specific humitiy in kg/m3 at 4.2 m

        % No wind measurements at 74 m in 2014
        if year == 2014 
            fprintf (fid1, '%15.6f',  wsd(day_month(j+1)*48,3));    % 18 ws in m/s at 74 m
        else
            fprintf (fid1, '%15.6f',  wsd(day_month(j+1)*48,2));    % 18 ws in m/s at 74 m
        end
        fprintf (fid1, '%15.6f',  wsd(day_month(j+1)*48,3));    % 19 ws in m/s  at 33.6 m
        fprintf (fid1, '%15.6f',  wsd(day_month(j+1)*48,4));    % 20 ws in m/s  at 16.8 m
        fprintf (fid1, '%15.6f',  wsd(day_month(j+1)*48,5));    % 21 ws in m/s  at 8.4 m
        fprintf (fid1, '%15.6f',  wsd(day_month(j+1)*48,6));    % 22 wd at 33.6 m
        fprintf (fid1, '%15.6f',  wsd(day_month(j+1)*48,7));    % 23 wd at 16.8 m        
        % Problem with CS-calculations and therefor using direct data from Tuomo for 2011 and 2012
        if year == 2011 || year == 2012 || year == 2013 || year == 2014  
           fprintf (fid1, '%15.6f',  cs_hno3(day_month(j+1)*48));  % 24 cs - sum of dmps and aps with rh-correction for HNO3
        else
           fprintf (fid1, '%15.6f',  cs(day_month(j+1)*48,10));    % 24 cs - sum of dmps and aps with rh-correction for HNO3
        end
        fprintf (fid1, '%15.6f',  sun(day_month(j+1)*48,2));    % 25 global radiation
        fprintf (fid1, '%15.6f',  sun(day_month(j+1)*48,7));    % 26 par radiation
        fprintf (fid1, '%15.6f',  coa(day_month(j+1)*48,2));    % 27 coa for 1 nm - sum of dmps and aps with rh-correction for HNO3

        % No albedo for 2014 
        if year == 2014 
           fprintf (fid1, '%15.6f',  0.2);    % 28 albedo
        else
           fprintf (fid1, '%15.6f',  sun(day_month(j+1)*48,4));    % 28 albedo
        end
        fprintf (fid1, '%15.3f',  flux(day_month(j+1)*48,8));   % 29 = average wind component u m/s
        fprintf (fid1, '%15.3f',  flux(day_month(j+1)*48,9));   % 30 = average wind component v m/s
        fprintf (fid1, '%15.3f',  flux(day_month(j+1)*48,10));  % 31 = average wind component w m/s
        fprintf (fid1, '%15.3f',  flux(day_month(j+1)*48,11));  % 32 = average wind direction degree        
%        for k = 1:23
%            fprintf (fid1, '%15.6f',  0.00);    % write zero values to file for similar file length
%        end
        fprintf (fid1, '\n');  

        fprintf (fid3, '%10.3f',  mast(day_month(j+1)*48,1));     % 1  date
        fprintf (fid3, '%20.5f',  mast(day_month(j+1)*48,2));     % 2  o3 at 25.2 m in # cm-3

        if year == 2013
           fprintf (fid3, '%20.5f',  mast(day_month(j+1)*48,3));     % 3  so2 at 25.2 m in # cm-3 
        elseif year == 2014
           fprintf (fid3, '%20.5f',  mastB(day_month(j+1)*48,3));     % 3  so2 at 25.2 m in # cm-3 
        end
        fprintf (fid3, '%20.5f',  mast(day_month(j+1)*48,4));     % 4  no at 25.2 m in # cm-3
        fprintf (fid3, '%20.5f',  mast(day_month(j+1)*48,5));     % 5  no2 at 25.2 m in # cm-3
        fprintf (fid3, '%20.5f',  mast(day_month(j+1)*48,6));     % 6  co at 25.2 m in # cm-3
        fprintf (fid3, '%20.5f',  mast(day_month(j+1)*48,7));     % 7  h2o at 25.2 m in # cm-3
        fprintf (fid3, '%25.0f',  mast(day_month(j+1)*48,8));     % 8  Air molecules at 25.2 m
        fprintf (fid3, '%10.2f',  mast(day_month(j+1)*48,9));     % 9  RH at 25.2 m
        fprintf (fid3, '%10.2f',  mast(day_month(j+1)*48,10));    % 10 T at 25.2 m
        fprintf (fid3, '%25.0f',  mast(day_month(j+1)*48,11));    % 11 Pressure
        fprintf (fid3, '%10.2f',  mast(day_month(j+1)*48,12));    % 12 WD at 25.2 m
%        fprintf (fid3, '%10.3f',  0.00);    % write zero values to file for similar file length
%        for k = 1:5
%            fprintf (fid3, '%20.0f',  0.00);    % write zero values to file for similar file length
%        end
%        fprintf (fid3, '%25.0f',  0.00);    % write zero values to file for similar file length
%        fprintf (fid3, '%25.0f',  0.00);    % write zero values to file for similar file length
%        fprintf (fid3, '%10.2f',  0.00);    % write zero values to file for similar file length
%        fprintf (fid3, '%10.2f',  0.00);    % write zero values to file for similar file length
%        fprintf (fid3, '%25.0f',  0.00);    % write zero values to file for similar file length
%        fprintf (fid3, '%10.2f',  0.00);    % write zero values to file for similar file length
        fprintf (fid3, '\n');  

        for k = 1:swr_y
            fprintf (fid2, '%10.2f',  swr(day_month(j+1)*48,k));  % swr data for 5 nm intervals
%            fprintf (fid2, '%10.2f',  0.00);    % write zero values to file for similar file length
        end
        fprintf (fid2, '\n');  
    end
end   