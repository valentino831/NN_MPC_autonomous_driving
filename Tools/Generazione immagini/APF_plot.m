clear all
close all
clc

syms y x

%Ego vehicle in (-10,0)
A=1000;

gammaYRv=1.38;
gammaYLv=1.38;
gammaXRv=60;
gammaXLv=60;

YRv=1.75;
YLv=-1.75;
XRv=0;
XLv=0;



dR= ((x-XRv).^2/gammaXRv.^2 +(y-YRv).^2/gammaYRv.^2);
dL= ((x-XLv).^2/gammaXLv.^2 +(y-YLv).^2/gammaYLv.^2);


Ur=A*exp(-dR.^5);
Ul=A*exp(-dL.^5);


U=Ur+Ul;

figure,
fsurf(Ur)
xlabel('x')
ylabel('y')
zlabel('Amplitude')
title('Right APF')
figure,
fsurf(Ul)
xlabel('x')
ylabel('y')
zlabel('Amplitude')
title('Left APF')


figure,
fsurf(U)  %x-y
xlabel('x')
ylabel('Lateral direction [m]')
zlabel('Amplitude [m]')
title('Total Artificial Potential Field')
hold on
scatter(0,1.75,'x','r','linewidth',1)
scatter(0,-1.75,'x','r','linewidth',1)



% figure(1),hold on,fsurf(25*x+85)

% figure(10), hold on,scatter(-3.5,0,'r'), hold on, scatter(-3.95,0,'r'), hold on, scatter(-3.05,0,'r'), hold on, fplot(0) 
% 
% figure(10), hold on,scatter(0,0,'r'), hold on, scatter(0.45,0,'r'), hold on, scatter(-0.45,0,'r')