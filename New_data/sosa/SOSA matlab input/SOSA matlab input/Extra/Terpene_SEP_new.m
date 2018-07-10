clear all

% This code calculates standard emission potentials for each day and
% different terpenes by using measured terpene conc. for the distribution
% of the monoterpenes amd Hannele SEP

% Distribution of monoterpenes from measurements of concentrations based on 2003-2005
%for j = 1:12
%    for i = 1:22
%        MonDis(j,i) = 100;
%    end
%end
%MonDis(:,3)  = [ 0.00    0.00    0.00    0.00    0.00    0.00    0.00    0.00    0.00    0.00    0.00    0.00]; % Myrcene
%MonDis(:,4)  = [ 0.00    0.00    0.00    0.00    0.00    0.69    4.97    5.10    1.57    0.00    0.00    0.00]; % Sabinene
%MonDis(:,5)  = [ 4.94    8.96    5.89   10.39    5.18    1.51    2.19    2.32    2.01    1.76    1.03    1.05]; % Limonene
%MonDis(:,6)  = [22.52   23.25   20.32   18.81   23.67   22.08   28.46   23.38   26.58   27.06   25.73   26.12]; % Carene
%MonDis(:,7)  = [ 0.00    0.00    0.00    0.00    0.00    0.00    0.00    0.00    0.00    0.00    0.00    0.00]; % Ocimenes
%MonDis(:,8)  = [ 5.71    5.56   11.08    6.03    5.07    6.26    7.23    8.08    6.43    4.90    6.60    5.88]; % Beta-pinene
%MonDis(:,9)  = [62.49   59.92   58.97   59.02   59.81   60.64   50.49   55.87   55.73   60.03   63.76   65.04]; % Alpha-pinene
%MonDis(:,18) = [ 4.34    2.32    3.73    5.75    6.27    8.83    6.67    5.25    7.68    6.25    2.89    1.90]; % Other monoterpenes (from Campehene)


% Standard emission potentials from Hakola et al., Biogeosciences, 3, 2006
% in ng / g(needledryweight / h
%                       April     Mai        June      July      August    September October
%MBO A                   58   (8)  67  (23)   33  (11)  28   (7)  16   (3)  21  (13)  16   (8)
%MBO B                   14  (16)  52  (20)  126  (39)  56  (19)  26   (5)  27   (7)  14  (15)
%1,8-Cineol A             2   (4)  44  (12)   45  (18)  66  (18)  19   (7)   1   (1)   1   (2)
%1,8-Cineol B             5   (5)  30  (11)   35  (14)  71  (20)  18   (4)   0   (0)   0   (0)
%linalool A               4   (7)   0   (0)    0   (0)  64  (31)   2   (3)   0   (0)   0   (0)
%linalool B               7   (9)   0   (0)    0   (0)  14  (10)   2   (3)   0   (0)   0   (0)
%3-Carene A             314 (141) 896 (395)  905 (904) 572 (152) 306  (98) 176  (86) 188  (89)
%3-Carene B             752 (289) 910 (380) 1132 (640) 863 (404) 322 (152) 196 (106) 619 (375)
%other monoterpenes A   141  (54) 263  (96)  360 (236) 266  (89) 136  (42)  69  (29)  84  (77)
%other monoterpenes B   369 (171) 282  (82)  295 (132) 243  (62) 142  (55) 129 (112) 404 (227)
%caryophyllene A          9  (17)   3   (4)  139  (79) 385 (112)  56  (23)   9  (12)   0   (0)
%caryophyllene B          5  (11)  28  (47)   33  (24) 127  (35)  28  (16)  12  (10)  38  (77)
%other sesquiterpenes A   0   (0)   0   (0)   26  (40)  92  (19)  23  (11)   6  (11)   0   (0)
%other sesquiterpenes B   0   (0)   5   (9)    4   (6)  32  (16)  14   (7)   7   (7)  15  (31)

% new version in the order of the new megan code

% Month:      04   05   06   07   08   09   10   01     04
%Ter(:,1)  = [100  100  100  100  100  100  100  100  100]; % IsopB - Virpi Tarvainen et al., Tellus 2007 
%Ter(:,1)  = [141  263  360  266  136   69   84  84   141]; % MonoA
%Ter(:,2)  = [369  282  295  243  142  129  404  404  369]; % MonoB
%Ter(:,3)  = [314  896  905  572  306  176  188  188  314]; % CareA
%Ter(:,4)  = [752  910 1132  863  322  196  619  619  752]; % CareB
%Ter(:,5)  = [  2   44   45   66   19    1    1    1    2]; % Cin_A
%Ter(:,6)  = [  5   30   35   71   18    0    0    0    5]; % Cin_B
%Ter(:,7)  = [  4    0    0   64    2    0    0    0    4]; % Lin_A
%Ter(:,8)  = [  7    0    0   14    2    0    0    0    7]; % Lin_B
%Ter(:,9)  = [ 58   67   33   28   16   21   16   16   58]; % MBO_A
%Ter(:,10) = [ 14   52  126   56   26   27   14   14   14]; % MBO_B
%Ter(:,11) = [  9    3  139  385   56    9    0    0    9]; % BCarA
%Ter(:,12) = [  5   28   33  127   28   12   38   38    5]; % BCarB
%Ter(:,14) = [  0    5    4   32   14    7   15   15    0]; % OSecA
%Ter(:,14) = [  0    5    4   32   14    7   15   15    0]; % OSecB

%Org_SEp_old(:,1)  = [100  100  100  100   100   100   100   100   100   100   100  100];         % Isoprene
%Org_SEp_old(:,2)  = [500  500  500  788  1175/1.5  1346/2   972/2   453   285   648   500  500]; % Myrcene
%Org_SEp_old(:,3)  = [500  500  500  788  1175/1.5  1346/2   972/2   453   285   648   500  500]; % Sabinene
%Org_SEp_old(:,4)  = [500  500  500  788  1175/1.5  1346/2   972/2   453   285   648   500  500]; % Limonene
%Org_SEp_old(:,5)  = [500  500  500  788  1175/1.5  1346/2   972/2   453   285   648   500  500]; % Carene
%Org_SEp_old(:,6)  = [500  500  500  788  1175/1.5  1346/2   972/2   453   285   648   500  500]; % Ocimene
%Org_SEp_old(:,7)  = [500  500  500  788  1175/1.5  1346/2   972/2   453   285   648   500  500]; % Beta-pinene
%Org_SEp_old(:,8)  = [500  500  500  788  1175/1.5  1346/2   972/2   453   285   648   500  500]; % Alpha-pinene
%Org_SEp_old(:,9)  = [500  500  500  788  1175/1.5  1346/2   972/2   453   285   648   500  500]; % Other monoterpenes
%Org_SEp_old(:,10) = [  0    0    0    0     0     0     0     0     0     0     0    0];         % Farnese
%Org_SEp_old(:,11) = [  5    5    5    7    16    86   256    42    11    19     5    5];         % Beta-carophyllene
%Org_SEp_old(:,12) = [  0    0    0    0     3     2    16     7     4     8     0    0];         % Other sesquiterpenes
%Org_SEp_old(:,13) = [ 12   12   12   36    60    78    42    21    24    15    12   12];         % MBO
%Org_SEp_old(:,14) = [  0    0    0    0     0     0     0     0     0     0     0    0];         % CH3OH (Methanol)
%Org_SEp_old(:,15) = [  0    0    0    0     0     0     0     0     0     0     0    0];         % Acetone
%Org_SEp_old(:,16) = [  0    0    0    0     0     0     0     0     0     0     0    0];         % Mehtane
%Org_SEp_old(:,17) = [  0    0    0    0     0     0     0     0     0     0     0    0];         % NO
%Org_SEp_old(:,18) = [  0    0    0    0     0     0     0     0     0     0     0    0];         % Acetaldehyde
%Org_SEp_old(:,19) = [  0    0    0    0     0     0     0     0     0     0     0    0];         % Formaldehyde
%Org_SEp_old(:,20) = [  0    0    0    0     0     0     0     0     0     0     0    0];         % CO
%Org_SEp_old(:,21) = [  1    1    1    4    37    40    69    19     1     1     1    1];         % Cineole
%Org_SEp_old(:,22) = [  0    0    0    6     0     0    39     2     0     0     0    0];         % Linolene


% new from Jaana B�ck
Org_SEp(:,1)   = [ 200.0000   200.0000   200.0000   200.0000   200.0000   200.0000   200.0000   200.0000   200.0000   200.0000   200.0000   200.0000]; % Isoprene
Org_SEp(:,2)   = [   0.0000     0.0000     0.0000     0.0000     0.0000     0.0000     0.0000     0.0000     0.0000     0.0000     0.0000     0.0000];  % Myrene
Org_SEp(:,3)   = [  91.5020    91.5020    91.5020    39.5411	31.0255	   56.9501    77.2559    26.4854    13.3998    53.9762    53.9762    53.9762];  % Sabinene
Org_SEp(:,4)   = [  28.9784    28.9784    28.9784    26.1034	31.0562	    4.9260     0.0000     0.0000     0.0000     0.0000     0.0000     0.0000];  % Limonene
Org_SEp(:,5)   = [1545.8700  1545.8700  1545.8700   751.7751   857.6580	 1117.4220   994.1413   328.5967   195.8226  1067.0780  1067.0780  1067.0780];  % 3-Carene
Org_SEp(:,6)   = [   0.0000     0.0000     0.0000     3.1461     3.1635     0.1864     0.0000     1.6751     0.4518     5.5440     5.5440     5.5440];  % trans-ocimene (a-p)
Org_SEp(:,7)   = [ 149.8590   149.8590   149.8590    94.5342    43.4590    43.3166	  20.4906    21.6621     9.9129    50.6230    50.6230    50.6230];  % b-Pinene
Org_SEp(:,8)   = [ 191.2170   191.2170   191.2170   159.0983   105.0899   107.6071    92.0581    49.6310    64.8744   495.7106   495.7106   495.7106];  % a-Pinene
Org_SEp(:,9)   = [  50.3102    50.3102    50.3102    38.3684    40.6501    42.9405    36.7703    21.0814    35.8471    27.2124    27.2124    27.2124];  % other monoterpenes (Camphene)
Org_SEp(:,10)  = [   0.0000     0.0000     0.0000     0.0000     4.7541     5.4295    29.7259     0.7238     3.4607    13.8396    13.8396    13.8396];  % a-farnesene
Org_SEp(:,11)  = [   0.0000     0.0000     0.0000     5.4127    24.8770    30.3148   123.8784    22.9775    11.9658    34.4356    34.4356    34.4356];  % b-caryophyllene
Org_SEp(:,12)  = [   0.0000     0.0000     0.0000     0.0000     0.0000     0.0000     3.5333    12.2488     3.6206     0.0000     0.0000     0.0000];  % sesquiterpene X
Org_SEp(:,13)  = [  12.0000    12.0000    12.0000    36.0000    60.0000    78.0000    42.0000    21.0000    24.0000    15.0000    12.0000    12.0000];  % MBO
Org_SEp(:,14)  = [   0.0000     0.0000     0.0000     0.0000     0.0000     0.0000     0.0000     0.0000     0.0000     0.0000     0.0000     0.0000];  % CH3OH (Methanol)
Org_SEp(:,15)  = [   0.0000     0.0000     0.0000     0.0000     0.0000     0.0000     0.0000     0.0000     0.0000     0.0000     0.0000     0.0000];  % Acetone
Org_SEp(:,16)  = [   0.0000     0.0000     0.0000     0.0000     0.0000     0.0000     0.0000     0.0000     0.0000     0.0000     0.0000     0.0000];  % Mehtane
Org_SEp(:,17)  = [   0.0000     0.0000     0.0000     0.0000     0.0000     0.0000     0.0000     0.0000     0.0000     0.0000     0.0000     0.0000];  % NO
Org_SEp(:,18)  = [   0.0000     0.0000     0.0000     0.0000     0.0000     0.0000     0.0000     0.0000     0.0000     0.0000     0.0000     0.0000];  % Acetaldehyde
Org_SEp(:,19)  = [   0.0000     0.0000     0.0000     0.0000     0.0000     0.0000     0.0000     0.0000     0.0000     0.0000     0.0000     0.0000];  % Formaldehyde
Org_SEp(:,20)  = [   0.0000     0.0000     0.0000     0.0000     0.0000     0.0000     0.0000     0.0000     0.0000     0.0000     0.0000     0.0000];  % CO
Org_SEp(:,21)  = [   0.0000     0.0000     0.0000     4.6098    29.2833    37.5695    69.9278    17.7086     0.1822     0.0000     0.0000     0.0000];  % 1,8-Cineol
Org_SEp(:,22)  = [   0.0000     0.0000     0.0000     6.5651     0.0000     0.0000    13.1948     1.8044     0.0000     0.0000     0.0000     0.0000];  % linalool
Org_SEp(:,23)  = [   0.0000     0.0000     0.0000     8.5803    11.0606    33.8356    46.9265    17.0683     4.3713    69.8304    69.8304    69.8304];  % terpinolene
Org_SEp(:,24)  = [   0.0000     0.0000     0.0000     4.9122     1.9551     2.2449     2.8684     0.3706     0.0000     0.0000     0.0000     0.0000];  % bornylacetate


for j = 1:12
    for i = 1:24
        EF_month(j,i) = Org_SEp(j,i); 
    end
end

dayav     = [1 45 74 104 135 166 196 227 257 288 319 365]; 
for j = 1:366, day(j) = j; end

for i = 1:24
    EF_day(:,i) = interp1(dayav, EF_month(:,i), day, 'linear');
end


% Write the emission factors (EF) to output file
filenam1 =('c:/hy-data/boy/documents/malte_in/general/hyytiala/EF_day.txt');
filenam2 =('c:/hy-data/boy/documents/sosa_in/general/hyytiala/EF_day.txt');
fid1 = fopen(filenam1, 'w');
fid2 = fopen(filenam2, 'w');

for j = 1:365
    for i = 1:22
        fprintf (fid1, '%15.6f', EF_day(j,i));    
    end
    fprintf (fid1, '\n');    
    for i = 1:22
        fprintf (fid2, '%15.6f', EF_day(j,i));    
    end
    fprintf (fid2, '\n');    
end

for i = 1:22
    fprintf (fid1, '%15.6f', EF_day(365,i));    
end
fprintf (fid1, '\n');    

for i = 1:22
    fprintf (fid2, '%15.6f', EF_day(365,i));    
end
fprintf (fid2, '\n');    

fclose(fid1);
fclose(fid2);

for j = 1:length(EF_day)
    mono_sum(j) = sum(EF_day(j,2:9));
    sesq_sum(j) = sum(EF_day(j,10:12));
end
     
figure(1)
clf
hold on
plot(EF_day(:,1), 'r-')
plot(mono_sum,  'b-')
plot(sesq_sum,  'g-')
