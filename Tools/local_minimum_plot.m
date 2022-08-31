close all
clc
clear all

syms x y y1 y2 

a = 2;
b = 4;
c = 8;

a1 = 7;
b1 = 2;
c1 = 9;


y3 = @(x,y) a*x^2+b*x+c-y;
y5 = @(x,y) (a1)*(x-15)^2+b1*(x-15)+c1+20;

y1 = @(x,y) 7*x+20-y;
y2 = @(x,y) -3*(x-40)+20-y;
y4 = @(x,y) -20*x+300-y;
y6 = @(y) y-60;
y_tot = piecewise (-22<x<6.54,y3,6.54<x<22,y2,20<x<40,y1);
%y_tot = piecewise (-22<x<9.788,y3,5<x<20,y5);
figure,
fimplicit(y_tot,[-10 40 -10 300],'b','lineWidth',1)
txt = 'Local minimum'
text(21.46,65.6,txt,'FontSize',12,'Color','black')
hold on
scatter(21.46,75.6,'x','k','lineWidth',2')
txt = 'Global minimum'
text(4,6,txt,'FontSize',12,'Color','red')
hold on
scatter(-1,6,'x','r','lineWidth',2')


%%
% 
% %y = piecewise(-400<x<0, rettifilo, S_star<x<1000, mezzo_cerchio);
% y_tot = piecewise (-20<x<10,y3,10<x<30,y1,30<x<50,y2);
% 
% figure,
% fimplicit(y_tot,[-50 50 -0 100])


a = 2;
b = 4;
c = 8;
a1 = 7;
b1 = 2;
c1 = 9;
y3 = a*x^2+b*x+c;
y5 = (a1)*(x-15)^2+b1*(x-15)+c1+50;
% 
% y1 = 3*x+100;
% y2 = -3*(x-40)+100;
% y4 = -20*x+600;
% time = linspace(-20,40,100);
figure,
fplot(y3,[-22 22],'b')
hold on
fplot(y5,[-22 22],'k')
% fplot(y2,[-30 30],'r')
% fplot(y4,[-30 30],'g')
% grid on

%y = piecewise(-400<x<0, rettifilo, S_star<x<1000, mezzo_cerchio);


