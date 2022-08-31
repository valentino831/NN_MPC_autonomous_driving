clear all;
close all;
clc;

s = tf('s');

%Data
tau = 0.5;
Ts = 0.1;
ovs = 0.1;
tr = 0.2;

% Plant
Gp = 1/(s*(tau*s+1)) * 1/(1+s*Ts/2);
p = 1;

% Controller design
Kp = dcgain(s^p*Gp);
R0 = 1;

zeta = abs(log(ovs))/sqrt(pi^2 + log(ovs)^2);
Tp = 1/(2*zeta*sqrt(1-zeta^2));
Sp = 2*zeta*sqrt(2+4*zeta^2+2*sqrt(1+8*zeta^2))/(sqrt(1+8*zeta^2)+4*zeta^2-1);

wc_des = 10;%1/(tr*sqrt(1-zeta^2))*(pi-acos(zeta))*sqrt(sqrt(1+4*zeta^4)-2*zeta^2);

%Kc sign
Kc = 1;
Gc = Kc/s;
L = Gc*Gp;

%figure, nyquist(L); %Controller is stabilizable

zd = wc_des/100;
Rz1 = (1+s/zd);

zd = wc_des/5;
Rz2 = (1+s/zd);

Kc = 4.6*10^(26.3/20);
Gc = Kc/s * (1+s/0.36) * (1+s/2) * 1/(s+50) ;
Ln = Gc*Gp;

figure, nichols(L,'r-'),hold on, myngridst(Tp,Sp),nichols(Ln,'b-');

Tn = Ln/(1+Ln);
figure,step(Tn),grid on;

