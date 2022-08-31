function steer_ang = lateral_control(Ref_poses,w_delta,ref_curv,egoState,x)

% % DATA
Ts = 0.1;

% Negative tire cornering stiffness
Cf = -98389;
Cr = -198142;

%Wheel base
L_wb = 1.7;

m = 1625;       % Mass of the Ego
Iz = 2865.61;   % Inertia in the Yaw axis

% Axle length
lr = 1.592;
lf = 1.108;
 
% % Reference longitudinal velocity
Vx = x(1);
Vy = x(2);
psi = x(3);
psi_dot = x(4);

% Approximation of the velocity
V = sqrt(Vx^2 + Vy^2);

% 
% %SYSTEM DEFINITION
A11 = -(Cf+Cr)/(m*V);
A12 = (Cf+Cr)/m;
A13 = (Cr*lr-Cf*lf)/(m*V);
A21 = (Cr*lr-Cf*lf)/(Iz*V);
A22 = -(Cr*lr-Cf*lf)/Iz;
A23 = -(Cr*lr^2+Cf*lf^2)/(Iz*V);

B11 = Cf/m;
B21 = Cf*lf/Iz;
B12 = (Cr*lr-Cf*lf)/(m*Vx)-Vx;
B22 = -(Cr*lr^2+Cf*lf^2)/(Iz*Vx);

% STATE-SPACE
A = [0 1 0 0;
    0 A11 A12 A13;
    0 0 0 1;
    0 A21 A22 A23];

B1 = [0 B11 0 B21]';

B2 = [0 B12 0 B22]';

C = [1 0 0 0];
% 
% sys_c = ss(A,B1,eye(4),0);
% sys_dt = c2d(sys_c,Ts);
% 
% Ad = expm(A*Ts);
% B1d = pinv(A)*(Ad-eye(4))*B1;
% Cd = C;
% Dd = 0;
% 
% % CONTROLLER DESIGN
Q = diag([1 0 0 100]);
R = 1;

K = lqrd(A,B1,Q,R,Ts);
%K = lqr(A,B1,Q,R);
%K = [0.0058    0.4553   -9.9813   -1.3690];

% M = -inv(A-B1*K);
% M1 = M*B1;
% M2 = M*B2;
% Kff = -M2(1)/M1(1);

x_des = Ref_poses(1,2);
y_des = Ref_poses(2,2);
psi_des = Ref_poses(3,2);
psi_dot_des = w_delta;

Kff = m*Vx^2/(lf+lr)*(lr/Cf - lf/Cr + lf/Cr*K(3))+(lf+lr) - lr*K(3);

e1=(egoState.Position(2)-y_des)*cos(psi_des)-(egoState.Position(1)-x_des)*sin(psi_des);
e2=psi-psi_des;
e1_dot=Vy+Vx*e2;
e2_dot=psi_dot-psi_dot_des;

e=[e1;e2;e1_dot;e2_dot];

steer_ang = psi_dot_des*Kff - K*e; 

