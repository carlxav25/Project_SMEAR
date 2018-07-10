clear all

% This code calculates standard emission potentials for each day and
% different terpenes by using measured terpene conc. for the distribution
% of the monoterpenes amd Hannele SEP



% new from Jaana Bäck
Org_SEp(:,1)   = [ 100.0000   100.0000   100.0000   100.0000   100.0000   100.0000   100.0000   100.0000   100.0000   100.0000   100.0000   100.0000];  % Isoprene
Org_SEp(:,2)   = [  12.0000    12.0000    12.0000    36.0000    60.0000    78.0000    42.0000    21.0000    24.0000    15.0000    12.0000    12.0000];  % MBO
Org_SEp(:,3)   = [   0.0000     0.0000     0.0000     0.0000     0.0000     0.0000     0.0000     0.0000     0.0000     0.0000     0.0000     0.0000];  % Myrene
Org_SEp(:,4)   = [  91.5020    91.5020    91.5020    39.5411	31.0255	   56.9501    77.2559    26.4854    13.3998    53.9762    53.9762    53.9762];  % Sabinene
Org_SEp(:,5)   = [  28.9784    28.9784    28.9784    26.1034	31.0562	    4.9260     0.0000     0.0000     0.0000     0.0000     0.0000     0.0000];  % Limonene
Org_SEp(:,6)   = [1545.8700  1545.8700  1545.8700   751.7751   857.6580	 1117.4220   994.1413   328.5967   195.8226  1067.0780  1067.0780  1067.0780];  % 3-Carene
Org_SEp(:,7)   = [   0.0000     0.0000     0.0000     3.1461     3.1635     0.1864     0.0000     1.6751     0.4518     5.5440     5.5440     5.5440];  % trans-ocimene (a-p)
Org_SEp(:,8)   = [ 149.8590   149.8590   149.8590    94.5342    43.4590    43.3166	  20.4906    21.6621     9.9129    50.6230    50.6230    50.6230];  % b-Pinene
Org_SEp(:,9)   = [ 191.2170   191.2170   191.2170   159.0983   105.0899   107.6071    92.0581    49.6310    64.8744   495.7106   495.7106   495.7106];  % a-Pinene
Org_SEp(:,10)  = [   0.0000     0.0000     0.0000     0.0000     4.7541     5.4295    29.7259     0.7238     3.4607    13.8396    13.8396    13.8396];  % a-farnesene
Org_SEp(:,11)  = [   0.0000     0.0000     0.0000     5.4127    24.8770    30.3148   123.8784    22.9775    11.9658    34.4356    34.4356    34.4356];  % caryophyllene
Org_SEp(:,12)  = [   0.0000     0.0000     0.0000     0.0000     0.0000     0.0000     0.0000     0.0000     0.0000     0.0000     0.0000     0.0000];  % CH3OH (Methanol)
Org_SEp(:,13)  = [   0.0000     0.0000     0.0000     0.0000     0.0000     0.0000     0.0000     0.0000     0.0000     0.0000     0.0000     0.0000];  % Acetone
Org_SEp(:,14)  = [   0.0000     0.0000     0.0000     0.0000     0.0000     0.0000     0.0000     0.0000     0.0000     0.0000     0.0000     0.0000];  % Acetaldehyde
Org_SEp(:,15)  = [   0.0000     0.0000     0.0000     0.0000     0.0000     0.0000     0.0000     0.0000     0.0000     0.0000     0.0000     0.0000];  % Formaldehyde
Org_SEp(:,16)  = [   0.0000     0.0000     0.0000     0.0000     0.0000     0.0000     0.0000     0.0000     0.0000     0.0000     0.0000     0.0000];  % Mehtane
Org_SEp(:,17)  = [   0.0000     0.0000     0.0000     0.0000     0.0000     0.0000     0.0000     0.0000     0.0000     0.0000     0.0000     0.0000];  % NO
Org_SEp(:,18)  = [  50.3102    50.3102    50.3102    38.3684    40.6501    42.9405    36.7703    21.0814    35.8471    27.2124    27.2124    27.2124];  % other monoterpenes (Camphene)
Org_SEp(:,19)  = [   0.0000     0.0000     0.0000     0.0000     0.0000     0.0000     3.5333    12.2488     3.6206     0.0000     0.0000     0.0000];  % sesquiterpene X
Org_SEp(:,20)  = [   0.0000     0.0000     0.0000     0.0000     0.0000     0.0000     0.0000     0.0000     0.0000     0.0000     0.0000     0.0000];  % CO
Org_SEp(:,21)  = [   0.0000     0.0000     0.0000     4.6098    29.2833    37.5695    69.9278    17.7086     0.1822     0.0000     0.0000     0.0000];  % 1,8-Cineol
Org_SEp(:,22)  = [   0.0000     0.0000     0.0000     6.5651     0.0000     0.0000    13.1948     1.8044     0.0000     0.0000     0.0000     0.0000];  % linalool
Org_SEp(:,23)  = [   0.0000     0.0000     0.0000     8.5803    11.0606    33.8356    46.9265    17.0683     4.3713    69.8304    69.8304    69.8304];  % terpinolene
Org_SEp(:,24)  = [   0.0000     0.0000     0.0000     4.9122     1.9551     2.2449     2.8684     0.3706     0.0000     0.0000     0.0000     0.0000];  % bornylacetate


for j = 1:12
    for i = 1:22
        EF_month(j,i) = Org_SEp(j,i);
    end
    Org_mono(j) = Org_SEp(j,3) + Org_SEp(j,4) + Org_SEp(j,5) + Org_SEp(j,6) + Org_SEp(j,7) + Org_SEp(j,8) + Org_SEp(j,9) + Org_SEp(j,18) ;    
    Org_SEp(j,3) = Org_mono(j);
    Org_SEp(j,4) = Org_mono(j);
    Org_SEp(j,5) = Org_mono(j);
    Org_SEp(j,6) = Org_mono(j);
    Org_SEp(j,7) = Org_mono(j);
    Org_SEp(j,8) = Org_mono(j);
    Org_SEp(j,9) = Org_mono(j);
    Org_SEp(j,18) = Org_mono(j);
end

dayav     = [1 45 74 104 135 166 196 227 257 288 319 365]; 
for j = 1:366, day(j) = j; end

for i = 1:22
    EF_day(:,i) = interp1(dayav, Org_SEp(:,i), day, 'linear');
end


% Write the emission factors (EF) to output file
filenam1 =('C:\HY-data\BOY\documents\Malte_box\Malte_in\General\Hyytiala/EF_day_new.txt');
filenam2 =('C:\HY-data\BOY\documents\Sosa_in\General\Hyytiala/EF_day_new.txt');
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
    mono_sum(j) = sum(EF_day(j,3:9));
end
     
figure(1)
%clf
hold on
plot(EF_day(:,6), 'r-.')
