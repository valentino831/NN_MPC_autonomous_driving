%close all
clear all 
clc


syms x y

[X,Y]=meshgrid(x,y);

Y0 = 0;
Y01 = 3.5;
Ar = 0.5;
br = 1;

Ur = Ar*(1-exp(br*(Y-Y01)))^2+Ar*(1-exp(-br*(Y-Y0)))^2;

figure(1),
fsurf(Ur)
zlim([0 5])
xlim([-2 5.5])
xlabel('x [m]')
ylabel('y [m]')
zlabel('Amplitude [m]')
title('APF for straight road' )
figure,
fplot(Ur)
ylim([0 5])
xlim([-2 5.5])
xlabel('y [m]')
ylabel('Amplitude [m]')
title('APF for straight road' )