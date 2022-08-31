clear all
close all
clc

syms x y 

[X Y]= meshgrid(x,y);

% Quadratic
xg = 0;
yg = 0;
zeta = 0.1;
d = (X-xg)^2+(Y-yg)^2;

U_quad = 0.5*zeta*d;

%Conic
U_con = zeta*sqrt(d);

%% Repulsive


xo = 4;
yo = 4;
eta = 1;
Q = 3;

D = sqrt((x-xo)^2-(y-yo)^2);
d1 = (X-xo)^2+(Y-yo)^2;
% y = piecewise(D);

U_rep = 1/2*eta*((1/d)-(1/Q))^2;
U_rep1 = 1/2*eta*((1/d1)-(1/Q))^2;

r = 1;
h = 20;
[Xc,Yc,Zc] = cylinder(1);
Zc=Zc*h;

figure,
surf(Xc,Yc,Zc)
xlim([-10 10])
ylim([-10 10])


%PLOT
figure,
fsurf(U_quad)
title('Quadratic attractive APF')
xlabel('x [m]')
ylabel('y [m]')
zlabel('Amplitude [m]')

figure,
fsurf(U_con)
title('Conic attractive APF')
xlabel('x [m]')
ylabel('y [m]')
zlabel('Amplitude [m]')

figure,
fsurf(U_rep)
title('Repulsive APF')
xlabel('x [m]')
ylabel('y [m]')
zlim([0 10])
xlim([-5 5])
ylim([-5 5])
zlabel('Amplitude [m]')

