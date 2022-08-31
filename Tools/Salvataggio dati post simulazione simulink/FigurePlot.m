close all
clc

%% --- SCENARIO 1

load('Test_CNTR_OV_scenario_completo_500.mat')

%Lateral_offsets
L1_1=Lateral_offset_1;
L2_1=Lateral_offset_2;
L3_1=Lateral_offset_3;
L4_1=Lateral_offset_4;

%Time
t1=time;

%Lateral velocity
vy_1=ydot;

%Longitudinat velocity
vx_1=xdot;

%Lateral acceleratio
ay_1=yddot;

%Longitudinal acceleration
ax_1=xddot;

%Steering angle
d1=delta_deg;

%Jerk
j1=jerk;

% %Delta delta 
% d_delta1=d_delta;

%Walls
A1=A_LK;

%Relative distance wrt the previous vehicle
%d_rel_1=d_rel;

%Curvature
C1 = Curv;

%Steering angle CNTR
st_cntr_1 = st_cntr;

%Steering angle NN
st_nn_1 = st_nn;

%Acceleration CNTR
acc_cntr_1 = acc_cntr;

%Acceleration NN
acc_nn_1 = acc_nn;

%% PLOTS
%{
%Plot of the Lateral offsets
figure,
plot(t1,L1_1), hold on, plot(t1,L2_1), hold on, plot(t1,L3_1), hold on, plot(t1,L4_1), hold on,...
    yline(1.75,'m--'), hold on, yline(-1.75,'m--')
%ylim([1.7 1.8])
grid on
title('Lateral offsets scenario 1')
legend('Latoff1','Latoff2','Latoff3','Latoff4')
xlabel('time [s]')
ylabel('Lanes')

% subplot(2,1,2)
% plot(t1,L3_1), hold on,yline(1.75,'m--'),hold on,yline(1.75+(1.75*1/100),'c'),hold on,yline(1.75-(1.75*1/100),'c'),...
%     %hold on, yline(-1.75+(-1.75*1/100),'c'),hold on, yline(-1.75-(-1.75*1/100),'c')
% grid on
% title('Lateral offset 3 scenario 1')
% legend('Latoff3','Steady state value')
% xlabel('time [s]')
% ylabel('Lane 3')

%Plot of lateral velocity
figure,
subplot(2,1,1)
plot(t1,vy_1)
grid on
title('Lateral velocity scenario 1')
legend('Lateral velocity')
xlabel('time [s]')
ylabel('vy')

%Plot of longitudinal velocity
subplot(2,1,2)
plot(t1,vx_1),hold on, yline(130/3.6,'k--'),hold on, yline(120/3.6,'m--')
grid on
title('Longitudinal velocity scenario 1')
legend('Longitudinal velocity','Maximum velocity','Desired velocity')
xlabel('time [s]')
ylabel('vx')

%Plot of lateral acceleration
figure,
subplot(2,1,1)
plot(t1,ay_1), hold on,yline(1.5,'m--'),hold on,yline(-1.5,'m--')
grid on
title('Lateral acceleration scenario 1')
legend('Lateral acceleration','Ubd','Lbd')
xlabel('time [s]')
ylabel('ay')

%Plot of longitudinal acceleration
subplot(2,1,2)
plot(t1,ax_1),hold on,yline(2,'m--'),hold on,yline(-2.5,'m--')
grid on
title('Longitudinal acceleration scenario 1')
legend('Longitudinal acceleration','Ubd','Lbd')
xlabel('time [s]')
ylabel('ax')

%Plot of steering angle
figure,
plot(t1,d1),hold on,yline(1,'m--'),hold on,yline(-1,'m--')
grid on
title('Steering angle scenario 1')
legend('Delta 1','Ubd','Lbd')
xlabel('time [s]')
ylabel('delta')

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
plot(t1,j1),hold on,yline(2.5,'m--'),hold on,yline(-2.5,'m--')
grid on
title('Jerk')
legend('Jerk 1','Ubd','Lbd')
xlabel('time [s]')
ylabel('jerk')

%Walls
figure,
plot(t1,A1)
grid on
title('APF LK Amplitude')
xlabel('time [s]')
ylabel('amplitude')

%Relative distance
ss_value = 2+(1.5*(90/3.6));
figure,
plot(t1,d_rel_1),hold on,yline(ss_value,'m--')
grid on
title('Relative distance with respect to the previous vehicle 1')
xlabel('time [s]')
ylabel('relative distance [m]')

%Curvature
figure,
plot(C1,'r'),hold on,yline(1/500,'b'),yline(-1/500,'b'),yline(1/1000,'k'),yline(-1/1000,'k')
grid on
title('Curvature 1')
xlabel('time [s]')
ylabel('Curvature')

%Steering angle CNTR vs NN
figure,
plot(t1,st_cntr_1), hold on, plot(t1,st_nn_1)
legend('Real steering angle','Estimated steering angle')
grid on
title('Real steering angle vs estimated steering angle')
xlabel('time [s]')
ylabel('Steering angle')

%Acceleration CNTR vs NN
figure,
plot(t1,acc_cntr_1), hold on, plot(t1,acc_nn_1)
legend('Real acceleration','Estimated acceleration')
grid on
title('Real acceleration vs estimated acceleration')
xlabel('time [s]')
ylabel('Acceleration')

%% Errors

%N = length(st_

%}

%% --- SCENARIO 2

load('Test_NN_LK_scenario_completo.mat')

%Lateral_offsets
L1_2=Lateral_offset_1;
L2_2=Lateral_offset_2;
L3_2=Lateral_offset_3;
L4_2=Lateral_offset_4;

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
j2=jerk;

% %Delta delta 
% d_delta2=d_delta;

%Walls
A2=A_LK;

%Relative distance
%d_rel_2=d_rel;

%Curvature
C2 = Curv;

%% PLOTS
%{
%Plot of the Lateral offsets 
figure,
subplot(2,1,1)
plot(t2,L1_2), hold on, plot(t2,L2_2), hold on, plot(t2,L3_2), hold on, plot(t2,L4_2), hold on, yline(1.75,'m--'), hold on, yline(-1.75,'m--')
%ylim([1.7 1.8])
grid on
title('Lateral offsets scenario 2')
legend('Latoff1','Latoff2','Latoff3','Latoff4')
xlabel('time [s]')
ylabel('Lanes')

subplot(2,1,2)
plot(t1,L3_2), hold on,yline(1.75,'m--')
grid on
title('Lateral offset 3 scenario 2')
legend('Latoff3','Steady state value')
xlabel('time [s]')
ylabel('Lane 3')

%Plot of lateral velocity
figure,
subplot(2,1,1)
plot(t2,vy_2)
grid on
title('Lateral velocity scenario 2')
legend('Lateral velocity')
xlabel('time [s]')
ylabel('vy')

%Plot of longitudinal velocity
subplot(2,1,2)
plot(t2,vx_2), hold on, yline(130/3.6,'k--'),yline(120/3.6,'m--')
grid on
title('Longitudinal velocity scenario 2')
legend('Longitudinal velocity','Maximum velocity','Desired velocity')
xlabel('time [s]')
ylabel('vx')

%Plot of lateral acceleration
figure,
subplot(2,1,1)
plot(t2,ay_2), hold on,yline(1.5,'m--'),hold on,yline(-1.5,'m--')
grid on
title('Lateral acceleration scenario 2')
legend('Lateral acceleration','Ubd','Lbd')
xlabel('time [s]')
ylabel('ay')

%Plot of longitudinal acceleration
subplot(2,1,2)
plot(t2,ax_2), hold on,yline(2,'m--'),hold on,yline(-2.5,'m--')
grid on
title('Longitudinal acceleration scenario 2')
legend('Longitudinal acceleration','Ubd','Lbd')
xlabel('time [s]')
ylabel('ax')

%Plot of steering angle
figure,
plot(t2,d2), hold on,yline(1,'m--'),hold on,yline(-1,'m--')
grid on
title('Steering angle scenario 2')
legend('Delta 2','Ubd','Lbd')
xlabel('time [s]')
ylabel('delta')

%Jerk
figure,
plot(t2,j2), hold on,yline(1.8,'m--'),hold on,yline(-0.9,'m--')
grid on
title('Jerk scenario 2')
legend('Jerk 2','Ubd','Lbd')
xlabel('time [s]')
ylabel('jerk')

%Wall
figure,
plot(t2,A2)
grid on
title('APF LK Amplitude')
xlabel('time [s]')
ylabel('amplitude')

%Relative distance
ss_value = 2+(1.5*(100/3.6));
figure,
plot(t2,d_rel_2),hold on,yline(ss_value,'m--')
grid on
title('Relative distance with respect to the previous vehicle 2')
xlabel('time [s]')
ylabel('relative distance [m]')

%Curvature
figure,
plot(t2,C2,'r'),hold on,yline(1/500,'b'),yline(-1/500,'b'),yline(1/1000,'y'),yline(-1/1000,'y')
grid on
title('Curvature 2')
xlabel('time [s]')
ylabel('Curvature')
%}

%% --- SUPERPOSITION OF THE TWO SCENARIOS

if (length(t1) > length(t2))
    t=t2;
else
    t=t1;
end

%Lateral offset
figure,
plot(t,L1_1(1:length(t)),'b'), hold on, plot(t,L2_1(1:length(t)),'b'), hold on, plot(t,L3_1(1:length(t)),'b'), hold on, plot(t,L4_1(1:length(t)),'b'), hold on,...
    plot(t,L1_2(1:length(t)),'k--'), hold on, plot(t,L2_2(1:length(t)),'k--'), hold on, plot(t,L3_2(1:length(t)),'k--'), hold on, plot(t,L4_2(1:length(t)),'k--'), hold on,...
    yline(1.75,'r--'), hold on, yline(-1.75,'r--')

grid on
title('Lateral offsets comparison')
legend('Latoff1_1','Latoff2_1','Latoff3_1','Latoff4_1','Latoff1_2','Latoff2_2','Latoff3_2','Latoff4_2','Ubd','Lbd')
xlabel('time [s]')
ylabel('Lanes')


% subplot(2,1,2)
% plot(t,L3_1(1:length(t)),'b'),hold on,plot(t,L3_2(1:length(t)),'k--'),hold on,...
% yline(1.75,'r--'), hold on, yline(1.75+(1.75*1/100),'c'),hold on, yline(1.75-(1.75*1/100),'c'),xline(3.4),...
% %hold on, yline(-1.75+(-1.75*1/100),'c'),hold on, yline(-1.75-(-1.75*1/100),'c')
% grid on
% title('Lateral offsets comparison')
% legend('Latoff3_1','Latoff3_2','Ubd')
% xlabel('time [s]')
% ylabel('Lanes 3')

%Lateral velocity
figure,
subplot(2,1,1)
plot(t,vy_1(1:length(t))), hold on, plot(t,vy_2(1:length(t)))
grid on
title('Lateral velocity comparison')
legend('Lateral velocity 1','Lateral velocity 2')
xlabel('time [s]')
ylabel('vy')

%Longitudinal velocity
subplot(2,1,2)
plot(t,vx_1(1:length(t))), hold on, plot(t,vx_2(1:length(t)))
yline(130/3.6,'k--')
yline(120/3.6,'m--')
grid on
title('Longitudinal velocity comparison')
legend('Longitudinal velocity 1','Longitudinal velocity 2','Max speed','Desired speed')
xlabel('time [s]')
ylabel('vx')

%Lateral acceleration
figure,
subplot(2,1,1)
plot(t,ay_1(1:length(t))), hold on, plot(t,ay_2(1:length(t)))
yline(1.5,'m--')
yline(-1.5,'m--')
grid on
title('Lateral acceleration comparison')
legend('Lateral acceleration 1','Lateral acceleration 2','Ubd','Lbd')
xlabel('time [s]')
ylabel('ay')


%Longitudinal acceleration
subplot(2,1,2)
plot(t,ax_1(1:length(t))), hold on, plot(t,ax_2(1:length(t)))
yline(2,'m--')
yline(-2.5,'m--')
grid on
title('Longitudinal acceleration comparison')
legend('Longitudinal acceleration 1','Longitudinal acceleration 2','Ubd','Lbd')
xlabel('time [s]')
ylabel('ax')



%Steering angle
figure,
%subplot(2,1,1)
plot(t,d1(1:length(t))), hold on, plot(t,d2(1:length(t)))
yline(1,'m--')
yline(-1,'m--')
grid on
title('Steering angle comparison')
legend('Steering angle 1','Steering angle 2','Ubd','Lbd')
xlabel('time [s]')
ylabel('delta')


%Overtake-Reentry manouver
% yov=d1(33.7:43.2);
% yre=d1(65.7:75.2);
% time=linspace(1,10,1);
% 
% figure,
% plot(time,yov),hold on,plot(time,-yre),grid on

% figure,
% plot(t,d1(1:length(t))), hold on, plot(t,d2(1:length(t)))
% xlim([33.7 43.2])
% grid on
% title('Steering angle comparison')
% legend('Steering angle 1','Steering angle 2')
% xlabel('time [s]')
% ylabel('delta')
% 
% hold on 
% plot(t,d1(1:length(t))), hold on, plot(t,d2(1:length(t)))
% xlim([65.7 75.2])

% %Delta delta
% subplot(2,1,2)
% plot(d_delta1),hold on,plot(d_delta2)
% yline(2.35,'r--')
% yline(-2.35,'r--')
% title('Steering angle increment comparison')
% legend('d_delta1','d_delta2','Ubd','Lbd')
% xlabel('time [t]')
% ylabel('d_delta [deg]')
% grid on

%Jerk
figure,
plot(t,j1(1:length(t))), hold on, plot(t,j2(1:length(t)))
yline(2.5,'m--')
yline(-2.5,'m--')
grid on
title('Jerk comparison')
legend('Jerk 1','Jerk 2','Ubd','Lbd')
xlabel('time [s]')
ylabel('jerk')

%Walls
figure,
plot(t,A1(1:length(t))),hold on,plot(t,A2(1:length(t)))
grid on
title('APF LK Amplitude comparison')
xlabel('time [s]')
ylabel('amplitude')
legend('APF LK 1','APF LK 2')

% Relative distance
% ss_value = 2+(1.5*(100/3.6));
% figure,
% plot(t,d_rel_1(1:length(t))),hold on,plot(t,d_rel_2(1:length(t))),yline(ss_value,'m--')
% grid on
% title('Relative distance with respect to the previous vechicle comparison')
% xlabel('time [s]')
% ylabel('relative distance [m]')

%Curvature
figure,
plot(C1,'r'),hold on,plot(C2,'m'),yline(1/500,'b'),yline(-1/500,'b'),yline(1/1000,'y'),yline(-1/1000,'y')
grid on
legend('Curvature 1','Curvature 2')
title('Curvature 1')
xlabel('time [s]')
ylabel('Curvature')

% %Steering angle comparison: CNTR vs NN
% figure,
% plot(t,st_cntr_1(1:length(t))),hold on,plot(t,st_cntr_2(1:length(t)))
% grid on
% title('Steering angle CNTR ')
% xlabel('time [s]')
% ylabel('amplitude')
% legend('APF LK 1','APF LK 2')



