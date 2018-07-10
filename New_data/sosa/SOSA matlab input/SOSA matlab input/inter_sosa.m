function [data] = intersa(data, doy);

imax = 10;
intmax = 10;

for i = 2:doy-10,
       if isnan(data(i)) == 0  | isnan(data(i-1)) == 1
       else
          if isnan(data(i+1)) == 0 
             data(i)   = 0.50 * data(i-1) + 0.50*data(i+1);
          elseif isnan(data(i+2)) == 0
             data(i)   = 0.66 * data(i-1) + 0.34 * data(i+2);
             data(i+1) = 0.34 * data(i-1) + 0.66 * data(i+2);
          elseif isnan(data(i+3)) == 0
             data(i)   = 0.75 * data(i-1) + 0.25*data(i+3);
             data(i+1) = 0.50 * data(i-1) + 0.50*data(i+3);
             data(i+2) = 0.25 * data(i-1) + 0.75*data(i+3);
          elseif isnan(data(i+4)) == 0
             data(i)   = 0.80 * data(i-1) + 0.20 * data(i+4);
             data(i+1) = 0.60 * data(i-1) + 0.40 * data(i+4);
             data(i+2) = 0.40 * data(i-1) + 0.60 * data(i+4);
             data(i+3) = 0.20 * data(i-1) + 0.80 * data(i+4);
          elseif isnan(data(i+5)) == 0
             data(i)   = 0.83 * data(i-1) + 0.17 * data(i+5);
             data(i+1) = 0.66 * data(i-1) + 0.34 * data(i+5);
             data(i+2) = 0.50 * data(i-1) + 0.50 * data(i+5);
             data(i+3) = 0.34 * data(i-1) + 0.66 * data(i+5);
             data(i+4) = 0.17 * data(i-1) + 0.83 * data(i+5);
          elseif isnan(data(i+6)) == 0
             data(i)   = 0.85 * data(i-1) + 0.15 * data(i+6);
             data(i+1) = 0.70 * data(i-1) + 0.30 * data(i+6);
             data(i+2) = 0.55 * data(i-1) + 0.45 * data(i+6);
             data(i+3) = 0.45 * data(i-1) + 0.55 * data(i+6);
             data(i+4) = 0.30 * data(i-1) + 0.70 * data(i+6);
             data(i+5) = 0.15 * data(i-1) + 0.85 * data(i+6);
          elseif isnan(data(i+7)) == 0
             data(i)   = 0.87 * data(i-1) + 0.13 * data(i+7);
             data(i+1) = 0.75 * data(i-1) + 0.25 * data(i+7);
             data(i+2) = 0.62 * data(i-1) + 0.38 * data(i+7);
             data(i+3) = 0.50 * data(i-1) + 0.50 * data(i+7);
             data(i+4) = 0.38 * data(i-1) + 0.62 * data(i+7);
             data(i+5) = 0.25 * data(i-1) + 0.75 * data(i+7);
             data(i+6) = 0.13 * data(i-1) + 0.87 * data(i+7);
          elseif isnan(data(i+8)) == 0
             data(i)   = 0.88 * data(i-1) + 0.12 * data(i+8);
             data(i+1) = 0.76 * data(i-1) + 0.24 * data(i+8);
             data(i+2) = 0.64 * data(i-1) + 0.36 * data(i+8);
             data(i+3) = 0.55 * data(i-1) + 0.45 * data(i+8);
             data(i+4) = 0.45 * data(i-1) + 0.55 * data(i+8);
             data(i+5) = 0.36 * data(i-1) + 0.64 * data(i+8);
             data(i+6) = 0.24 * data(i-1) + 0.76 * data(i+8);
             data(i+7) = 0.12 * data(i-1) + 0.88 * data(i+8);
          elseif isnan(data(i+9)) == 0
             data(i)   = 0.90 * data(i-1) + 0.10 * data(i+9);
             data(i+1) = 0.80 * data(i-1) + 0.20 * data(i+9);
             data(i+2) = 0.70 * data(i-1) + 0.30 * data(i+9);
             data(i+3) = 0.60 * data(i-1) + 0.40 * data(i+9);
             data(i+4) = 0.50 * data(i-1) + 0.50 * data(i+9);
             data(i+5) = 0.40 * data(i-1) + 0.60 * data(i+9);
             data(i+6) = 0.30 * data(i-1) + 0.70 * data(i+9);
             data(i+7) = 0.20 * data(i-1) + 0.80 * data(i+9);
             data(i+8) = 0.10 * data(i-1) + 0.90 * data(i+9);
          elseif isnan(data(i+10)) == 0
             data(i)   = 0.91 * data(i-1) + 0.09 * data(i+10);
             data(i+1) = 0.81 * data(i-1) + 0.19 * data(i+10);
             data(i+2) = 0.72 * data(i-1) + 0.28 * data(i+10);
             data(i+3) = 0.63 * data(i-1) + 0.37 * data(i+10);
             data(i+4) = 0.54 * data(i-1) + 0.46 * data(i+10);
             data(i+5) = 0.46 * data(i-1) + 0.54 * data(i+10);
             data(i+6) = 0.37 * data(i-1) + 0.63 * data(i+10);
             data(i+7) = 0.28 * data(i-1) + 0.72 * data(i+10);
             data(i+8) = 0.19 * data(i-1) + 0.81 * data(i+10);
             data(i+9) = 0.09 * data(i-1) + 0.91 * data(i+10);
          end    
       end       
end
