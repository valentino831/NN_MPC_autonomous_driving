 function [t0_new,X,EFLAG,vdes] = optimizer(opt_mat,Con_acc,Con_jrk,...
acc_prev,VehData,Ts,egoState,ObjDet,LaneDet,current_lane,next_lane,...
lane_change,k_closest,head_t,S0,vdes,Hp,x0,u0,R,t0,next_state_LON) 

% ****************** INFO ON OPTIMIZATION PROBLEM: ******************

% STATE x = [x,y,psi,v,delta,y_dot,x_dot,psi_dot]
%   x_dot = [x_dot,y_dot,psi_dot,a,delta+ddelta,y_ddot,x_ddot,psi_ddot]
%
% COST FUNCTION: J = Qo'*APF_obj + Ql'*APF_lane + ...
%                    + (v-vdes)'*Qv*(v-vdes) + ...
%                    + dv'*Rv*dv + ddelta'*Rd*ddelta;
%
% OUTPUT -> x* = arg min J = [dv, ddelta]
%
% CONSTRAINTS:
%
%          0 <= v <= vdes
%     -0.2 m/s  <= dv <= 0.3 m/s
%       -30° <= delta <= 30°
%       -2.5° <= ddelta <= 2.5°
% 
%
% Aineq [dv      0]  
%       [0  ddelta] <= Bineq
%
% ineq_c(x) <= 0
%
% dv = vdes - v
% ddelta = delta_max - delta;

% *******************************************************************

t0_new   = 0;
X_prev   = zeros(Hp,2);
x_hat    = zeros(8,Hp);

% Predictions of the ego-obs distance
d_meas   = zeros(1,Hp);

% Referecence of the ego-obs distance
d_des    = zeros(1,Hp); 

APF_lane = zeros(Hp,1);

% Curv = LaneDet.LaneBoundaries(1).Curvature(end);
% 
% %Coordinate dei punti retta
% v_max = 130/3.6;
% v_min = 80/3.6;
% P_A=[0,v_max];
% P_B=[2e-3,v_min];
% 
% %Velocità di reference curvatura
% v_ref_c_ms =(P_A(2)-P_B(2))/(P_A(1)-P_B(1))*(abs(Curv)-P_A(1))+P_A(2);
%    
% vdes = min([v_ref_ms, v_ref_c_ms, sqrt(Con_acc.acc_lat_max./abs(Curv))]);

% OUTPUT constraints: (2) and (3)
ubd = [Con_acc.acc_max*ones(Hp,1)   235*pi/180*ones(Hp,1)];
lbd = [Con_acc.acc_min*ones(Hp,1)  -235*pi/180*ones(Hp,1)];

% Constraint on speed: (1)
A1 = [-tril(ones(Hp));  
       tril(ones(Hp))];
   
B1 = [x0(4)*ones(Hp,1);
      (1.01*vdes - x0(4))*ones(Hp,1)];

% Constraint on steering angle (4)
A2 = [-tril(ones(Hp));
       tril(ones(Hp))];
   
B2 = [(25*pi/180 - x0(5))*ones(Hp,1);
      (25*pi/180 + x0(5))*ones(Hp,1)];


% Constraints matrices 
Aineq = [     A1        zeros(2*Hp,Hp) ;
         zeros(2*Hp,Hp)     A2        ];
     
Bineq = [B1;B2];

options = optimoptions('fmincon','Display','Iter',...
    'OptimalityTolerance',.01,'SpecifyConstraintGradient', false,...
    'SpecifyObjectiveGradient', false,'Algorithm','sqp',...
    'FiniteDifferenceType','central');

[X,~,EFLAG,~] = fmincon(@(X)cost_function(X),u0,Aineq,Bineq,[],[],...
    lbd,ubd,@(X)nl_con(X),options);


function f = cost_function(X)
    
    x_hat    = zeros(8,Hp);
    
    % Check if computation is necessary
    if ~isequal(X,X_prev) 
        x_hat    = update_state(X);
        [t0_new,APF_lane] = lane_cntr(LaneDet,current_lane,next_lane,...
            lane_change,x_hat,Hp,t0,next_state_LON);
        d_meas  = obj_avoid(k_closest,egoState,LaneDet,ObjDet,...
            Ts,x_hat,R,Hp)';
        X_prev   = X; 
    end  
  
    vel_vect = x_hat(4,:);
    
    % Tracking reference = egoSpeed * th + S0
    d_des = x_hat(4,:)*head_t + S0;                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
    
    f = opt_mat.Ql*APF_lane + ...
        X(1:Hp,1)'*opt_mat.Qdv*X(1:Hp,1)+...
        X(1:Hp,2)'*opt_mat.Qddelta*X(1:Hp,2)+...
       (vel_vect-vdes)*opt_mat.Qv*(vel_vect-vdes)'+...
       (d_meas-d_des)*opt_mat.Qd*(d_meas-d_des)';
end

function x_hat = update_state(X)
    
    x_hat = compute_x_hat(X,x0,Hp,VehData);
    
end

function [ineq_c,eq_c] = nl_con(X)
    
    jerk_con = zeros(Hp,1);
        
    if ~isequal(X,X_prev)
        x_hat = update_state(X);
    end
    
    % 1 -> Enabled constraint
    % 0 -> Disabled constraint
    en_jrk = 1;
    en_dis = 1;
    
    
    % STEERING ANGLE NON-LINEAR CONSTRAINT ********************************

    % The longitudinal velocity is taken by the state prediction
    Vx = x_hat(7,:)'; 

    % If the x_dot(k) = 0 then approximate to 0.1
    if(abs(Vx) <= 0.1)
        Vx = 0.1*ones(Hp,1);
    end   

    h1 = [-Con_acc.acc_lat_min*ones(Hp,1);
          Con_acc.acc_lat_max*ones(Hp,1)];

    ineq_c = [-Vx.^2./VehData.ego_L.*tan(X(1:Hp,2)*Ts);
               Vx.^2./VehData.ego_L.*tan(X(1:Hp,2)*Ts)] - h1;

    % *********************************************************************
    
    if en_jrk
        % JERK NON-LINEAR CONSTRAINT **************************************
        for k = 1:Hp
            if(k == 1)
                jerk_con(k) = (X(k,1)-acc_prev)/Ts;
            else
                jerk_con(k) = (X(k,1)-X(k-1,1))/Ts;
            end
        end

        h2 = [-Con_jrk.jerk_min*ones(Hp,1);
               Con_jrk.jerk_max*ones(Hp,1)];

        jerk_c = [-jerk_con;jerk_con] - h2;

        ineq_c = [ineq_c;jerk_c];   
        % *****************************************************************
    end
    
    if en_dis
        % DISTANCE NON-LINEAR CONSTRAINT **********************************
        
        % Enabled only when distance control is active
        if(next_state_LON == 3)
   
            dist_vect = d_meas(:) - d_des(:);
            
            % Set a tolerance area of 90% of the desired distance
            h3 = 0.9*d_des(:);
            
            ineq_c = [ineq_c; -dist_vect(:) - h3];
        end
        % *****************************************************************
    end    

    eq_c = []; % There aren't equality constraints
                
end


end
     
        


