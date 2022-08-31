function obs = obs_find(LaneDet,ObjDet,ego_state,R)

obs = zeros(ObjDet.NumActors,6);

% Identification of the actors in the range of interest
for k = 1:ObjDet.NumActors
    dist = norm(ObjDet.Actors(k).Position);
    
    if(dist <= 120) % if the obstacle is in the range of 120m enter in the list
        
        obs(k,1) = ObjDet.Actors(k).Position(1);    % x
        obs(k,2) = ObjDet.Actors(k).Position(2);    % y
        obs(k,3) = ObjDet.Actors(k).Yaw * pi/180;   % Yaw(rad)
        obs(k,4) = norm(ObjDet.Actors(k).Velocity + ego_state.Velocity*R'); % || speed absolute obstacle ||
        obs(k,5) = which_lane([obs(k,1),obs(k,2)],LaneDet);
        obs(k,6) = ObjDet.Actors(k).AngularVelocity(3) * pi/180; % Yaw rate (rad)
        
        
    end
end