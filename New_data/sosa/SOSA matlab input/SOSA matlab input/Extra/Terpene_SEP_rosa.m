clear all

% This code calculates standard emission potentials in microgramm / m2 / h
% based on measurements from Alex Guenther

Org_SEp(1)    = 2643;  %      1  Isoprene 
Org_SEp(2)    =    4;  %	  2  MBO	
Org_SEp(3)    =    8;  %	  3  Myrcene	
Org_SEp(4)    =   18;  %	  4  Sabinene	
Org_SEp(5)    =   28;  %	  5  limonene	
Org_SEp(6)    =   16;  %	  6  carene <3->	
Org_SEp(7)    =   43;  %	  7  ocimene <trans beta>	
Org_SEp(8)    =   44;  %	  8  pinene <beta->	
Org_SEp(9)    =  110;  %	  9  pinene  <alpha->	
Org_SEp(10)   =   12;  %	  10 farnescene  <alpha->	
Org_SEp(11)   =   19;  %	  11 caryophyllene <beta->	
Org_SEp(12)   =  890;  %	  12 Methanol	
Org_SEp(13)   =  130;  %	  13 Acetone	
Org_SEp(14)   =  130;  %	  14 Acetaldehyde and ethanol	
Org_SEp(15)   =   58;  %	  15 formic acid, formaldehyde, acetic acid	
Org_SEp(16)   =   25;  %	  16 methane	
Org_SEp(17)   =   41;  %	  17 nitric oxide	
Org_SEp(18)   =   49;  %	  18 other monoterpenes	
Org_SEp(19)   =   35;  %	  19 other sesquiterpenes	
Org_SEp(20)   =  830;  %	  20 CO and other VOC	
Org_SEp(21)   =    0;  %      21 1,8-Cineol
Org_SEp(22)   =    0;  %      22 Linalool
Org_SEp(23)   =    0;  %      23 terpinolene
Org_SEp(24)   =    0;  %      24 bornylacetate


% Write the emission factors (EF) to output file
filenam1 =('c:/michael/malte/general/SEP_africa.txt');
fid1 = fopen(filenam1, 'w');

for i = 1:24
    fprintf (fid1, '%15.6f', Org_SEp(i));    
    fprintf (fid1, '\n');    
end
fclose(fid1);

     
