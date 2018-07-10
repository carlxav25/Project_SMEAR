clear all
clc
close all

path = ('/home/local/carltonx/Documents/Smear_course/New_data/2016/')
files = dir('*.sum')

fileout='dmps_16.sum';
fout=fopen(fileout,'w');
for cntfiles=1:length(files)
	fin=fopen(files(cntfiles).name);
    temp = fread(fin,'uint8');
    fwrite(fout,temp,'uint8');
    fprintf(fout,'\n');
	fclose(fin);
end
fclose(fout); 

