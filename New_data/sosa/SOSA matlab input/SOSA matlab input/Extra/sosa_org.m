clear all

year = 2007;

day_month_03 = [0 31 59 90 120 151 181 212 243 273 304 334];
day_month_04 = [0 31 60 91 121 152 182 213 244 274 305 335];

if year == 2006 || year == 2007
   for j = 1:365, for i = 1:48, time_new(i+j*48-48) = j + i/48 - 1/48 + 1/96; end, end
   day_month = day_month_03;
elseif year == 2008
   for j = 1:366, for i = 1:48, time_new(i+j*48-48) = j + i/48 - 1/48 + 1/96; end, end
   day_month = day_month_04;
end    
    
%19 fuer 2006 und 11 fuer 2007
    


for m = 3:3  % 1 = 4m, 2 = 14m, 3 = 22m
    if year == 2006, kend = 19; end
    if year == 2007, kend = 33; end
    if year == 2008 && m == 1, kend = 17; end
    if year == 2008 && m == 2, kend = 11; end
    if year == 2008 && m == 3, kend = 11; end
    
    i1 = 0;
    for k = 1:kend 
        if year == 2006
           if m == 1 & k == 1,  org = load('c:/michael/campaigns/sa_hyytiala_3/data_orginal/organics/C_ppbp1060612.dat'); end
           if m == 1 & k == 2,  org = load('c:/michael/campaigns/sa_hyytiala_3/data_orginal/organics/C_ppbp1060622.dat'); end
           if m == 1 & k == 3,  org = load('c:/michael/campaigns/sa_hyytiala_3/data_orginal/organics/C_ppbp1060627.dat'); end
           if m == 1 & k == 4,  org = load('c:/michael/campaigns/sa_hyytiala_3/data_orginal/organics/C_ppbp1060705.dat'); end
           if m == 1 & k == 5,  org = load('c:/michael/campaigns/sa_hyytiala_3/data_orginal/organics/C_ppbp1060714.dat'); end
           if m == 1 & k == 6,  org = load('c:/michael/campaigns/sa_hyytiala_3/data_orginal/organics/C_ppbp1060719.dat'); end
           if m == 1 & k == 7,  org = load('c:/michael/campaigns/sa_hyytiala_3/data_orginal/organics/C_ppbp1060727.dat'); end
           if m == 1 & k == 8,  org = load('c:/michael/campaigns/sa_hyytiala_3/data_orginal/organics/C_ppbp1060804.dat'); end
           if m == 1 & k == 9,  org = load('c:/michael/campaigns/sa_hyytiala_3/data_orginal/organics/C_ppbp1060807.dat'); end
           if m == 1 & k == 10, org = load('c:/michael/campaigns/sa_hyytiala_3/data_orginal/organics/C_ppbp1060816.dat'); end
           if m == 1 & k == 11, org = load('c:/michael/campaigns/sa_hyytiala_3/data_orginal/organics/C_ppbp1060823.dat'); end
           if m == 1 & k == 12, org = load('c:/michael/campaigns/sa_hyytiala_3/data_orginal/organics/C_ppbp1060831.dat'); end
           if m == 1 & k == 13, org = load('c:/michael/campaigns/sa_hyytiala_3/data_orginal/organics/C_ppbp1060907.dat'); end
           if m == 1 & k == 14, org = load('c:/michael/campaigns/sa_hyytiala_3/data_orginal/organics/C_ppbp1060914.dat'); end
           if m == 1 & k == 15, org = load('c:/michael/campaigns/sa_hyytiala_3/data_orginal/organics/C_ppbp1060921.dat'); end
           if m == 1 & k == 16, org = load('c:/michael/campaigns/sa_hyytiala_3/data_orginal/organics/C_ppbp1061123.dat'); end
           if m == 1 & k == 17, org = load('c:/michael/campaigns/sa_hyytiala_3/data_orginal/organics/C_ppbp1061129.dat'); end
           if m == 1 & k == 18, org = load('c:/michael/campaigns/sa_hyytiala_3/data_orginal/organics/C_ppbp1061204.dat'); end
           if m == 1 & k == 19, org = load('c:/michael/campaigns/sa_hyytiala_3/data_orginal/organics/C_ppbp1061214.dat'); end

           if m == 2 & k == 1,  org = load('c:/michael/campaigns/sa_hyytiala_3/data_orginal/organics/C_ppbp4060612.dat'); end
           if m == 2 & k == 2,  org = load('c:/michael/campaigns/sa_hyytiala_3/data_orginal/organics/C_ppbp4060622.dat'); end
           if m == 2 & k == 3,  org = load('c:/michael/campaigns/sa_hyytiala_3/data_orginal/organics/C_ppbp4060627.dat'); end
           if m == 2 & k == 4,  org = load('c:/michael/campaigns/sa_hyytiala_3/data_orginal/organics/C_ppbp4060705.dat'); end
           if m == 2 & k == 5,  org = load('c:/michael/campaigns/sa_hyytiala_3/data_orginal/organics/C_ppbp4060714.dat'); end
           if m == 2 & k == 6,  org = load('c:/michael/campaigns/sa_hyytiala_3/data_orginal/organics/C_ppbp4060719.dat'); end
           if m == 2 & k == 7,  org = load('c:/michael/campaigns/sa_hyytiala_3/data_orginal/organics/C_ppbp4060727.dat'); end
           if m == 2 & k == 8,  org = load('c:/michael/campaigns/sa_hyytiala_3/data_orginal/organics/C_ppbp4060804.dat'); end
           if m == 2 & k == 9,  org = load('c:/michael/campaigns/sa_hyytiala_3/data_orginal/organics/C_ppbp4060807.dat'); end
           if m == 2 & k == 10, org = load('c:/michael/campaigns/sa_hyytiala_3/data_orginal/organics/C_ppbp4060816.dat'); end
           if m == 2 & k == 11, org = load('c:/michael/campaigns/sa_hyytiala_3/data_orginal/organics/C_ppbp4060823.dat'); end
           if m == 2 & k == 12, org = load('c:/michael/campaigns/sa_hyytiala_3/data_orginal/organics/C_ppbp4060831.dat'); end
           if m == 2 & k == 13, org = load('c:/michael/campaigns/sa_hyytiala_3/data_orginal/organics/C_ppbp4060907.dat'); end
           if m == 2 & k == 14, org = load('c:/michael/campaigns/sa_hyytiala_3/data_orginal/organics/C_ppbp4060914.dat'); end
           if m == 2 & k == 15, org = load('c:/michael/campaigns/sa_hyytiala_3/data_orginal/organics/C_ppbp4060921.dat'); end
           if m == 2 & k == 16, org = load('c:/michael/campaigns/sa_hyytiala_3/data_orginal/organics/C_ppbp4061123.dat'); end
           if m == 2 & k == 17, org = load('c:/michael/campaigns/sa_hyytiala_3/data_orginal/organics/C_ppbp4061129.dat'); end
           if m == 2 & k == 18, org = load('c:/michael/campaigns/sa_hyytiala_3/data_orginal/organics/C_ppbp4061204.dat'); end
           if m == 2 & k == 19, org = load('c:/michael/campaigns/sa_hyytiala_3/data_orginal/organics/C_ppbp4061214.dat'); end

           if m == 3 & k == 1,  org = load('c:/michael/campaigns/sa_hyytiala_3/data_orginal/organics/C_ppbp5060612.dat'); end
           if m == 3 & k == 2,  org = load('c:/michael/campaigns/sa_hyytiala_3/data_orginal/organics/C_ppbp5060622.dat'); end
           if m == 3 & k == 3,  org = load('c:/michael/campaigns/sa_hyytiala_3/data_orginal/organics/C_ppbp5060627.dat'); end
           if m == 3 & k == 4,  org = load('c:/michael/campaigns/sa_hyytiala_3/data_orginal/organics/C_ppbp5060705.dat'); end
           if m == 3 & k == 5,  org = load('c:/michael/campaigns/sa_hyytiala_3/data_orginal/organics/C_ppbp5060714.dat'); end
           if m == 3 & k == 6,  org = load('c:/michael/campaigns/sa_hyytiala_3/data_orginal/organics/C_ppbp5060719.dat'); end
           if m == 3 & k == 7,  org = load('c:/michael/campaigns/sa_hyytiala_3/data_orginal/organics/C_ppbp5060727.dat'); end
           if m == 3 & k == 8,  org = load('c:/michael/campaigns/sa_hyytiala_3/data_orginal/organics/C_ppbp5060804.dat'); end
           if m == 3 & k == 9,  org = load('c:/michael/campaigns/sa_hyytiala_3/data_orginal/organics/C_ppbp5060807.dat'); end
           if m == 3 & k == 10, org = load('c:/michael/campaigns/sa_hyytiala_3/data_orginal/organics/C_ppbp5060816.dat'); end
           if m == 3 & k == 11, org = load('c:/michael/campaigns/sa_hyytiala_3/data_orginal/organics/C_ppbp5060823.dat'); end
           if m == 3 & k == 12, org = load('c:/michael/campaigns/sa_hyytiala_3/data_orginal/organics/C_ppbp5060831.dat'); end
           if m == 3 & k == 13, org = load('c:/michael/campaigns/sa_hyytiala_3/data_orginal/organics/C_ppbp5060907.dat'); end
           if m == 3 & k == 14, org = load('c:/michael/campaigns/sa_hyytiala_3/data_orginal/organics/C_ppbp5060914.dat'); end
           if m == 3 & k == 15, org = load('c:/michael/campaigns/sa_hyytiala_3/data_orginal/organics/C_ppbp5060921.dat'); end
           if m == 3 & k == 16, org = load('c:/michael/campaigns/sa_hyytiala_3/data_orginal/organics/C_ppbp5061123.dat'); end
           if m == 3 & k == 17, org = load('c:/michael/campaigns/sa_hyytiala_3/data_orginal/organics/C_ppbp5061129.dat'); end
           if m == 3 & k == 18, org = load('c:/michael/campaigns/sa_hyytiala_3/data_orginal/organics/C_ppbp5061204.dat'); end
           if m == 3 & k == 19, org = load('c:/michael/campaigns/sa_hyytiala_3/data_orginal/organics/C_ppbp5061214.dat'); end
        end
        if year == 2007
           if m == 1 & k == 1,  org = load('c:/michael/campaigns/sa_hyytiala_3/data_orginal/organics/C_ppbp1070101.dat'); end
           if m == 1 & k == 2,  org = load('c:/michael/campaigns/sa_hyytiala_3/data_orginal/organics/C_ppbp1070104.dat'); end
           if m == 1 & k == 3,  org = load('c:/michael/campaigns/sa_hyytiala_3/data_orginal/organics/C_ppbp1070111.dat'); end
           if m == 1 & k == 4,  org = load('c:/michael/campaigns/sa_hyytiala_3/data_orginal/organics/C_ppbp1070118.dat'); end
           if m == 1 & k == 5,  org = load('c:/michael/campaigns/sa_hyytiala_3/data_orginal/organics/C_ppbp1070124.dat'); end
           if m == 1 & k == 6,  org = load('c:/michael/campaigns/sa_hyytiala_3/data_orginal/organics/C_ppbp1070131.dat'); end
           if m == 1 & k == 7,  org = load('c:/michael/campaigns/sa_hyytiala_3/data_orginal/organics/C_ppbp1070212.dat'); end
           if m == 1 & k == 8,  org = load('c:/michael/campaigns/sa_hyytiala_3/data_orginal/organics/C_ppbp1070301.dat'); end
           if m == 1 & k == 9,  org = load('c:/michael/campaigns/sa_hyytiala_3/data_orginal/organics/C_ppbp1070314.dat'); end
           if m == 1 & k == 10, org = load('c:/michael/campaigns/sa_hyytiala_3/data_orginal/organics/C_ppbp1070323.dat'); end
           if m == 1 & k == 11, org = load('c:/michael/campaigns/sa_hyytiala_3/data_orginal/organics/C_ppbp1070327.dat'); end
           if m == 1 & k == 12, org = load('c:/michael/campaigns/sa_hyytiala_3/data_orginal/organics/C_ppbp1070403.dat'); end
           if m == 1 & k == 13, org = load('c:/michael/campaigns/sa_hyytiala_3/data_orginal/organics/C_ppbp1070413.dat'); end
           if m == 1 & k == 14, org = load('c:/michael/campaigns/sa_hyytiala_3/data_orginal/organics/C_ppbp1070418.dat'); end
           if m == 1 & k == 15, org = load('c:/michael/campaigns/sa_hyytiala_3/data_orginal/organics/C_ppbp1070426.dat'); end
           if m == 1 & k == 16, org = load('c:/michael/campaigns/sa_hyytiala_3/data_orginal/organics/C_ppbp1070509.dat'); end
           if m == 1 & k == 17, org = load('c:/michael/campaigns/sa_hyytiala_3/data_orginal/organics/C_ppbp1070515.dat'); end
           if m == 1 & k == 18, org = load('c:/michael/campaigns/sa_hyytiala_3/data_orginal/organics/C_ppbp1070524.dat'); end
           if m == 1 & k == 19, org = load('c:/michael/campaigns/sa_hyytiala_3/data_orginal/organics/C_ppbp1070605.dat'); end
           if m == 1 & k == 20, org = load('c:/michael/campaigns/sa_hyytiala_3/data_orginal/organics/C_ppbp1070612.dat'); end
           if m == 1 & k == 21, org = load('c:/michael/campaigns/sa_hyytiala_3/data_orginal/organics/C_ppbp1070619.dat'); end
           if m == 1 & k == 22, org = load('c:/michael/campaigns/sa_hyytiala_3/data_orginal/organics/C_ppbp1070628.dat'); end
           if m == 1 & k == 23, org = load('c:/michael/campaigns/sa_hyytiala_3/data_orginal/organics/C_ppbp1070703.dat'); end
           if m == 1 & k == 24, org = load('c:/michael/campaigns/sa_hyytiala_3/data_orginal/organics/C_ppbp1070711.dat'); end
           if m == 1 & k == 25, org = load('c:/michael/campaigns/sa_hyytiala_3/data_orginal/organics/C_ppbp1070717.dat'); end
           if m == 1 & k == 26, org = load('c:/michael/campaigns/sa_hyytiala_3/data_orginal/organics/C_ppbp1070724.dat'); end
           if m == 1 & k == 27, org = load('c:/michael/campaigns/sa_hyytiala_3/data_orginal/organics/C_ppbp1070731.dat'); end
           if m == 1 & k == 28, org = load('c:/michael/campaigns/sa_hyytiala_3/data_orginal/organics/C_ppbp1070808.dat'); end
           if m == 1 & k == 29, org = load('c:/michael/campaigns/sa_hyytiala_3/data_orginal/organics/C_ppbp1070815.dat'); end
           if m == 1 & k == 30, org = load('c:/michael/campaigns/sa_hyytiala_3/data_orginal/organics/C_ppbp1070821.dat'); end
           if m == 1 & k == 31, org = load('c:/michael/campaigns/sa_hyytiala_3/data_orginal/organics/C_ppbp1070828.dat'); end
           if m == 1 & k == 32, org = load('c:/michael/campaigns/sa_hyytiala_3/data_orginal/organics/C_ppbp1070912.dat'); end
           if m == 1 & k == 33, org = load('c:/michael/campaigns/sa_hyytiala_3/data_orginal/organics/C_ppbp1070918.dat'); end
           
           if m == 2 & k == 1,  org = load('c:/michael/campaigns/sa_hyytiala_3/data_orginal/organics/C_ppbp4070101.dat'); end
           if m == 2 & k == 2,  org = load('c:/michael/campaigns/sa_hyytiala_3/data_orginal/organics/C_ppbp4070104.dat'); end
           if m == 2 & k == 3,  org = load('c:/michael/campaigns/sa_hyytiala_3/data_orginal/organics/C_ppbp4070111.dat'); end
           if m == 2 & k == 4,  org = load('c:/michael/campaigns/sa_hyytiala_3/data_orginal/organics/C_ppbp4070118.dat'); end
           if m == 2 & k == 5,  org = load('c:/michael/campaigns/sa_hyytiala_3/data_orginal/organics/C_ppbp4070124.dat'); end
           if m == 2 & k == 6,  org = load('c:/michael/campaigns/sa_hyytiala_3/data_orginal/organics/C_ppbp4070131.dat'); end
           if m == 2 & k == 7,  org = load('c:/michael/campaigns/sa_hyytiala_3/data_orginal/organics/C_ppbp4070212.dat'); end
           if m == 2 & k == 8,  org = load('c:/michael/campaigns/sa_hyytiala_3/data_orginal/organics/C_ppbp4070301.dat'); end
           if m == 2 & k == 9,  org = load('c:/michael/campaigns/sa_hyytiala_3/data_orginal/organics/C_ppbp4070314.dat'); end
           if m == 2 & k == 10, org = load('c:/michael/campaigns/sa_hyytiala_3/data_orginal/organics/C_ppbp4070323.dat'); end
           if m == 2 & k == 11, org = load('c:/michael/campaigns/sa_hyytiala_3/data_orginal/organics/C_ppbp4070327.dat'); end
           if m == 2 & k == 12, org = load('c:/michael/campaigns/sa_hyytiala_3/data_orginal/organics/C_ppbp4070403.dat'); end
           if m == 2 & k == 13, org = load('c:/michael/campaigns/sa_hyytiala_3/data_orginal/organics/C_ppbp4070413.dat'); end
           if m == 2 & k == 14, org = load('c:/michael/campaigns/sa_hyytiala_3/data_orginal/organics/C_ppbp4070418.dat'); end
           if m == 2 & k == 15, org = load('c:/michael/campaigns/sa_hyytiala_3/data_orginal/organics/C_ppbp4070426.dat'); end
           if m == 2 & k == 16, org = load('c:/michael/campaigns/sa_hyytiala_3/data_orginal/organics/C_ppbp4070509.dat'); end
           if m == 2 & k == 17, org = load('c:/michael/campaigns/sa_hyytiala_3/data_orginal/organics/C_ppbp4070515.dat'); end
           if m == 2 & k == 18, org = load('c:/michael/campaigns/sa_hyytiala_3/data_orginal/organics/C_ppbp4070524.dat'); end
           if m == 2 & k == 19, org = load('c:/michael/campaigns/sa_hyytiala_3/data_orginal/organics/C_ppbp4070605.dat'); end
           if m == 2 & k == 20, org = load('c:/michael/campaigns/sa_hyytiala_3/data_orginal/organics/C_ppbp4070612.dat'); end
           if m == 2 & k == 21, org = load('c:/michael/campaigns/sa_hyytiala_3/data_orginal/organics/C_ppbp4070619.dat'); end
           if m == 2 & k == 22, org = load('c:/michael/campaigns/sa_hyytiala_3/data_orginal/organics/C_ppbp4070628.dat'); end
           if m == 2 & k == 23, org = load('c:/michael/campaigns/sa_hyytiala_3/data_orginal/organics/C_ppbp4070703.dat'); end
           if m == 2 & k == 24, org = load('c:/michael/campaigns/sa_hyytiala_3/data_orginal/organics/C_ppbp4070711.dat'); end
           if m == 2 & k == 25, org = load('c:/michael/campaigns/sa_hyytiala_3/data_orginal/organics/C_ppbp4070717.dat'); end
           if m == 2 & k == 26, org = load('c:/michael/campaigns/sa_hyytiala_3/data_orginal/organics/C_ppbp4070724.dat'); end
           if m == 2 & k == 27, org = load('c:/michael/campaigns/sa_hyytiala_3/data_orginal/organics/C_ppbp4070731.dat'); end
           if m == 2 & k == 28, org = load('c:/michael/campaigns/sa_hyytiala_3/data_orginal/organics/C_ppbp4070808.dat'); end
           if m == 2 & k == 29, org = load('c:/michael/campaigns/sa_hyytiala_3/data_orginal/organics/C_ppbp4070815.dat'); end
           if m == 2 & k == 30, org = load('c:/michael/campaigns/sa_hyytiala_3/data_orginal/organics/C_ppbp4070821.dat'); end
           if m == 2 & k == 31, org = load('c:/michael/campaigns/sa_hyytiala_3/data_orginal/organics/C_ppbp4070828.dat'); end
           if m == 2 & k == 32, org = load('c:/michael/campaigns/sa_hyytiala_3/data_orginal/organics/C_ppbp4070912.dat'); end
           if m == 2 & k == 33, org = load('c:/michael/campaigns/sa_hyytiala_3/data_orginal/organics/C_ppbp4070918.dat'); end

           if m == 3 & k == 1,  org = load('c:/michael/campaigns/sa_hyytiala_3/data_orginal/organics/C_ppbp5070101.dat'); end
           if m == 3 & k == 2,  org = load('c:/michael/campaigns/sa_hyytiala_3/data_orginal/organics/C_ppbp5070104.dat'); end
           if m == 3 & k == 3,  org = load('c:/michael/campaigns/sa_hyytiala_3/data_orginal/organics/C_ppbp5070111.dat'); end
           if m == 3 & k == 4,  org = load('c:/michael/campaigns/sa_hyytiala_3/data_orginal/organics/C_ppbp5070118.dat'); end
           if m == 3 & k == 5,  org = load('c:/michael/campaigns/sa_hyytiala_3/data_orginal/organics/C_ppbp5070124.dat'); end
           if m == 3 & k == 6,  org = load('c:/michael/campaigns/sa_hyytiala_3/data_orginal/organics/C_ppbp5070131.dat'); end
           if m == 3 & k == 7,  org = load('c:/michael/campaigns/sa_hyytiala_3/data_orginal/organics/C_ppbp5070212.dat'); end
           if m == 3 & k == 8,  org = load('c:/michael/campaigns/sa_hyytiala_3/data_orginal/organics/C_ppbp5070301.dat'); end
           if m == 3 & k == 9,  org = load('c:/michael/campaigns/sa_hyytiala_3/data_orginal/organics/C_ppbp5070314.dat'); end
           if m == 3 & k == 10, org = load('c:/michael/campaigns/sa_hyytiala_3/data_orginal/organics/C_ppbp5070323.dat'); end
           if m == 3 & k == 11, org = load('c:/michael/campaigns/sa_hyytiala_3/data_orginal/organics/C_ppbp5070327.dat'); end
           if m == 3 & k == 12, org = load('c:/michael/campaigns/sa_hyytiala_3/data_orginal/organics/C_ppbp5070403.dat'); end
           if m == 3 & k == 13, org = load('c:/michael/campaigns/sa_hyytiala_3/data_orginal/organics/C_ppbp5070413.dat'); end
           if m == 3 & k == 14, org = load('c:/michael/campaigns/sa_hyytiala_3/data_orginal/organics/C_ppbp5070418.dat'); end
           if m == 3 & k == 15, org = load('c:/michael/campaigns/sa_hyytiala_3/data_orginal/organics/C_ppbp5070426.dat'); end
           if m == 3 & k == 16, org = load('c:/michael/campaigns/sa_hyytiala_3/data_orginal/organics/C_ppbp5070509.dat'); end
           if m == 3 & k == 17, org = load('c:/michael/campaigns/sa_hyytiala_3/data_orginal/organics/C_ppbp5070515.dat'); end
           if m == 3 & k == 18, org = load('c:/michael/campaigns/sa_hyytiala_3/data_orginal/organics/C_ppbp5070524.dat'); end
           if m == 3 & k == 19, org = load('c:/michael/campaigns/sa_hyytiala_3/data_orginal/organics/C_ppbp5070605.dat'); end
           if m == 3 & k == 20, org = load('c:/michael/campaigns/sa_hyytiala_3/data_orginal/organics/C_ppbp5070612.dat'); end
           if m == 3 & k == 21, org = load('c:/michael/campaigns/sa_hyytiala_3/data_orginal/organics/C_ppbp5070619.dat'); end
           if m == 3 & k == 22, org = load('c:/michael/campaigns/sa_hyytiala_3/data_orginal/organics/C_ppbp5070628.dat'); end
           if m == 3 & k == 23, org = load('c:/michael/campaigns/sa_hyytiala_3/data_orginal/organics/C_ppbp5070703.dat'); end
           if m == 3 & k == 24, org = load('c:/michael/campaigns/sa_hyytiala_3/data_orginal/organics/C_ppbp5070711.dat'); end
           if m == 3 & k == 25, org = load('c:/michael/campaigns/sa_hyytiala_3/data_orginal/organics/C_ppbp5070717.dat'); end
           if m == 3 & k == 26, org = load('c:/michael/campaigns/sa_hyytiala_3/data_orginal/organics/C_ppbp5070724.dat'); end
           if m == 3 & k == 27, org = load('c:/michael/campaigns/sa_hyytiala_3/data_orginal/organics/C_ppbp5070731.dat'); end
           if m == 3 & k == 28, org = load('c:/michael/campaigns/sa_hyytiala_3/data_orginal/organics/C_ppbp5070808.dat'); end
           if m == 3 & k == 29, org = load('c:/michael/campaigns/sa_hyytiala_3/data_orginal/organics/C_ppbp5070815.dat'); end
           if m == 3 & k == 30, org = load('c:/michael/campaigns/sa_hyytiala_3/data_orginal/organics/C_ppbp5070821.dat'); end
           if m == 3 & k == 31, org = load('c:/michael/campaigns/sa_hyytiala_3/data_orginal/organics/C_ppbp5070828.dat'); end
           if m == 3 & k == 32, org = load('c:/michael/campaigns/sa_hyytiala_3/data_orginal/organics/C_ppbp5070912.dat'); end
           if m == 3 & k == 33, org = load('c:/michael/campaigns/sa_hyytiala_3/data_orginal/organics/C_ppbp5070918.dat'); end
        end
         
        if year == 2008
           if m == 1 & k == 1,  org = load('c:/michael/campaigns/sa_hyytiala_3/data_orginal/organics/vmr_p1080506.dat'); end
           if m == 1 & k == 2,  org = load('c:/michael/campaigns/sa_hyytiala_3/data_orginal/organics/vmr_p1080515.dat'); end
           if m == 1 & k == 3,  org = load('c:/michael/campaigns/sa_hyytiala_3/data_orginal/organics/vmr_p1080521.dat'); end
           if m == 1 & k == 4,  org = load('c:/michael/campaigns/sa_hyytiala_3/data_orginal/organics/vmr_p1080530.dat'); end
           if m == 1 & k == 5,  org = load('c:/michael/campaigns/sa_hyytiala_3/data_orginal/organics/vmr_p1080604.dat'); end
           if m == 1 & k == 6,  org = load('c:/michael/campaigns/sa_hyytiala_3/data_orginal/organics/vmr_p1080611.dat'); end
           if m == 1 & k == 7,  org = load('c:/michael/campaigns/sa_hyytiala_3/data_orginal/organics/vmr_p1080626.dat'); end
           if m == 1 & k == 8,  org = load('c:/michael/campaigns/sa_hyytiala_3/data_orginal/organics/vmr_p1080708.dat'); end
           if m == 1 & k == 9,  org = load('c:/michael/campaigns/sa_hyytiala_3/data_orginal/organics/vmr_p1080716.dat'); end
           if m == 1 & k == 10, org = load('c:/michael/campaigns/sa_hyytiala_3/data_orginal/organics/vmr_p1080723.dat'); end
           if m == 1 & k == 11, org = load('c:/michael/campaigns/sa_hyytiala_3/data_orginal/organics/vmr_p1080731.dat'); end
           if m == 1 & k == 12, org = load('c:/michael/campaigns/sa_hyytiala_3/data_orginal/organics/vmr_p1080813.dat'); end
           if m == 1 & k == 13, org = load('c:/michael/campaigns/sa_hyytiala_3/data_orginal/organics/vmr_p1080814.dat'); end
           if m == 1 & k == 14, org = load('c:/michael/campaigns/sa_hyytiala_3/data_orginal/organics/vmr_p1080818.dat'); end
           if m == 1 & k == 15, org = load('c:/michael/campaigns/sa_hyytiala_3/data_orginal/organics/vmr_p1080820.dat'); end
           if m == 1 & k == 16, org = load('c:/michael/campaigns/sa_hyytiala_3/data_orginal/organics/vmr_p1080822.dat'); end
           if m == 1 & k == 17, org = load('c:/michael/campaigns/sa_hyytiala_3/data_orginal/organics/vmr_p1080828.dat'); end

           if m == 2 & k == 1,  org = load('c:/michael/campaigns/sa_hyytiala_3/data_orginal/organics/vmr_p4080506.dat'); end
           if m == 2 & k == 2,  org = load('c:/michael/campaigns/sa_hyytiala_3/data_orginal/organics/vmr_p4080515.dat'); end
           if m == 2 & k == 3,  org = load('c:/michael/campaigns/sa_hyytiala_3/data_orginal/organics/vmr_p4080521.dat'); end
           if m == 2 & k == 4,  org = load('c:/michael/campaigns/sa_hyytiala_3/data_orginal/organics/vmr_p4080530.dat'); end
           if m == 2 & k == 5,  org = load('c:/michael/campaigns/sa_hyytiala_3/data_orginal/organics/vmr_p4080604.dat'); end
           if m == 2 & k == 6,  org = load('c:/michael/campaigns/sa_hyytiala_3/data_orginal/organics/vmr_p4080611.dat'); end
           if m == 2 & k == 7,  org = load('c:/michael/campaigns/sa_hyytiala_3/data_orginal/organics/vmr_p4080626.dat'); end
           if m == 2 & k == 8,  org = load('c:/michael/campaigns/sa_hyytiala_3/data_orginal/organics/vmr_p4080708.dat'); end
           if m == 2 & k == 9,  org = load('c:/michael/campaigns/sa_hyytiala_3/data_orginal/organics/vmr_p4080716.dat'); end
           if m == 2 & k == 10, org = load('c:/michael/campaigns/sa_hyytiala_3/data_orginal/organics/vmr_p4080723.dat'); end
           if m == 2 & k == 11, org = load('c:/michael/campaigns/sa_hyytiala_3/data_orginal/organics/vmr_p4080731.dat'); end
        
           if m == 3 & k == 1, org = load('c:/michael/campaigns/sa_hyytiala_3/data_orginal/organics/vmr_p5080506.dat'); end
           if m == 3 & k == 2, org = load('c:/michael/campaigns/sa_hyytiala_3/data_orginal/organics/vmr_p5080515.dat'); end
           if m == 3 & k == 3, org = load('c:/michael/campaigns/sa_hyytiala_3/data_orginal/organics/vmr_p5080521.dat'); end
           if m == 3 & k == 4, org = load('c:/michael/campaigns/sa_hyytiala_3/data_orginal/organics/vmr_p5080530.dat'); end
           if m == 3 & k == 5, org = load('c:/michael/campaigns/sa_hyytiala_3/data_orginal/organics/vmr_p5080604.dat'); end
           if m == 3 & k == 6, org = load('c:/michael/campaigns/sa_hyytiala_3/data_orginal/organics/vmr_p5080611.dat'); end
           if m == 3 & k == 7, org = load('c:/michael/campaigns/sa_hyytiala_3/data_orginal/organics/vmr_p5080626.dat'); end
           if m == 3 & k == 8, org = load('c:/michael/campaigns/sa_hyytiala_3/data_orginal/organics/vmr_p5080708.dat'); end
           if m == 3 & k == 9, org = load('c:/michael/campaigns/sa_hyytiala_3/data_orginal/organics/vmr_p5080716.dat'); end
           if m == 3 & k == 10, org = load('c:/michael/campaigns/sa_hyytiala_3/data_orginal/organics/vmr_p5080723.dat'); end
           if m == 3 & k == 11, org = load('c:/michael/campaigns/sa_hyytiala_3/data_orginal/organics/vmr_p5080731.dat'); end
        end
        [num(k) dumi] = size(org);
    
        %unpack data file
        for j = 2:num(k)
            i1=i1+1;
            month(i1)  = org(j,2);
            day(i1)    = org(j,3);
            hour(i1)   = org(j,4);
            min(i1)    = org(j,5);
            sec        = org(j,6);
            time(i1)   = day_month(month(i1)) + day(i1) + hour(i1)/24 + min(i1)/24/60 + sec/24/60/60;
            if year == 2006 || year == 2007 && k < 10
               for c = 1:11, gas(i1,c) = org(j,c+6); end
               gas(i1,12) = NaN; 
            elseif year == 2007 && k > 9
               gas(i1,1) = org(j,7);
               for c = 2:11, gas(i1,c) = org(j,c+7); end
               gas(i1,12) = org(j,8); 
            elseif year == 2008
               for c = 1:27, gas(i1,c) = org(j,c+15); end
            end
        end
    end

    [len nrl] = size(gas); k = 1; n = 1;
    for i2 = 1:len-1
        if hour(i2) == hour(i2+1)
           timea(k) = time(i2);
           for c = 1:nrl
               gasa(k,c) = gas(i2,c);
           end
           k = k+1;
        else
           time_av(n) = mean(timea(:));
           for c = 1:nrl
               gas_av(n,c) = mean(gasa(:,c));
           end
           k = 1; n = n+1;
           clear timea gasa
        end
    end

    % gas-files contain for the different years
    % 2006 and 2007     2008  
    % 1  = M33          1  = M31
    % 2  = M45          2  = M33  (methanol) 
    % 3  = M59          3  = M42  
    % 4  = M69          4  = M45  (acetaldehyde) 
    % 5  = M71          5  = M47  
    % 6  = M73          6  = M59  (acetone)
    % 7  = M79          7  = M61  
    % 8  = M81          8  = M69  (isoprene) 
    % 9  = M93          9  = M71  
    % 10 = M101         10 = M73  
    % 11 = M137         11 = M79  (benzene ?) 
    % 12 = M42          12 = M81  (monoterpene) 
    %                   13 = M83 
    %                   14 = M85  
    %                   15 = M87  
    %                   16 = M93  (toluene ?) 
    %                   17 = M99 
    %                   18 = M101  
    %                   19 = M103  
    %                   20 = M113  
    %                   21 = M137  (monoterpene) 
    %                   22 = M141  
    %                   23 = M153  
    %                   24 = M155  
    %                   25 = M169  
    %                   26 = M205  (sesquiterpene) 
    %                   27 = M263

    
    
    for c = 1:nrl
        gas_new(:,c)  = interp1(time_av(:), gas_av(:,c), time_new, 'linear');
    end

    for c = 1:nrl
        %for j = 1:7
        %    gas_new(j,c) = gas_new(8,c);
        %end
        %for j = length(gas_new)-5:length(gas_new)
        %    gas_new(j,c) = gas_new(length(gas_new)-6,c);
        %end
        for j = 1:length(gas_new)
            if gas_new(j,c) < 0
               gas_new(j,c) = 0.01;
            end
        end
    end
    
    figure(1)
    clf
    subplot(211)
    hold on
    if year == 2006 || year == 2007
       plot(time_new, gas_new(:,1), 'm-')
       plot(time_new, gas_new(:,2), 'r-')
       plot(time_new, gas_new(:,3), 'g-')
       plot(time_new, gas_new(:,4), 'c-')
    elseif year == 2008
       plot(time_new, gas_new(:,2), 'm-')
       plot(time_new, gas_new(:,4), 'r-')
       plot(time_new, gas_new(:,6), 'g-')
       plot(time_new, gas_new(:,8), 'c-')
    end
    Y = ylabel('Mixing ratio [ppbv]'); set(Y, 'FontSize',[14])
    legend('M = 33 (methanol)', 'M = 45 (acetaldehyde)', 'M = 59 (acetone)', 'M = 69 (isoprene)');
    
    subplot(212)
    hold on
    if year == 2006 || year == 2007
       plot(time_new, gas_new(:,7),  'm-')
       plot(time_new, gas_new(:,8),  'r-')
       plot(time_new, gas_new(:,9),  'g-')
       plot(time_new, gas_new(:,11), 'b-')
       legend('M = 79 (benzene ?)', 'M = 81 (monoterpene)', 'M = 93 (toluene ?)', 'M = 137 (monoterpene)');
    elseif year == 2008
       plot(time_new, gas_new(:,11), 'm-')
       plot(time_new, gas_new(:,12), 'r-')
       plot(time_new, gas_new(:,16), 'g-')
       plot(time_new, gas_new(:,21), 'b-')
       plot(time_new, gas_new(:,26), 'k-')
       legend('M = 79 (benzene ?)', 'M = 81 (monoterpene)', 'M = 93 (toluene ?)', 'M = 137 (monoterpene)', 'M = 205 (sesquiterpene)');
    end       
    Y = ylabel('Mixing ratio [ppbv]'); set(Y, 'FontSize',[14])
    if year == 2006
       H = xlabel('Date [Day since 1^s^t of January 2006]'); set(H, 'FontSize',[14])
    elseif year == 2007
       H = xlabel('Date [Day since 1^s^t of January 2007]'); set(H, 'FontSize',[14])
    elseif year == 2008
       H = xlabel('Date [Day since 1^s^t of January 2008]'); set(H, 'FontSize',[14])
    end
    
    savepar = 1; 
    if savepar == 1
       if year == 2006
          if m == 1,     fid = fopen('c:/michael/sosa_in/year/2006/data_measured/org_4m.txt','w');
          elseif m == 2, fid = fopen('c:/michael/sosa_in/year/2006/data_measured/org_14m.txt','w');
          elseif m == 3, fid = fopen('c:/michael/sosa_in/year/2006/data_measured/org_22m.txt','w');  end
       elseif year == 2007
          if m == 1,     fid = fopen('c:/michael/sosa_in/year/2007/data_measured/org_4m.txt','w');
          elseif m == 2, fid = fopen('c:/michael/sosa_in/year/2007/data_measured/org_14m.txt','w');
          elseif m == 3, fid = fopen('c:/michael/sosa_in/year/2007/data_measured/org_22m.txt','w');  end
       elseif year == 2008
          if m == 1,     fid = fopen('c:/michael/sosa_in/year/2008/data_measured/org_4m.txt','w');
          elseif m == 2, fid = fopen('c:/michael/sosa_in/year/2008/data_measured/org_14m.txt','w');
          elseif m == 3, fid = fopen('c:/michael/sosa_in/year/2008/data_measured/org_22m.txt','w');  end
       end
       for j = 1:length(time_new)
           fprintf (fid, '%12.6f',  time_new(j));      
           if year == 2006 || year == 2007
              fprintf (fid, '%20.8f',  gas_new(j,1));  
              fprintf (fid, '%20.8f',  gas_new(j,12));  
              for c = 2:11
                  fprintf (fid, '%20.8f',  gas_new(j,c));  
              end
           elseif year == 2008
              for c = 1:nrl
                  fprintf (fid, '%20.8f',  gas_new(j,c));  
              end
           end
           fprintf (fid, '\n'); 
       end
    end


    figure(2)
    clf
    hold on
    plot(time, gas(:,8), 'r--')
    plot(time_new, gas_new(:,8), 'r-')
    plot(time, gas(:,11), 'b--')
    plot(time_new, gas_new(:,11), 'b-')
    L = legend('M = 81 (measured)', 'M = 81 (interpolated)', 'M = 137 (measured)', 'M = 137 (interpolated)'); set(L, 'fontsize', [12])
    Y = ylabel('Mixing ratio [ppbv]'); set(Y, 'FontSize',[14])
    H = xlabel('Date [Day since 1^s^t of January 2007]'); set(H, 'FontSize',[14])


    for j = 1:length(time_new)
        for c = 1:7
            ratio(j,c) = gas_new(j,c) / (gas_new(j,8)+gas_new(j,11)) * 2 ;
        end
        ratio(j,8) = gas_new(j,9) / (gas_new(j,8)+gas_new(j,11)) * 2 ;
        ratio(j,9) = gas_new(j,10) / (gas_new(j,8)+gas_new(j,11)) * 2 ;
    end

    figure(3)
    clf
    subplot(211)
    hold on
    plot(time_new, ratio(:,1), 'm-')
    plot(time_new, ratio(:,2), 'r-')
    plot(time_new, ratio(:,3), 'g-')
    plot(time_new, ratio(:,4), 'c-')
    plot(time_new, ratio(:,5), 'b-')
    plot(time_new, ratio(:,6), 'k-')
    legend('M = 33 (methanol)', 'M = 45 (acetaldehyde)', 'M = 59 (acetone)', 'M = 69 (isoprene)', 'M = 71', 'M = 73');
    Y = ylabel('Ratio of xxx / monoterpene'); set(Y, 'FontSize',[14])
    H = xlabel('Date [Day since 1^s^t of January 2007]'); set(H, 'FontSize',[14])

    subplot(212)
    hold on
    plot(time_new, ratio(:,7), 'm-')
    plot(time_new, ratio(:,8), 'g-')
    plot(time_new, ratio(:,9), 'c-')
    legend('M = 79 (benzene ?)', 'M = 93 (toluene ?)', 'M = 101');
    Y = ylabel('Ratio of xxx / monoterpene'); set(Y, 'FontSize',[14])
    H = xlabel('Date [Day since 1^s^t of January 2007]'); set(H, 'FontSize',[14])
    
    clear gas_new time hour time_av gas_av
end

