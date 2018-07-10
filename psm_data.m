close all
clear all

path = '/home/local/carltonx/Documents/Smear_course/Data_to_Mette/';
files=dir(path);
name= extractfield(files, 'name')';

numfiles=length(files);

for k = 1:numfiles
  myfilename = sprintf('file%d.txt', k);
  mydata{k}  = importdata(myfilename);
end

%file=load(['/home/local/carltonx/Documents/Smear_course/Data_to_Mette/PSM10_20140530.dat']);


