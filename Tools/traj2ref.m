function [Ref_pose,Ref_curv] = traj2ref(Trajectory)

x_des = Trajectory(:,1);

ys = spline(Trajectory(:,1),Trajectory(:,2));

y_des = ppval(ys,x_des);

y_dot_des = [0;diff(y_des,1)];
x_dot_des = [0;diff(x_des,1)];

phi_des = atan2(y_dot_des,x_dot_des);

y_ddot_des = [0;diff(y_dot_des,1)];
x_ddot_des = [0;diff(x_dot_des,1)];

Ref_pose = [x_des y_des phi_des]';
Ref_curv = (x_dot_des.*y_ddot_des-y_dot_des.*x_ddot_des)./(x_dot_des.^2+y_dot_des.^2).^1.5;

end