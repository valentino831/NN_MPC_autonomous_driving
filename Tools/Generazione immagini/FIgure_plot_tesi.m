close all
clear all
clc

%% --- SCENARIO 1

load('Data_Finali_LK_to_pin_acc_steer.mat')

Ts = 0.1;

%Lateral_offsets
% L1_1=Lateral_offset_1;
% L2_1=Lateral_offset_2;
% L3_1=Lateral_offset_3-1.75;
%L4_1=Lateral_offset_4;

%Time
% t_tmp = length(time)*0.1
% t1=linspace(0,t_tmp,t_tmp)';
 t1=time;
% %Lateral velocity
% vy_1=ydot;
% 
% %Longitudinat velocity
% vx_1=xdot;
% 
% %Lateral acceleratio
% ay_1=yddot;
% 
% %Longitudinal acceleration
% ax_1=xddot;
% 
% %Steering angle
% d1=delta_deg;

%Jerk
%j1=jerk;

% %Delta delta 
% d_delta1=d_delta;
% 
% Walls
% A1=A_LK;

%Relative distance wrt the previous vehicle
%d_rel_1=d_rel;

%Curvature
%C1 = Curv;

%Steering angle CNTR
% st_cntr_1 = st_cntr;
st_cntr_1 = y_st;


%Steering angle NN
% st_nn_1 = st_nn;
st_nn_1 = y_st_nn;

% %Acceleration CNTR
% acc_cntr_1 = acc_cntr;
%  acc_cntr_1 = y;
% % 
% % %Acceleration NN
% % acc_nn_1 = acc_nn;
% acc_nn_1 = y_nn;


acc_cntr_1 = y_acc;
% 
% %Acceleration NN
% acc_nn_1 = acc_nn;
acc_nn_1 = y_acc_nn;

%% PLOTS
%{
n =1;

%Plot of the Lateral offsets
figure,
subplot(2,1,1)
%v = [0 -1.75;194.8 -1.75;194.8 8.75; 0 8.75];
v = [0 -1.75;194.8 -1.75;194.8 1.75; 0 1.75];
f = [1 2 3 4];
patch('Faces',f,'Vertices',v,'FaceColor','#F0F0F0')%[0.9 0.9 0.9]')
hold on
plot(t1,-L3_1(1:length(t1)),'linewidth',n+0.5), hold on,

%LK-HK
y2 = yline(0,'w--','linewidth',n), 
%   y2.Color=[0.9 0.6 0.1];
%    y2.Color=[0.7 0.9 0.1];
  y2.Color=[0.9290 0.6940 0.1250];
y1 = yline(-1.75,'k','linewidth',n+0.2), 
% y1.Color=[0.4 0.6 0.7];
y1 = yline(1.75,'k','linewidth',n+0.2),
% y1.Color=[0.4 0.6 0.7];

% %OV-RE
% y2 = yline(3.5,'w--','linewidth',n), 
% %  y2.Color=[0.7 0.9 0.1];
% y2.Color=[0.9290 0.6940 0.1250];
% y2 = yline(7,'w--','linewidth',n),
% %  y2.Color=[0.7 0.9 0.1];
% y2.Color=[0.9290 0.6940 0.1250];
% y1 = yline(5.25,'k','linewidth',n+0.2),
%  %y1.Color=[0.4 0.6 0.7];
% y1 = yline(8.75,'k','linewidth',n+0.2), 
%  % y1.Color=[0.4 0.6 0.7];

txt1 ='1° lane'
text(170,0.4,txt1,'fontsize',10,'color','r')
% txt2 ='2° lane'
% text(170,3.9,txt2,'fontsize',10,'color','r')
% txt3 ='3° lane'
% text(170,7.4,txt3,'fontsize',10,'color','r')

grid on
title('Error wrt lane center')
legend('Lane','Trajectory','Center of the lane')
xlabel('time [s]')
ylabel('Lane offset [m]')
xlim([0 194.8])
x0 = 10;
y0 = 10;
width = 700;
height = 500;
set(gcf,'position',[x0 y0 width height])


%Plot of steering angle
subplot(2,1,2)

plot(t1,d1,'linewidth',n),hold on%,y1 = yline(1,'m--','linewidth',n),hold on,y2 = yline(-1,'m--','linewidth',n)
grid on
% txt1 ='23.5 [deg]'
% text(5,0.9,txt1,'fontsize',10,'color','[0.8 0.1 0.5]')
% txt2 ='-23.5 [deg]'
% text(5,-0.9,txt2,'fontsize',10,'color','[0.8 0.1 0.5]')
%  y1.Color=[0.8 0.1 0.5];
%  y2.Color=[0.8 0.1 0.5];
title('Steering angle')
legend('\delta','\delta_{max}','\delta_{min}')
xlabel('time [s]')
ylabel('Steering angle [deg]')
xlim([0 194.8])
ylim([-1 1])
x0 = 10;
y0 = 10;
width = 700;
height = 500;
set(gcf,'position',[x0 y0 width height])


%Plot of lateral velocity
figure,
subplot(2,1,2)
plot(t1,vy_1,'linewidth',n)
grid on
title('Lateral velocity')
legend('Lateral velocity')
xlabel('time [s]')
ylabel('Lateral velocity [m/s]')
xlim([0 194.8])
x0 = 10;
y0 = 10;
width = 700;
height = 500;
set(gcf,'position',[x0 y0 width height])

%Plot of longitudinal velocity
subplot(2,1,1)
plot(t1,vx_1,'linewidth',n),hold on, yline(130/3.6,'k--','linewidth',n),hold on, y2=yline(120/3.6,'m--','linewidth',n)
 y2.Color=[0.8 0.1 0.5];
grid on
title('Longitudinal velocity')
legend('Longitudinal velocity','v_{max}','v_{des}')
xlabel('time [s]')
ylabel('Longitudinal velocity [m/s]')
xlim([0 194.8])
x0 = 10;
y0 = 10;
width = 700;
height = 500;
set(gcf,'position',[x0 y0 width height])

%Plot of lateral acceleration
figure,
subplot(2,1,2)
plot(t1,ay_1,'linewidth',n), hold on,y1 = yline(1.5,'m--','linewidth',n),hold on,y2 = yline(-1.5,'m--','linewidth',n)
 y1.Color=[0.8 0.1 0.5];
 y2.Color=[0.8 0.1 0.5];
grid on
title('Lateral acceleration')
legend('Lateral acceleration','a_{lat}^{max}','a_{lat}^{min}')
xlabel('time [s]')
ylabel('Lateral acceleration [m/s^2]')
xlim([0 194.8])
x0 = 10;
y0 = 10;
width = 700;
height = 500;
set(gcf,'position',[x0 y0 width height])

%Plot of longitudinal acceleration
subplot(2,1,1)
plot(t1,ax_1,'linewidth',n),hold on,y1 = yline(2,'m--','linewidth',n),hold on,y2 = yline(-3,'m--','linewidth',n)
 y1.Color=[0.8 0.1 0.5];
 y2.Color=[0.8 0.1 0.5];
grid on
title('Longitudinal acceleration')
legend('Longitudinal acceleration','a_{lon}^{max}','a_{lon}^{min}')
xlabel('time [s]')
ylabel('Longitudinal acceleration [m/s^2]')
xlim([0 194.8])
x0 = 10;
y0 = 10;
width = 700;
height = 500;
set(gcf,'position',[x0 y0 width height])

% %Plot of steering angle
% figure,
% plot(t1,d1,'linewidth',n),hold on%,y1 = yline(1,'m--','linewidth',n),hold on,y2 = yline(-1,'m--','linewidth',n)
% grid on
% % txt1 ='23.5 [deg]'
% % text(5,0.9,txt1,'fontsize',10,'color','[0.8 0.1 0.5]')
% % txt2 ='-23.5 [deg]'
% % text(5,-0.9,txt2,'fontsize',10,'color','[0.8 0.1 0.5]')
% %  y1.Color=[0.8 0.1 0.5];
% %  y2.Color=[0.8 0.1 0.5];
% title('Steering angle')
% legend('\delta','\delta_{max}','\delta_{min}')
% xlabel('time [s]')
% ylabel('Steering angle [deg]')
% xlim([0 194.8])
% ylim([-1 1])
% x0 = 10;
% y0 = 10;
% width = 700;
% height = 500;
% set(gcf,'position',[x0 y0 width height])

% %OV-RE steering angle
% interval1 = find(t1>33.7, 1 ):find(t1<43.4, 1, 'last' );
% interval2 = find(t1>65.7, 1 ):find(t1<75.2, 1, 'last' );
% figure(10),
% plot(t1(interval1),d1(interval1)), hold on
% plot(t1(interval2),d1(interval2))
% grid on
% legend('Overtake','Reentry')
% xlabel('time [s]')
% ylabel('delta')
% title('Steering angle comparison')


% %Jerk
% figure,
% plot(t1,j1,'linewidth',n),hold on,y1 = yline(2.5,'m--','linewidth',n),hold on,y2 = yline(-2.5,'m--','linewidth',n)
%  y1.Color=[0.8 0.1 0.5];
%  y2.Color=[0.8 0.1 0.5];
% grid on
% title('Jerk')
% legend('Jerk','J_{max}','J_{min}')
% xlabel('time [s]')
% ylabel('Jerk [m/s^3]')
% xlim([0194.8])
% x0 = 10;
% y0 = 10;
% width = 700;
% height = 500;
% set(gcf,'position',[x0 y0 width height])
% 
% %Curvature
% figure,
% plot(t1,C1(1:length(t1)),'k','linewidth',1),hold on , y1=yline(1/500,'b','linewidth',1.5),y2=yline(-1/500,'b','linewidth',1.5),y3=yline(1/1000,'k','linewidth',1.5),y4=yline(-1/1000,'k','linewidth',1.5)
% y1.Color=[0.6 0.9 0.3];
% y2.Color=[0.9 0.5 0.5];
% y3.Color=[0.9 0.7 0];
% y4.Color=[0.9 0.5 1];
% grid on
% legend('Curvature','R_{min} left curve','R_{min} right curve','R_{bound} left curve','R_{bound} right curve')
% title('Curvature')
% xlabel('time [s]')
% ylabel('Curvature [m^-1]')
% xlim([0194.8])
% x0 = 10;
% y0 = 10;
% width = 700;
% height = 500;
% set(gcf,'position',[x0 y0 width height])
% 
% % %Relative distance
% ss_value = 2+(1.5*80/3.6);
% figure,
% plot(t1,d_rel_1(1:length(t1)),'linewidth',n),hold on, y1 = yline(ss_value,'r--','linewidth',n)
% %y1.Color=[0.7 0.9 0];
% grid on
% title('Relative distance with respect to the previous vehicle')
% legend('Relative distance','Safety distance')
% xlabel('time [s]')
% ylabel('Relative distance [m]')
% xlim([0 50])
% x0 = 10;
% y0 = 10;
% width = 700;
% height = 500;
% set(gcf,'position',[x0 y0 width height])
%}
%ACC-STEER_CNTR vs NN

n=1;
% figure,
% plot(t1,st_cntr_1(1:length(t1)),'linewidth',n)
% hold on
% plot(t1,st_nn_1(1:length(t1)),'linewidth',n)
% grid on
% title('CNTR vs NN steering angle')
% legend('CNTR','NN')
% xlabel('time [s]')
% ylabel('Steering angle [deg]')
% xlim([0 139])
% x0 = 10;
% y0 = 10;
% width = 700;
% height = 500;
% set(gcf,'position',[x0 y0 width height])

figure,
subplot(2,1,1)
plot(t1,st_cntr_1(1:length(t1)),'linewidth',n)
hold on
plot(t1,st_nn_1(1:length(t1)),'linewidth',n)
grid on
title('CNTR vs NN steering angle')
legend('CNTR','NN')
xlabel('time [s]')
ylabel('Steering angle [deg]')
xlim([0 139])
x0 = 10;
y0 = 10;
width = 700;
height = 500;
set(gcf,'position',[x0 y0 width height])
subplot(2,1,2)
plot(t1,acc_cntr_1(1:length(t1)),'linewidth',n)
hold on
plot(t1,acc_nn_1(1:length(t1)),'linewidth',n)
grid on
title('CNTR vs NN acceleration')
legend('CNTR','NN')
xlabel('time [s]')
ylabel('Acceleration [m/s^2]')
xlim([0 139])
x0 = 10;
y0 = 10;
width = 700;
height = 500;
set(gcf,'position',[x0 y0 width height])

%}
return
%% SCENARIO 2

load('Test_NN_LK_scenario_completo_1000_cut_Filtered_C.mat')

%Lateral_offsets
%L1_2=Lateral_offset_1;
%L2_2=Lateral_offset_2;
L3_2=Lateral_offset_3-1.75;
%L4_2=Lateral_offset_4;

%Time
t2=time;

%Lateral velocity
vy_2=ydot;

%Longitudinat velocity
vx_2=xdot;

%Lateral acceleratio
ay_2=yddot;

%Longitudinal acceleration
ax_2=xddot;

%Steering angle
d2=delta_deg;

%Jerk
%j2=jerk;

% %Delta delta 
% d_delta2=d_delta;

%Walls
%A2=A_LK;

%Relative distance
%d_rel_2=d_rel;

%Curvature
%C2 = Curv;

%% PLOTS 

n = 1;
%Plot of the Lateral offsets
figure,
 plot(t1,L3_1,'linewidth',n), hold on, plot(t1,L3_2,'linewidth',n), y3 = yline(0,'k--','linewidth',n+0.5),y1 = yline(0.9,'r','linewidth',n+0.5), y2 = yline(-0.9,'r','linewidth',n+0.5),  
 y1.Color=[0.9 0.6 0.2];
 y2.Color=[0.6 0.9 0.3];
grid on
title('Error with respect to the center of the lane')
legend('CNTR trajectory','NN trajectory','Center of the lane')%,'Left boundary','Right boundary')
xlabel('time [s]')
ylabel('Error with respect to the center of the lane')
xlim([0 240])
ylim([-0.2 0.2])
x0 = 10;
y0 = 10;
width = 700;
height = 400;
set(gcf,'position',[x0 y0 width height])


%Plot of lateral velocity
figure,
subplot(2,1,2)
plot(t1,vy_1,'linewidth',n)
hold on
plot(t1,vy_2,'linewidth',n)
grid on
title('Lateral velocity')
legend('CNTR Lateral velocity','NN Lateral velocity')
xlabel('time [s]')
ylabel('Lateral velocity [m/s]')
xlim([0 240])
x0 = 10;
y0 = 10;
width = 700;
height = 500;
set(gcf,'position',[x0 y0 width height])

%Plot of longitudinal velocity
subplot(2,1,1)
plot(t1,vx_1,'linewidth',n),hold on, plot(t1,vx_2,'linewidth',n),yline(130/3.6,'k--','linewidth',n),hold on, y2=yline(120/3.6,'m--','linewidth',n)
 y2.Color=[0.8 0.1 0.5];
grid on
title('Longitudinal velocity')
legend('CNTR Longitudinal velocity','NN Longitudinal velocity','v_{max}','v_{des}')
xlabel('time [s]')
ylabel('Longitudinal velocity [m/s]')
xlim([0 240])
x0 = 10;
y0 = 10;
width = 700;
height = 500;
set(gcf,'position',[x0 y0 width height])

%Plot of lateral acceleration
figure,
subplot(2,1,2)
plot(t1,ay_1,'linewidth',n), hold on,plot(t1,ay_2,'linewidth',n),y1 = yline(1.5,'m--','linewidth',n),hold on,y2 = yline(-1.5,'m--','linewidth',n)
 y1.Color=[0.8 0.1 0.5];
 y2.Color=[0.8 0.1 0.5];
grid on
title('Lateral acceleration')
legend('CNTR Lateral acceleration','NN Lateral acceleration')%,'a_{lat}^{max}','a_{lat}^{min}')
xlabel('time [s]')
ylabel('Lateral acceleration [m/s^2]')
ylim([-0.4 0.4])
xlim([0 240])
x0 = 10;
y0 = 10;
width = 700;
height = 500;
set(gcf,'position',[x0 y0 width height])



%Plot of longitudinal acceleration
subplot(2,1,1)
plot(t1,ax_1,'linewidth',n),hold on,plot(t1,ax_2,'linewidth',n),y1 = yline(2,'m--','linewidth',n),hold on,y2 = yline(-3,'m--','linewidth',n)
 y1.Color=[0.8 0.1 0.5];
 y2.Color=[0.8 0.1 0.5];
grid on
title('Longitudinal acceleration')
legend('CNTR Longitudinal acceleration','NN Longitudinal acceleration')%,'a_{lon}^{max}','a_{lon}^{min}')
xlabel('time [s]')
ylabel('Longitudinal acceleration [m/s^2]')
ylim([-0.7 0.7])
xlim([0 240])
x0 = 10;
y0 = 10;
width = 700;
height = 500;
set(gcf,'position',[x0 y0 width height])

%Plot of steering angle
figure,
plot(t1,d1,'linewidth',n),hold on,plot(t1,d2,'linewidth',n),y1 = yline(1,'m--','linewidth',n),hold on,y2 = yline(-1,'m--','linewidth',n)
grid on
% txt1 ='23.5 [deg]'
% text(5,0.13,txt1,'fontsize',10,'color','[0.8 0.1 0.5]')
% txt2 ='-23.5 [deg]'
% text(5,-0.13,txt2,'fontsize',10,'color','[0.8 0.1 0.5]')
%  y1.Color=[0.8 0.1 0.5];
%  y2.Color=[0.8 0.1 0.5];
title('Steering angle')
legend(' \delta CNTR' ,' \delta NN')
xlabel('time [s]')
ylabel('Steering angle [deg]')
ylim([-0.15 0.15])
xlim([0 240])
x0 = 10;
y0 = 10;
width = 700;
height = 400;
set(gcf,'position',[x0 y0 width height])

% %OV-RE steering angle
% interval1 = find(t1>33.7, 1 ):find(t1<43.4, 1, 'last' );
% interval2 = find(t1>65.7, 1 ):find(t1<75.2, 1, 'last' );
% figure(10),
% plot(t1(interval1),d1(interval1)), hold on
% plot(t1(interval2),d1(interval2))
% grid on
% legend('Overtake','Reentry')
% xlabel('time [s]')
% ylabel('delta')
% title('Steering angle comparison')


%Jerk
figure,
plot(t1,j1,'linewidth',n),hold on,plot(t1,j2,'linewidth',n),y1 = yline(2.5,'m--','linewidth',n),hold on,y2 = yline(-2.5,'m--','linewidth',n)
 y1.Color=[0.8 0.1 0.5];
 y2.Color=[0.8 0.1 0.5];
grid on
title('Jerk')
legend('CNTR Jerk','NN Jerk','J_{max}','J_{min}')
xlabel('time [s]')
ylabel('Jerk [m/s^3]')

%Curvature
figure,
plot(C1,'k','linewidth',n),hold on , y1=yline(1/500,'b','linewidth',n+0.5),y2=yline(-1/500,'b','linewidth',n+0.5),y3=yline(1/1000,'k','linewidth',n+0.5),y4=yline(-1/1000,'k','linewidth',n+0.5)
y1.Color=[0.6 0.9 0.3];
y2.Color=[0.9 0.5 0.5];
y3.Color=[0.9 0.7 0];
y4.Color=[0.9 0.5 1];
grid on
legend('Curvature','R_{min} left curve','R_{min} right curve','R_{bound} left curve','R_{bound} right curve')
title('Curvature')
xlabel('time [s]')
ylabel('Curvature [m^-1]')
%%
%Relative distance
ss_value = 2+(1.5*(80/3.6));
figure,
plot(t1,d_rel_1,'linewidth',1),hold on, yline(ss_value,'r--','linewidth',1)
xlim([0194.8])
%y1.Color=[0.7 0.9 0];
grid on
title('Relative distance with respect to the previous vehicle')
legend('Relative distance','Safety distance')
xlabel('time [s]')
ylabel('Relative distance [m]')












































