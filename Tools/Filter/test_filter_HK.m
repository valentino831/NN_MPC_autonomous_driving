clear all;
close all;
clc;

load('Test_CNTR_HK_scenario_completo_500.mat');

figure,
plot(xddot)
hold on;

y = xddot;
z = yddot;

for i = 300:2801
    y(i) = 0;
    z(i) = 0;
end

plot(y)

xddot = y;
yddot = z;
time = time ;

save('Test_CNTR_HK_scenario_completo_500_yddot_xddot_filtered.mat','yddot','time','xddot')
