function[gamma_out]=GF_gamma_lauri(dp_new);
% gamma as a function of Dp
RH_norm=0.9; % [1:99]/100;

dp=[15 20 35 50 73 109 166 264]*1e-9;


GF_l=[ 1.15 1.12 1.16 1.15 1.17 1.17 1.15 1.14]; % 1.16
GF_i=[ 1.31 1.25 1.22 1.24 1.32 1.36 1.32 1.46];
GF_m=[ 1.38 1.32 1.36 1.32 1.37 1.46 1.53 1.59]; % 1.35

osuus_l=[ 61.5 57.2 39.8 38.7 46.1 53.5 38.3 28.0]/100; %61.5
osuus_i=[0.9 0.7 1.9 2.1 3.0 1.2 0.5 0.4]/100;
osuus_m=[ 37.6 42.1 58.3 59.2 50.9 45.3 61.2 71.6]/100; %37.5
GF_mean=GF_l.*osuus_l+GF_i.*osuus_i+GF_m.*osuus_m;

gamma=log(GF_mean)./log(1-RH_norm);
p=polyfit(dp,gamma,1);

gamma_out=p(1)*min(dp_new,2.9e-7)+p(2);


