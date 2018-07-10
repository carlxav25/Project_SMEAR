clear all

year = '2011';
Year = eval(year);

iii = 0;
for j = 1:12
    if j == 1,         border = load(['c://HY-data//BOY//documents//sosa_in/year/',year,'/data_input//M01//border.txt']);
       elseif j == 2,  border = load(['c://HY-data//BOY//documents//sosa_in/year/',year,'/data_input//M02//border.txt']);
       elseif j == 3,  border = load(['c://HY-data//BOY//documents//sosa_in/year/',year,'/data_input//M03//border.txt']);
       elseif j == 4,  border = load(['c://HY-data//BOY//documents//sosa_in/year/',year,'/data_input//M04//border.txt']);
       elseif j == 5,  border = load(['c://HY-data//BOY//documents//sosa_in/year/',year,'/data_input//M05//border.txt']);
       elseif j == 6,  border = load(['c://HY-data//BOY//documents//sosa_in/year/',year,'/data_input//M06//border.txt']);
       elseif j == 7,  border = load(['c://HY-data//BOY//documents//sosa_in/year/',year,'/data_input//M07//border.txt']); 
       elseif j == 8,  border = load(['c://HY-data//BOY//documents//sosa_in/year/',year,'/data_input//M08//border.txt']); 
       elseif j == 9,  border = load(['c://HY-data//BOY//documents//sosa_in/year/',year,'/data_input//M09//border.txt']); 
       elseif j == 10, border = load(['c://HY-data//BOY//documents//sosa_in/year/',year,'/data_input//M10//border.txt']); 
       elseif j == 11, border = load(['c://HY-data//BOY//documents//sosa_in/year/',year,'/data_input//M11//border.txt']); 
       elseif j == 12, border = load(['c://HY-data//BOY//documents//sosa_in/year/',year,'/data_input//M12//border.txt']); 
    end

    for i = 1:length(border)-1
        for k = 1:5
            border_all(i+iii,k) = border(i,k);
        end
    end
    iii  = iii + length(border)-1;
    clear border
end

% temperature values of zero are interpolated
j = 1;
for i = 1:length(border_all)
    time(i) = i/4 - 1/4 +1;

    border_all(i,6) = border_all(i,1);
    if border_all(i,1) > 0
       border_new(j) = border_all(i,1);
       time_new(j) = time(i);
       j = j+1;
    end
end
border_all(:,1) = interp1(time_new, border_new, time, 'linear');
clear time_new border_new

% temperature gradient values below 0.3 are interpolated
if Year == 2006
   j = 1;
   for i = 1:length(border_all)
       border_all(i,7) = border_all(i,5);
       if border_all(i,5) > -0.3
          border_new(j) = border_all(i,5);
          time_new(j) = time(i);
          j = j+1;
       end
   end
   border_all(:,5) = interp1(time_new, border_new, time, 'linear');
   clear time_new border_new
end

figure(1)
clf
subplot(511)
hold on
plot(time, border_all(:,1))
plot(time, border_all(:,6),'b--')
L = legend('Temperature [K]');
set(L, 'fontsize', [14]);
subplot(512)
plot(time, border_all(:,2))
L = legend('Wind speed u [m s^-^1]');
set(L, 'fontsize', [14]);
subplot(513)
plot(time, border_all(:,3))
L = legend('Wind speed v [m s^-^1]');
set(L, 'fontsize', [14]);
subplot(514)
plot(time, border_all(:,4))
L = legend('Absolute humitidy [g kg^-^1');
set(L, 'fontsize', [14]);
subplot(515)
hold on
plot(time, border_all(:,5))
plot(time, border_all(:,7),'b--')
L = legend('Temperature gradient [K]');
set(L, 'fontsize', [14]);


if Year == 2004 || Year == 2008 || Year == 2012
   day_month = [0 31 60 91 121 152 182 213 244 274 305 335 366];
else
   day_month = [0 31 59 90 120 151 181 212 243 273 304 334 365];
end
break
for j = 1:12
    if Year == 2011
       if j == 1,         fid = fopen('c://HY-data//BOY//documents//sosa_in/year/2011/data_input//M01//border_new.txt','w');
          elseif j == 2,  fid = fopen('c://HY-data//BOY//documents//sosa_in/year/2011/data_input//M02//border_new.txt','w');
          elseif j == 3,  fid = fopen('c://HY-data//BOY//documents//sosa_in/year/2011/data_input//M03//border_new.txt','w');
          elseif j == 4,  fid = fopen('c://HY-data//BOY//documents//sosa_in/year/2011/data_input//M04//border_new.txt','w');
          elseif j == 5,  fid = fopen('c://HY-data//BOY//documents//sosa_in/year/2011/data_input//M05//border_new.txt','w');
          elseif j == 6,  fid = fopen('c://HY-data//BOY//documents//sosa_in/year/2011/data_input//M06//border_new.txt','w');
          elseif j == 7,  fid = fopen('c://HY-data//BOY//documents//sosa_in/year/2011/data_input//M07//border_new.txt','w'); 
          elseif j == 8,  fid = fopen('c://HY-data//BOY//documents//sosa_in/year/2011/data_input//M08//border_new.txt','w'); 
          elseif j == 9,  fid = fopen('c://HY-data//BOY//documents//sosa_in/year/2011/data_input//M09//border_new.txt','w'); 
          elseif j == 10, fid = fopen('c://HY-data//BOY//documents//sosa_in/year/2011/data_input//M10//border_new.txt','w'); 
          elseif j == 11, fid = fopen('c://HY-data//BOY//documents//sosa_in/year/2011/data_input//M11//border_new.txt','w'); 
          elseif j == 12, fid = fopen('c://HY-data//BOY//documents//sosa_in/year/2011/data_input//M12//border_new.txt','w'); 
       end
    end
    if Year == 2010
       if j == 1,         fid = fopen('c://HY-data//BOY//documents//sosa_in/year/2010/data_input//M01//border_new.txt','w');
          elseif j == 2,  fid = fopen('c://HY-data//BOY//documents//sosa_in/year/2010/data_input//M02//border_new.txt','w');
          elseif j == 3,  fid = fopen('c://HY-data//BOY//documents//sosa_in/year/2010/data_input//M03//border_new.txt','w');
          elseif j == 4,  fid = fopen('c://HY-data//BOY//documents//sosa_in/year/2010/data_input//M04//border_new.txt','w');
          elseif j == 5,  fid = fopen('c://HY-data//BOY//documents//sosa_in/year/2010/data_input//M05//border_new.txt','w');
          elseif j == 6,  fid = fopen('c://HY-data//BOY//documents//sosa_in/year/2010/data_input//M06//border_new.txt','w');
          elseif j == 7,  fid = fopen('c://HY-data//BOY//documents//sosa_in/year/2010/data_input//M07//border_new.txt','w'); 
          elseif j == 8,  fid = fopen('c://HY-data//BOY//documents//sosa_in/year/2010/data_input//M08//border_new.txt','w'); 
          elseif j == 9,  fid = fopen('c://HY-data//BOY//documents//sosa_in/year/2010/data_input//M09//border_new.txt','w'); 
          elseif j == 10, fid = fopen('c://HY-data//BOY//documents//sosa_in/year/2010/data_input//M10//border_new.txt','w'); 
          elseif j == 11, fid = fopen('c://HY-data//BOY//documents//sosa_in/year/2010/data_input//M11//border_new.txt','w'); 
          elseif j == 12, fid = fopen('c://HY-data//BOY//documents//sosa_in/year/2010/data_input//M12//border_new.txt','w'); 
       end
    end
    if Year == 2009
       if j == 1,         fid = fopen('c://HY-data//BOY//documents//sosa_in/year/2009/data_input//M01//border_new.txt','w');
          elseif j == 2,  fid = fopen('c://HY-data//BOY//documents//sosa_in/year/2009/data_input//M02//border_new.txt','w');
          elseif j == 3,  fid = fopen('c://HY-data//BOY//documents//sosa_in/year/2009/data_input//M03//border_new.txt','w');
          elseif j == 4,  fid = fopen('c://HY-data//BOY//documents//sosa_in/year/2009/data_input//M04//border_new.txt','w');
          elseif j == 5,  fid = fopen('c://HY-data//BOY//documents//sosa_in/year/2009/data_input//M05//border_new.txt','w');
          elseif j == 6,  fid = fopen('c://HY-data//BOY//documents//sosa_in/year/2009/data_input//M06//border_new.txt','w');
          elseif j == 7,  fid = fopen('c://HY-data//BOY//documents//sosa_in/year/2009/data_input//M07//border_new.txt','w'); 
          elseif j == 8,  fid = fopen('c://HY-data//BOY//documents//sosa_in/year/2009/data_input//M08//border_new.txt','w'); 
          elseif j == 9,  fid = fopen('c://HY-data//BOY//documents//sosa_in/year/2009/data_input//M09//border_new.txt','w'); 
          elseif j == 10, fid = fopen('c://HY-data//BOY//documents//sosa_in/year/2009/data_input//M10//border_new.txt','w'); 
          elseif j == 11, fid = fopen('c://HY-data//BOY//documents//sosa_in/year/2009/data_input//M11//border_new.txt','w'); 
          elseif j == 12, fid = fopen('c://HY-data//BOY//documents//sosa_in/year/2009/data_input//M12//border_new.txt','w'); 
       end
    end
    if Year == 2008
       if j == 1,         fid = fopen('c://HY-data//BOY//documents//sosa_in/year/2008/data_input//M01//border_new.txt','w');
          elseif j == 2,  fid = fopen('c://HY-data//BOY//documents//sosa_in/year/2008/data_input//M02//border_new.txt','w');
          elseif j == 3,  fid = fopen('c://HY-data//BOY//documents//sosa_in/year/2008/data_input//M03//border_new.txt','w');
          elseif j == 4,  fid = fopen('c://HY-data//BOY//documents//sosa_in/year/2008/data_input//M04//border_new.txt','w');
          elseif j == 5,  fid = fopen('c://HY-data//BOY//documents//sosa_in/year/2008/data_input//M05//border_new.txt','w');
          elseif j == 6,  fid = fopen('c://HY-data//BOY//documents//sosa_in/year/2008/data_input//M06//border_new.txt','w');
          elseif j == 7,  fid = fopen('c://HY-data//BOY//documents//sosa_in/year/2008/data_input//M07//border_new.txt','w'); 
          elseif j == 8,  fid = fopen('c://HY-data//BOY//documents//sosa_in/year/2008/data_input//M08//border_new.txt','w'); 
          elseif j == 9,  fid = fopen('c://HY-data//BOY//documents//sosa_in/year/2008/data_input//M09//border_new.txt','w'); 
          elseif j == 10, fid = fopen('c://HY-data//BOY//documents//sosa_in/year/2008/data_input//M10//border_new.txt','w'); 
          elseif j == 11, fid = fopen('c://HY-data//BOY//documents//sosa_in/year/2008/data_input//M11//border_new.txt','w'); 
          elseif j == 12, fid = fopen('c://HY-data//BOY//documents//sosa_in/year/2008/data_input//M12//border_new.txt','w'); 
       end
    end
    if Year == 2007
       if j == 1,         fid = fopen('c://HY-data//BOY//documents//sosa_in/year/2007/data_input//M01//border_new.txt','w');
          elseif j == 2,  fid = fopen('c://HY-data//BOY//documents//sosa_in/year/2007/data_input//M02//border_new.txt','w');
          elseif j == 3,  fid = fopen('c://HY-data//BOY//documents//sosa_in/year/2007/data_input//M03//border_new.txt','w');
          elseif j == 4,  fid = fopen('c://HY-data//BOY//documents//sosa_in/year/2007/data_input//M04//border_new.txt','w');
          elseif j == 5,  fid = fopen('c://HY-data//BOY//documents//sosa_in/year/2007/data_input//M05//border_new.txt','w');
          elseif j == 6,  fid = fopen('c://HY-data//BOY//documents//sosa_in/year/2007/data_input//M06//border_new.txt','w');
          elseif j == 7,  fid = fopen('c://HY-data//BOY//documents//sosa_in/year/2007/data_input//M07//border_new.txt','w'); 
          elseif j == 8,  fid = fopen('c://HY-data//BOY//documents//sosa_in/year/2007/data_input//M08//border_new.txt','w'); 
          elseif j == 9,  fid = fopen('c://HY-data//BOY//documents//sosa_in/year/2007/data_input//M09//border_new.txt','w'); 
          elseif j == 10, fid = fopen('c://HY-data//BOY//documents//sosa_in/year/2007/data_input//M10//border_new.txt','w'); 
          elseif j == 11, fid = fopen('c://HY-data//BOY//documents//sosa_in/year/2007/data_input//M11//border_new.txt','w'); 
          elseif j == 12, fid = fopen('c://HY-data//BOY//documents//sosa_in/year/2007/data_input//M12//border_new.txt','w'); 
       end
    end
    if Year == 2006
       if j == 1,         fid = fopen('c://HY-data//BOY//documents//sosa_in/year/2006/data_input//M01//border_new.txt','w');
          elseif j == 2,  fid = fopen('c://HY-data//BOY//documents//sosa_in/year/2006/data_input//M02//border_new.txt','w');
          elseif j == 3,  fid = fopen('c://HY-data//BOY//documents//sosa_in/year/2006/data_input//M03//border_new.txt','w');
          elseif j == 4,  fid = fopen('c://HY-data//BOY//documents//sosa_in/year/2006/data_input//M04//border_new.txt','w');
          elseif j == 5,  fid = fopen('c://HY-data//BOY//documents//sosa_in/year/2006/data_input//M05//border_new.txt','w');
          elseif j == 6,  fid = fopen('c://HY-data//BOY//documents//sosa_in/year/2006/data_input//M06//border_new.txt','w');
          elseif j == 7,  fid = fopen('c://HY-data//BOY//documents//sosa_in/year/2006/data_input//M07//border_new.txt','w'); 
          elseif j == 8,  fid = fopen('c://HY-data//BOY//documents//sosa_in/year/2006/data_input//M08//border_new.txt','w'); 
          elseif j == 9,  fid = fopen('c://HY-data//BOY//documents//sosa_in/year/2006/data_input//M09//border_new.txt','w'); 
          elseif j == 10, fid = fopen('c://HY-data//BOY//documents//sosa_in/year/2006/data_input//M10//border_new.txt','w'); 
          elseif j == 11, fid = fopen('c://HY-data//BOY//documents//sosa_in/year/2006/data_input//M11//border_new.txt','w'); 
          elseif j == 12, fid = fopen('c://HY-data//BOY//documents//sosa_in/year/2006/data_input//M12//border_new.txt','w'); 
       end
    end
    if Year == 2005
       if j == 1,         fid = fopen('c://HY-data//BOY//documents//sosa_in/year/2005/data_input//M01//border_new.txt','w');
          elseif j == 2,  fid = fopen('c://HY-data//BOY//documents//sosa_in/year/2005/data_input//M02//border_new.txt','w');
          elseif j == 3,  fid = fopen('c://HY-data//BOY//documents//sosa_in/year/2005/data_input//M03//border_new.txt','w');
          elseif j == 4,  fid = fopen('c://HY-data//BOY//documents//sosa_in/year/2005/data_input//M04//border_new.txt','w');
          elseif j == 5,  fid = fopen('c://HY-data//BOY//documents//sosa_in/year/2005/data_input//M05//border_new.txt','w');
          elseif j == 6,  fid = fopen('c://HY-data//BOY//documents//sosa_in/year/2005/data_input//M06//border_new.txt','w');
          elseif j == 7,  fid = fopen('c://HY-data//BOY//documents//sosa_in/year/2005/data_input//M07//border_new.txt','w'); 
          elseif j == 8,  fid = fopen('c://HY-data//BOY//documents//sosa_in/year/2005/data_input//M08//border_new.txt','w'); 
          elseif j == 9,  fid = fopen('c://HY-data//BOY//documents//sosa_in/year/2005/data_input//M09//border_new.txt','w'); 
          elseif j == 10, fid = fopen('c://HY-data//BOY//documents//sosa_in/year/2005/data_input//M10//border_new.txt','w'); 
          elseif j == 11, fid = fopen('c://HY-data//BOY//documents//sosa_in/year/2005/data_input//M11//border_new.txt','w'); 
          elseif j == 12, fid = fopen('c://HY-data//BOY//documents//sosa_in/year/2005/data_input//M12//border_new.txt','w'); 
       end
    end
    if Year == 2004
       if j == 1,         fid = fopen('c://HY-data//BOY//documents//sosa_in/year/2004/data_input//M01//border_new.txt','w');
          elseif j == 2,  fid = fopen('c://HY-data//BOY//documents//sosa_in/year/2004/data_input//M02//border_new.txt','w');
          elseif j == 3,  fid = fopen('c://HY-data//BOY//documents//sosa_in/year/2004/data_input//M03//border_new.txt','w');
          elseif j == 4,  fid = fopen('c://HY-data//BOY//documents//sosa_in/year/2004/data_input//M04//border_new.txt','w');
          elseif j == 5,  fid = fopen('c://HY-data//BOY//documents//sosa_in/year/2004/data_input//M05//border_new.txt','w');
          elseif j == 6,  fid = fopen('c://HY-data//BOY//documents//sosa_in/year/2004/data_input//M06//border_new.txt','w');
          elseif j == 7,  fid = fopen('c://HY-data//BOY//documents//sosa_in/year/2004/data_input//M07//border_new.txt','w'); 
          elseif j == 8,  fid = fopen('c://HY-data//BOY//documents//sosa_in/year/2004/data_input//M08//border_new.txt','w'); 
          elseif j == 9,  fid = fopen('c://HY-data//BOY//documents//sosa_in/year/2004/data_input//M09//border_new.txt','w'); 
          elseif j == 10, fid = fopen('c://HY-data//BOY//documents//sosa_in/year/2004/data_input//M10//border_new.txt','w'); 
          elseif j == 11, fid = fopen('c://HY-data//BOY//documents//sosa_in/year/2004/data_input//M11//border_new.txt','w'); 
          elseif j == 12, fid = fopen('c://HY-data//BOY//documents//sosa_in/year/2004/data_input//M12//border_new.txt','w'); 
       end
    end
    if Year == 2003
       if j == 1,         fid = fopen('c://HY-data//BOY//documents//sosa_in/year/2003/data_input//M01//border_new.txt','w');
          elseif j == 2,  fid = fopen('c://HY-data//BOY//documents//sosa_in/year/2003/data_input//M02//border_new.txt','w');
          elseif j == 3,  fid = fopen('c://HY-data//BOY//documents//sosa_in/year/2003/data_input//M03//border_new.txt','w');
          elseif j == 4,  fid = fopen('c://HY-data//BOY//documents//sosa_in/year/2003/data_input//M04//border_new.txt','w');
          elseif j == 5,  fid = fopen('c://HY-data//BOY//documents//sosa_in/year/2003/data_input//M05//border_new.txt','w');
          elseif j == 6,  fid = fopen('c://HY-data//BOY//documents//sosa_in/year/2003/data_input//M06//border_new.txt','w');
          elseif j == 7,  fid = fopen('c://HY-data//BOY//documents//sosa_in/year/2003/data_input//M07//border_new.txt','w'); 
          elseif j == 8,  fid = fopen('c://HY-data//BOY//documents//sosa_in/year/2003/data_input//M08//border_new.txt','w'); 
          elseif j == 9,  fid = fopen('c://HY-data//BOY//documents//sosa_in/year/2003/data_input//M09//border_new.txt','w'); 
          elseif j == 10, fid = fopen('c://HY-data//BOY//documents//sosa_in/year/2003/data_input//M10//border_new.txt','w'); 
          elseif j == 11, fid = fopen('c://HY-data//BOY//documents//sosa_in/year/2003/data_input//M11//border_new.txt','w'); 
          elseif j == 12, fid = fopen('c://HY-data//BOY//documents//sosa_in/year/2003/data_input//M12//border_new.txt','w'); 
       end
    end
    
    if j < 12
       for i = (1+day_month(j)*4): (day_month(j+1)*4+1)
           fprintf (fid, '%20.8f',  border_all(i,1));
           fprintf (fid, '%20.8f',  border_all(i,2));
           fprintf (fid, '%20.8f',  border_all(i,3));
           fprintf (fid, '%20.8f',  border_all(i,4));
           fprintf (fid, '%20.8f',  border_all(i,5));
           fprintf (fid, '%20.8f',  time(i));
           fprintf (fid, '\n');
        end    
    else
       for i = (1+day_month(j)*4): (day_month(j+1)*4)
           fprintf (fid, '%20.8f',  border_all(i,1));
           fprintf (fid, '%20.8f',  border_all(i,2));
           fprintf (fid, '%20.8f',  border_all(i,3));
           fprintf (fid, '%20.8f',  border_all(i,4));
           fprintf (fid, '%20.8f',  border_all(i,5));
           fprintf (fid, '%20.8f',  time(i));
           fprintf (fid, '\n');
        end    
        fprintf (fid, '%20.8f',  border_all(length(border_all),1));
        fprintf (fid, '%20.8f',  border_all(length(border_all),2));
        fprintf (fid, '%20.8f',  border_all(length(border_all),3));
        fprintf (fid, '%20.8f',  border_all(length(border_all),4));
        fprintf (fid, '%20.8f',  border_all(length(border_all),5));
        fprintf (fid, '%20.8f',  time(i)+1/4);
        fprintf (fid, '\n');
    end
end