clear all
close all
clc

syms y x

%Ego vehicle in (-10,0)
A=100;

gammaYRv=1.38;
gammaYLv=1.38;
gammaXRv=60;
gammaXLv=60;

YRv=1.75;
YLv=-1.75;
XRv=-60;
XLv=-60;

%Obstacle in (0,0)
Ao=50;

Xo=0;
Yo=0;

gammaXo=5;
gammaYo=100;

%Attractive potential
Aatt=-25;

Xatt=
Yatt=

gammaXatt=
gammaYatt=

%Aatt=-25;
%Yatt=-3.5;
%gammaatt=2.5;
dR= ((x-XRv).^2/gammaXRv.^2 +(y-YRv).^2/gammaYRv.^2);
dL= ((x-XLv).^2/gammaXLv.^2 +(y-YLv).^2/gammaYLv.^2);
do= ((x-Xo).^2/gammaXo.^2 +(y-Yo).^2/gammaYo.^2);
datt=((x-Xatt).^2/gammaXatt.^2(y-Yatt).^2/gammYatt.^2);

Ur=A*exp(-dR.^2);
Ul=A*exp(-dL.^2);
Uo=Ao*exp(-do.^2);
Uatt=Aatt*exp(-datt.^3);

U=Ur+Ul+Uo+Uatt;

figure,

fsurf(U,[-200,200,-100,100])  %x-y

% figure(1),hold on,fsurf(25*x+85)

% figure(10), hold on,scatter(-3.5,0,'r'), hold on, scatter(-3.95,0,'r'), hold on, scatter(-3.05,0,'r'), hold on, fplot(0) 
% 
% figure(10), hold on,scatter(0,0,'r'), hold on, scatter(0.45,0,'r'), hold on, scatter(-0.45,0,'r')