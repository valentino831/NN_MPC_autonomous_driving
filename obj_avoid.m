function dist_k_closest = obj_avoid(k_closest,egoState,LaneDet,ObjDet,Ts,x_hat,R,Hp)

%% DATA
dist_k_closest = zeros(Hp,1);

% Update the list of obstacles that are actually seen by the vehicle
obs = obs_find(LaneDet,ObjDet,egoState,R);

% Update the predictions of the obstacles
obs_hat = obs_state_pred(Ts,Hp,obs);

% If there is a vehicle to be hooked
if(~isempty(k_closest))
    for t = 1:Hp
        j = k_closest;
        
        % Obstacle pose
        Xo   = obs_hat.xo_hat(t,j);
        Yo   = obs_hat.yo_hat(t,j);
        Psio = obs_hat.psi_hat(t,j);
        
        % Ego pose
        X   = x_hat(1,t);
        Y   = x_hat(2,t);
        
        % Rotation of the ego of Psi0
        X1 =  X*cos(Psio)+Y*sin(Psio);
        Y1 = -X*sin(Psio)+Y*cos(Psio);
        
        % Rotation of the repulsive obstacle potential field
        X01 =  Xo*cos(Psio)+Yo*sin(Psio);
        Y01 = -Xo*sin(Psio)+Yo*cos(Psio);
        
        %Relative distance wrt the closest vehicle in the same lane of the
        %ego vehicle
        dist_k_closest(t)=sqrt((X01-X1)^2+(Y01-Y1)^2);
      
               
    end
end
