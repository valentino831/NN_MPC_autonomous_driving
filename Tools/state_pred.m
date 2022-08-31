function x_hat = state_pred(VehData,prev_x,u)

Ts = 0.1;

%% NL MODEL 1-STEP SIMULATION

% Inputs: (delta0 + ddelta)(k), a(k)

% KINEMATIC EQUATIONS (DT):
% x(k+1) = x(k) + Ts*v(k)*cos(theta)
% y(k+1) = y(k) + Ts*v(k)*sin(theta)
% theta(k+1) = theta(k) + Ts*v(k)/egoL*tan(delta)
% v(k+1) = v(k) + Ts*a(k)
% delta(k+1) = (delta0 + ddelta)(k)

% DYNAMIC EQUATIONS (CT):
% ydd = Vy*(-(Cf+Cr)/(m*Vx) + thetad*(Cr*lr-Cf*lf-m*Vx^2/(m*Vx))+Cf/m*delta
% xdd = a*cos(delta) + ydot*psidot
% thetadd = Vy*(Cr*lr-Cf*lf)/(Iz*Vx) - thetad*(Cr*lr^2 + Cf*lf^2)/(Iz*Vx) +
% Cf*lf/m*delta(k)

% KINEMATIC EQUATIONS 
% A = [ 1 0 0 Ts*cos(prev_x(3)) 0;
%       0 1 0 Ts*sin(prev_x(3)) 0;
%       0 0 1 Ts/egoL*tan(prev_x(5)) 0;
%       0 0 0 1 0;
%       0 0 0 0 1];
%   
% B = [0 0;
%      0 0;
%      0 0;
%      1 0;
%      0 1/100];

% Vehicle specification
Cr = VehData.Cr;
Cf = VehData.Cf;
lf = VehData.lf;
lr = VehData.lr;

Iz = VehData.Iz;
m = VehData.m;

ego_L = VehData.ego_L;


Vx = prev_x(7);%prev_x(4)*cos(prev_x(3)); 

D1 = -(Cf+Cr)/(m*Vx);
D2 = (Cr*lr-Cf*lf-m*Vx^2)/(m*Vx);
D3 = (Cr*lr-Cf*lf)/(Iz*Vx);
D4 = -(Cr*lr^2 + Cf*lf^2)/(Iz*Vx);

B1 = Cf/m;
B2 = Cf*lf/Iz;

% Continuous time NL model
Ac = [  0 0 0 cos(prev_x(3)) 0 0 0 0;
        0 0 0 sin(prev_x(3)) 0 0 0 0;
        0 0 0 tan(prev_x(5))/ego_L 0 0 0 0;
        0 0 0 0 0 0 0 0;
        0 0 0 0 0 0 0 0;
        0 0 0 0 0 D1 0 D2;
        0 0 0 0 0 0 0 prev_x(6);
        0 0 0 0 0 D3 0 D4];
    
Bc = [  0 0;
        0 0;
        0 0;
        1 0;
        0 1;
        0 B1;
        1 0;
        0 B2];
    

ct_sys = [Ac Bc;zeros(2,8),eye(2)];

% Discretization
dt_sys = expm(ct_sys*Ts);

% Ad = expm(Ac*Ts);
% Bd = pinv(Ac)*(Ad-eye(7))*Bc;

Ad = dt_sys(1:8,1:8);
Bd = dt_sys(1:8,9:10);

x_hat = Ad*prev_x + Bd*u';


