clear all
close all
clc

syms x y 

x_goal = -80;
y_goal = 0;

x_obs_1 = 0;
y_obs_1 = 60;

x_obs_2 = 60;
y_obs_2 = 2;

x_obs_3 = -40;
y_obs_3 = -35;
% Attractive APF
zeta = 0.001;
d_att_1 = sqrt((x-x_goal)^2+(y-y_goal)^2);
U_att_1 = 1/2*zeta*d_att_1^2;

d_att_2 = sqrt((x-x_goal)^2+(y-y_goal)^2)
U_att_2 = 20*zeta*d_att_2-1/2*zeta*10^2;

%Repulsive APF
% eta = 100;
% Q = 100;
% D = sqrt((x-1)^2+(y-1)^2);
% U_rep_1 = 0.5*eta*((1/D)-(1/Q))^2;
% gammax = 60
% gammay = 60
gammax = 30;
gammay = 30;

  U_rep_1 = 50 * exp(-((x-x_obs_1)^2/gammax^2+(y-y_obs_1)^2/gammay^2))
  U_rep_2 = 50 * exp(-((x-x_obs_2).^2/20^2+(y-y_obs_2).^2/20^2))
  U_rep_3 = 50 * exp(-((x-x_obs_3).^2/15^2+(y-y_obs_3).^2/15^2))

%U_att_1 = 100 * exp(-((x-x_goal)^2/100^2+(y-y_goal)^2/1.5^2))

U=U_att_1+U_rep_1+U_rep_2+U_rep_3;

figure(1),
ezsurf(U,[-100,100,-100,100])
hold on
%scatter(x_goal,y_goal,'r','lineWidth',2)
hold on 
scatter3(-80,0,2,'x','r','lineWidth',2)
txt = 'Goal';
text(-95,20,2,txt,'FontSize',12,'Color','red')
title ('Attractive and Repulsive Artificial Potential Fields')
scatter3(80,80,20,'x','y','lineWidth',2)
txt = 'Start';
text(80,70,20,txt,'FontSize',12,'Color','yellow')


% figure(1)
% hold on
% figure(2)
% hold on
% figure(2)

% figure,
% fsurf(U,[-300,300,-300,300])

% figure,
% fsurf(U_rep_1+U_rep_2,[-300,300,-300,300])
% 
% figure,
% ezsurf(U_rep_1+U_att_2,[-300,300,-300,300])




% figure(1),hold on,fsurf(25*x+85)

% figure(10), hold on,scatter(-3.5,0,'r'), hold on, scatter(-3.95,0,'r'), hold on, scatter(-3.05,0,'r'), hold on, fplot(0) 
% 
% figure(10), hold on,scatter(0,0,'r'), hold on, scatter(0.45,0,'r'), hold on, scatter(-0.45,0,'r')

%%

x = -150:0.5:150;
y = -150:0.5:150;


[X,Y] = meshgrid(x,y);

Z1 = 50 * exp(-((X-0).^2/30^2+(Y-60).^2/30^2));
Z2 = 50 * exp(-((X-60).^2/20^2+(Y-2).^2/20^2));
Z4 = 50 * exp(-((X+40).^2/15^2+(Y+35).^2/15^2));
zeta = 0.001;
d_att_1 = sqrt((X+90).^2+(Y-0).^2);
Z3 = 1/2*zeta*d_att_1.^2;
%z=sin(X)+Y;
disp('end')
figure,
contour(X,Y,Z1+Z2+Z4-Z3)
hold on
% hold on
% contour(X,Y,Z1)
% hold on
% contour(X,Y,Z2)
% hold on
% contour(X,Y,Z3)
% hold on
% contour3(X,Y,Z4)
scatter(-90,0,'x','r','lineWidth',2)
txt = 'Goal';
text(-95,12,txt,'FontSize',12)
scatter(80,80,'x','k','lineWidth',2)
txt = 'Start';
text(80,70,txt,'FontSize',12)
xlabel('x')
ylabel('y')


x_coord = [-90 -40 20 80];
y_coord = [0 0 15 80];

time = linspace(-90,80,100);

interp = spline(x_coord,y_coord,time);

hold on
plot(time,interp,'k--')
title(' Attractive and Repulsive APF level lines')

%axis(square)

disp('fine')

