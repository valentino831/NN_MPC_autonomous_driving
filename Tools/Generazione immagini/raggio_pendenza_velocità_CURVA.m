clear all
%close all
clc

syms x 

t = linspace(45,964,100);

% Raggio - pendenza - velocità 
A = [45 0.07 40];
B = [118 0.07 60];
C = [178 0.07 70];
D = [252 0.07 80];
E = [339 0.07 90];
F = [437 0.07 100];
G = [2000 0.025 100];
H = [667 0.07 120];
I = [3334 0.025 120];
J = [964 0.07 140];
K = [4820 0.025 140];

y1 = (F(2)-G(2))/(F(1)-G(1))*(x-F(1))+F(2);
y2 = (H(2)-I(2))/(H(1)-I(1))*(x-H(1))+H(2);
y3 = (J(2)-K(2))/(J(1)-K(1))*(x-J(1))+J(2);


figure,
scatter(A(1), A(2),'k','filled')
hold on
scatter(B(1), B(2),'k','filled')
scatter(C(1), C(2),'k','filled')
scatter(D(1), D(2),'k','filled')
scatter(E(1), E(2),'k','filled')
scatter(F(1), F(2),'k','filled')
scatter(G(1), G(2),'k','filled')
scatter(H(1), H(2),'k','filled')
scatter(I(1), I(2),'k','filled')
scatter(J(1), J(2),'k','filled')
scatter(K(1), K(2),'k','filled')

rett_blu = @(y) y-0.07;
rett_1 = @(x,y) y-y1;
rett_2 = @(x,y) y-y2;
rett_3 = @(x,y) y-y3;

y = piecewise( 45<x<964, rett_blu)
yr1 = piecewise(437<x<2187,rett_1)
yr2 = piecewise(667<x<3334,rett_2)
yr3 = piecewise(964<x<4820,rett_3)

fimplicit(y,[45 4820 0.025 0.07],'color','[0 0.4470 0.7410]','linewidth',2)
hold on
fimplicit(yr1,[45 4820 0.025 0.07],'color','[0.8500 0.3250 0.0980]','linewidth',2)
hold on
fimplicit(yr2,[45 4820 0.025 0.07],'color','[0.4660 0.6740 0.1880]','linewidth',2)
hold on
fimplicit(yr3,[45 4820 0.025 0.07],'color','[0 0.4470 0.7410]','linewidth',2)

xlabel('Radius')
ylabel('Cross slope')
zlabel('Minimum velocity')

%%
figure,
scatter(A(1), A(2),'k','filled')
hold on
scatter(B(1), B(2),'k','filled')
scatter(C(1), C(2),'k','filled')
scatter(D(1), D(2),'k','filled')
scatter(E(1), E(2),'k','filled')
scatter(F(1), F(2),'k','filled')

scatter(H(1), H(2),'k','filled')

scatter(J(1), J(2),'k','filled')
ylim([0.02 0.09])
hold on
txt1 ='40'
text(A(1)-20,A(2)+0.005,txt1,'fontsize',10,'color','[0.6350 0.0780 0.1840]')
txt2 ='60'
text(B(1)-20,B(2)+0.005,txt2,'fontsize',10,'color','[0.6350 0.0780 0.1840]')
txt3 ='70'
text(C(1)-20,C(2)+0.005,txt3,'fontsize',10,'color','[0.6350 0.0780 0.1840]')
txt4 ='80'
text(D(1)-20,D(2)+0.005,txt4,'fontsize',10,'color','[0.6350 0.0780 0.1840]')
txt5 ='90'
text(E(1)-20,E(2)+0.005,txt5,'fontsize',10,'color','[0.6350 0.0780 0.1840]')
txt6 ='100'
text(F(1)-20,F(2)+0.005,txt6,'fontsize',10,'color','[0.6350 0.0780 0.1840]')
txt7 ='120'
text(H(1)-20,H(2)+0.005,txt7,'fontsize',10,'color','[0.6350 0.0780 0.1840]')
txt8 ='140'
text(J(1)-20,J(2)+0.005,txt8,'fontsize',10,'color','[0.6350 0.0780 0.1840]')
txt9 ='V_{min} = '
text(-100,A(2)+0.005,txt9,'fontsize',10,'color','[0.6350 0.0780 0.1840]')
%xline(A(1),'k--')
ya = piecewise(45<x<964, @(x) x-A(1))
fimplicit(@(x) x-A(1),'r--')
xline(B(1),'k--')
xline(C(1),'k--')
xline(D(1),'k--')
xline(E(1),'k--')
xline(F(1),'k--')
xline(H(1),'k--')
xline(J(1),'k--')





