%Time
time=out.lat_off_1.time;

%Lateral offset data from ToWorkspace
Lateral_offset_1=out.lat_off_1.data;
Lateral_offset_2=out.lat_off_2.data;
Lateral_offset_3=out.lat_off_3.data;
Lateral_offset_4=out.lat_off_4.data;

%Lateral velocity
ydot=out.ydot.data;

%Longitudinal velocity

xdot=out.xdot.data;

%Lateral acceleration
yddot=out.yddot.data;

%Longitudinal acceleration
xddot=out.xddot.data;

%Steering angle
delta_deg=out.steer_ang.data*180/pi;

%Jerk
Ts=0.1;
jerk=(out.acc.data-out.acc_prev.data)/Ts;

%Delta delta
d_delta=((out.steer_ang.data)*180/pi-(out.steer_ang_prev.data)*180/pi);

%Walls
A_LK=out.APF_LK.data;

%Relative distance wrt the previous vehicle
%d_rel = out.Rel_pos1.signals.values(:,1);

%Curvature
Curv=out.curvature.data;

%Steering angle CNTR
st_cntr = out.steer_CNTR.data;

%Steering angle NN
st_nn = out.steer_NN.data;

%Acceleration CNTR
acc_cntr = out.acc_CNTR.data;

%Acceleration NN

acc_nn = out.acc_NN.data;

filename = 'Test_CNTR_LK_Torino_Pine.mat';

% save(filename,'time','Lateral_offset_1','Lateral_offset_2','Lateral_offset_3','Lateral_offset_4',...
%     'ydot','xdot','yddot','xddot','delta_deg','jerk','d_delta','A_LK','d_rel','Curv','st_cntr','st_nn',...
%     'acc_cntr','acc_nn')
save(filename,'time','Lateral_offset_1','Lateral_offset_2','Lateral_offset_3','Lateral_offset_4',...
    'ydot','xdot','yddot','xddot','delta_deg','jerk','d_delta','A_LK','Curv','st_cntr','st_nn',...
    'acc_cntr','acc_nn')
