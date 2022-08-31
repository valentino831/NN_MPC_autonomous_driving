close all
clc

%% --- SCENARIO 1

load('LatOffset_1.mat')

%Lateral_offsets
L1_1=Lateral_offset_1;
L2_1=Lateral_offset_2;
L3_1=Lateral_offset_3;
L4_1=Lateral_offset_4;

%Time
t=time;

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

%Plot of the Lateral offsets
figure,
plot(t,L1_1), hold on, plot(t,L2_1), hold on, plot(t,L3_1), hold on, plot(t,L4_1), hold on,...
    yline(1.75,'r--'), hold on, yline(-1.75,'r--')
grid on
title('Lateral offsets scenario 1')
legend('Latoff1','Latoff2','Latoff3','Latoff4')
xlabel('time/samples [t/Ts]')
ylabel('Lanes')

%Plot of lateral velocity
figure,
plot(t,vy_1)
grid on
title('Lateral velocity scenario 1')
legend('Lateral velocity')
xlabel('time/samples [t/Ts]')
ylabel('vy')

%Plot of steering angle
figure,
plot(t,d1)
grid on
title('Steering angle scenario 1')
legend('Delta 1')
xlabel('time/samples [t/Ts]')
ylabel('delta')

%% --- SCENARIO 2

load('LatOffset_3')

%Lateral_offsets
L1_2=Lateral_offset_1;
L2_2=Lateral_offset_2;
L3_2=Lateral_offset_3;
L4_2=Lateral_offset_4;

%Time
t=time;

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

%Plot of the Lateral offsets 
figure,
plot(t,L1_2), hold on, plot(t,L2_2), hold on, plot(t,L3_2), hold on, plot(t,L4_2)
grid on
title('Lateral offsets scenario 2')
legend('Latoff1','Latoff2','Latoff3','Latoff4')
xlabel('time/samples [t/Ts]')
ylabel('Lanes')

%Plot of lateral velocity
figure,
plot(t,vy_2)
grid on
title('Lateral velocity scenario 2')
legend('Lateral velocity')
xlabel('time/samples [t/Ts]')
ylabel('vy')

%Plot of steering angle
figure,
plot(t,d2)
grid on
title('Steering angle scenario 2')
legend('Delta 2')
xlabel('time/samples [t/Ts]')
ylabel('delta')

%% --- SUPERPOSITION OF THE TWO SCENARIOS

%Lateral offset
figure,
plot(t,L1_1,'b'), hold on, plot(t,L2_1,'b'), hold on, plot(t,L3_1,'b'), hold on, plot(t,L4_1,'b'), hold on,...
    plot(t,L1_2,'k--'), hold on, plot(t,L2_2,'k--'), hold on, plot(t,L3_2,'k--'), hold on, plot(t,L4_2,'k--'), hold on,...
    yline(1.75,'r--'), hold on, yline(-1.75,'r--')
grid on
title('Lateral offsets comparison')
legend('Latoff1_1','Latoff2_1','Latoff3_1','Latoff4_1','Latoff1_2','Latoff2_2','Latoff3_2','Latoff4_2','Ubd','Lbd')
xlabel('time/samples [t/Ts]')
ylabel('Lanes')

ylim([1.74 1.78])
xlim([800 803])

%Lateral velocity
figure,
plot(t,vy_1), hold on, plot(t,vy_2)
grid on
title('Lateral velocity comparison')
legend('Lateral velocity 1','Lateral velocity 2')
xlabel('time/samples [t/Ts]')
ylabel('vy')

%Longitudinal velocity
figure,
plot(t,vx_1), hold on, plot(t,vx_2)
grid on
title('Longitudinal velocity comparison')
legend('Longitudinal velocity 1','Longitudinal velocity 2')
xlabel('time/samples [t/Ts]')
ylabel('vx')

%Lateral acceleration
figure,
plot(t,ay_1), hold on, plot(t,ay_2)
grid on
title('Lateral acceleration comparison')
legend('Lateral acceleration 1','Lateral acceleration 2')
xlabel('time/samples [t/Ts]')
ylabel('ay')

%Longitudinal acceleration
figure,
plot(t,ay_1), hold on, plot(t,ay_2)
grid on
title('Longitudinal acceleration comparison')
legend('Longitudinal acceleration 1','Longitudinal acceleration 2')
xlabel('time/samples [t/Ts]')
ylabel('ax')

%Steering angle
figure,
plot(t,d1), hold on, plot(t,d2)
grid on
title('Steering angle comparison')
legend('Steering angle 1','Steering angle 2')
xlabel('time/samples [t/Ts]')
ylabel('delta')

%Jerk
figure,
plot(t,j1), hold on, plot(t,j2)
grid on
title('Jerk comparison')
legend('Jerk 1','Jerk 2')
xlabel('time/samples [t/Ts]')
ylabel('jerk')



