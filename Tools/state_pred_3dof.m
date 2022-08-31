function x_hat = state_pred_3dof(VehData,prev_x,u)

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

af = atan2((prev_x(6) + VehData.lf*prev_x(8)),prev_x(7)) - prev_x(5);
ar = atan2(prev_x(6) - VehData.lr*prev_x(8),prev_x(7));
mu = 1;
Fznom = 3000;
h = 0.35;

x_hat = zeros(8,1);

Vx = prev_x(7);%prev_x(4)*cos(prev_x(3)); 

x_hat(1) = prev_x(1) + Ts*prev_x(4)*cos(prev_x(3));
x_hat(2) = prev_x(2) + Ts*prev_x(4)*sin(prev_x(3));
x_hat(3) = prev_x(3) + Ts*prev_x(4)/VehData.ego_L*tan(prev_x(5));
x_hat(4) = x_hat(4) + Ts*u(1);
x_hat(5) = u(2);
x_hat(6) = prev_x(6) +Ts*(-Vx*prev_x(8) + VehData.Cf*af*mu*(VehData.lr*9.81-u(1)*h)/(VehData.ego_L*Fznom)*cos(prev_x(5))...
           - u(1)*sin(prev_x(5)) - VehData.Cr*ar*mu*((VehData.lf*9.81 + ...
            u(1)*h)/VehData.ego_L)*cos(prev_x(5)));
x_hat(7) = prev_x(7) + Ts*(prev_x(6)*prev_x(8) + u(1));
x_hat(8) = prev_x(8) + Ts*(VehData.lf*VehData.Cf*af*mu*(VehData.lr*VehData.m*9.81 -...
    VehData.m*u(1)*h)/(Fznom*VehData.ego_L*VehData.Iz)*cos(prev_x(5)) + ...
    VehData.lr*VehData.m*u(1)*sin(prev_x(5))/VehData.Iz - ...
    VehData.Cr*ar*mu*(VehData.lf*VehData.m*9.81 + ...
    VehData.m*u(1)*h)/(VehData.Iz*VehData.ego_L)*cos(prev_x(5)));
