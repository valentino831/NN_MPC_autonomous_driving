%% RESULTS VISUALIZATION

% Vehicle colors
VehColors = [0 0.45 0.74;       % Blue
             0.85 0.33 0.1;     % Red
             0.93 0.69 0.13;    % Yellow
             0.49 0.18 0.56;    % Violet
             0.47 0.67 0.19];   % Green
         
ref_speed = 130; % km/h

% Velocities **************************************************************
figure,

% X - speed
subplot(311)
stairs(out.xdot.time,out.xdot.data,'Color',VehColors(1,:)),...
    xlabel('time[s]'),ylabel('Vel_x [m/s]');
yline(max_speed,'r--');
yline(ref_speed/3.6,'k--');
legend('Actual long. speed [m/s]','Speed limit [m/s]',...
    'Desired speed [m/s]','Location','northeast'); 
grid on;
title('Longitudinal Velocity');

% Y - speed
subplot(312)
stairs(out.ydot.time,out.ydot.data,'Color',VehColors(1,:))
xlabel('time[s]'),ylabel('Vel_y [m/s]');
grid on;
title('Lateral Velocity');

% Total - speed
subplot(313)
stairs(out.ydot.time,sqrt(out.ydot.data.^2 + out.xdot.data.^2),'Color',...
    VehColors(1,:)), xlabel('time[s]'),ylabel('Vel [m/s]');
yline(max_speed,'r--');
yline(ref_speed/3.6,'k--');
legend('Actual long. speed [m/s]','Speed limit [m/s]',...
    'Desired speed [m/s]','Location','northeast'); 
grid on;
title('Total ego Velocity');

% *************************************************************************

% Accelerations ***********************************************************
figure,

% X - acceleration
subplot(211)
stairs(out.xddot.time,out.xddot.data,'Color',VehColors(1,:)),...
    xlabel('time[s]'),ylabel('Acc_x [m/s^2]');
yline(acc_max,'r--');
yline(acc_min,'r--');
grid on;
title('Longitudinal Acceleration');

% Y - acceleration
subplot(212)
stairs(out.yddot.time,out.yddot.data,'Color',VehColors(1,:)),...
    xlabel('time[s]'),ylabel('Acc_y [m/s^2]');
yline(acc_lat_max,'r--');
yline(acc_lat_min,'r--');
grid on;
title('Lateral Acceleration');

% *************************************************************************

% Yaw rate / Yaw acceleration *********************************************
figure,

% Yaw - rate
subplot(211)
stairs(out.r.time,out.r.data,'Color',VehColors(1,:)),...
    xlabel('time[s]'),ylabel('Yaw rate [rad/s]');
grid on;
title('Yaw rate - \Psi_{dot}');

% Yaw - acceleration
subplot(212)
stairs(out.rdot.time,out.rdot.data,'Color',VehColors(1,:)),...
    xlabel('time[s]'),ylabel('Yaw acceleration [rad/s^2]');
grid on;
title('Yaw Acceleration - \Psi_{ddot}');

% *************************************************************************

% Steering Angle **********************************************************
figure,

% Steering angle - ON WHEELS
subplot(211)
stairs(out.steer_ang.time,out.steer_ang.data*180/pi,'Color',...
    VehColors(1,:)), xlabel('time[s]'),ylabel('steering angle [deg]');
yline(max_steer_ang,'r--');
yline(min_steer_ang,'r--');
grid on;
title('Steering angle \delta - on wheels');

% Steering angle - ON STEERING WHEEL
subplot(212)
stairs(out.steer_ang.time,out.steer_ang.data*180/pi*Rs,'Color',...
    VehColors(1,:)), xlabel('time[s]'),ylabel('steering angle [deg]');
yline(max_steer_ang*Rs,'r--');
yline(min_steer_ang*Rs,'r--');
grid on;
title('Steering angle \delta_{sw} - on steering wheel');

% *************************************************************************

% Jerk ********************************************************************

jerk = (out.acc.data-out.acc_prev.data)/Ts;

figure,
stairs(out.acc.time,jerk,'Color', VehColors(1,:));
xlabel('time[s]'), ylabel('jerk [m/s^3]')
yline(jerk_max,'r--')
yline(jerk_min,'r--')
grid on
title('Jerk')

% *************************************************************************

% Steering angle increment ************************************************

delta_incr = ((out.steer_ang.data)-(out.steer_ang_prev.data))*180/pi;

figure,
stairs(out.steer_ang.time,delta_incr,'Color',VehColors(1,:));
xlabel('time [s]'), ylabel('\Delta \delta [deg]');
yline(max_steer_inc,'r--')
yline(min_steer_inc,'r--')
title('Steering angle increment \Delta \delta')
grid on

%% Relative poses

newcolors = [0.5 0 0];
            %0 1 0];
% Red car (1)

figure,
plot(out.Rel_pos1.signals.values(:,2))
title('Relative position y obs1')
grid on

figure,

plot(out.steer_ang.time,1.25*ones(length(out.steer_ang.time)),'k--');
grid on;
hold on

area(out.xdot.time,(2 + 1.5*out.xdot.data));
        
colororder(newcolors)
plot(out.steer_ang.time,out.Rel_pos1.signals.values(:,1),'Color',VehColors(2,:)), grid on;
hold off
legend('Relative longitudinal distance [m]','collision limit [m]','Safe distance [m]','Location','northeast');
title('Relative distance');

figure,
subplot(211)
plot(out.steer_ang.time,out.Rel_vel1.signals.values(:,1),'Color',VehColors(2,:)), grid on;
legend('Relative longitudinal velocity [m/s]','Location','northeast');
title('Relative velocity');

subplot(212)
plot(out.steer_ang.time,out.Rel_vel1.signals.values(:,1) + out.xdot.data,'Color',VehColors(2,:)),grid on;
hold on
plot(out.xdot.time,out.xdot.data,'Color',VehColors(1,:));
legend('Red car longitudinal velocity [m/s]',...
    'egoVehicle longitudinal velocity [m/s]','Location','northeast');
title('Absolute actor velocity');

return

%% Yellow car (2)
figure,

plot(out.steer_ang.time,1.25*ones(length(out.steer_ang.time)),'k--');
grid on;
hold on

area(out.xdot.time,(2 + 1.5*out.xdot.data));
        
colororder(newcolors)
plot(out.steer_ang.time,out.Rel_pos2.signals.values(:,1),'Color',VehColors(3,:)), grid on;
hold off
legend('Relative longitudinal distance [m]','collision limit [m]','Safe distance [m]','Location','northeast');
title('Relative distance');

figure,
subplot(211)
plot(out.steer_ang.time,out.Rel_vel2.signals.values(:,1),'Color',VehColors(3,:)), grid on;
legend('Relative longitudinal velocity [m/s]','Location','northeast');
title('Relative velocity');

subplot(212)
plot(out.steer_ang.time,out.Rel_vel2.signals.values(:,1) + out.xdot.data,'Color',VehColors(3,:)),grid on;
hold on
plot(out.xdot.time,out.xdot.data,'Color',VehColors(1,:));
legend('Yellow car longitudinal velocity [m/s]',...
    'egoVehicle longitudinal velocity [m/s]','Location','northeast');
title('Absolute actor velocity');

%% Violet car (3)
figure,

plot(out.steer_ang.time,1.25*ones(length(out.steer_ang.time)),'k--');
grid on;
hold on

area(out.xdot.time,(2 + 1.5*out.xdot.data));
        
colororder(newcolors)
plot(out.steer_ang.time,out.Rel_pos3.signals.values(:,1),'Color',VehColors(4,:)), grid on;
hold off
legend('Relative longitudinal distance [m]','collision limit [m]','Safe distance [m]','Location','northeast');
title('Relative distance');

figure,
subplot(211)
plot(out.steer_ang.time,out.Rel_vel3.signals.values(:,1),'Color',VehColors(4,:)), grid on;
legend('Relative longitudinal velocity [m/s]','Location','northeast');
title('Relative velocity');

subplot(212)
plot(out.steer_ang.time,out.Rel_vel3.signals.values(:,1) + out.xdot.data,'Color',VehColors(4,:)),grid on;
hold on
plot(out.xdot.time,out.xdot.data,'Color',VehColors(1,:));
legend('Violet car longitudinal velocity [m/s]',...
    'egoVehicle longitudinal velocity [m/s]','Location','northeast');
title('Absolute actor velocity');

%% Green car (4)
figure,

plot(out.steer_ang.time,1.25*ones(length(out.steer_ang.time)),'k--');
grid on;
hold on

area(out.xdot.time,(2 + 1.5*out.xdot.data));
        
colororder(newcolors)
plot(out.steer_ang.time,out.Rel_pos4.signals.values(:,1),'Color',VehColors(5,:)), grid on;
hold off
legend('Relative longitudinal distance [m]','collision limit [m]','Safe distance [m]','Location','northeast');
title('Relative distance');

figure,
subplot(211)
plot(out.steer_ang.time,out.Rel_vel4.signals.values(:,1),'Color',VehColors(5,:)), grid on;
legend('Relative longitudinal velocity [m/s]','Location','northeast');
title('Relative velocity');

subplot(212)
plot(out.steer_ang.time,out.Rel_vel4.signals.values(:,1) + out.xdot.data,'Color',VehColors(5,:)),grid on;
hold on
plot(out.xdot.time,out.xdot.data,'Color',VehColors(1,:));
legend('Green car longitudinal velocity [m/s]',...
    'egoVehicle longitudinal velocity [m/s]','Location','northeast');
title('Absolute actor velocity');



