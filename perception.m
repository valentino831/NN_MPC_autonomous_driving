function [next_lane,actual_lane,lane_change,vdes,k_closest,...
    next_state_LAT,next_state_LON,flag_lane] = perception(prev_state_LAT,...
    vdes_ms,egoState, R, ObjDet, LaneDet, prev_curr_lane,...
    lane_change, x0,prev_flag_lane,head_t,S0)

% In order to accomplish the OVERTAKE, 4 conditions must be satisfied:
% 1) The next lane must exist
% 2) There must be a vehicle in front of the ego vehicle proceding with a
% slower velocity
% 3) in the left lane there mustn't be any vehicle, or eventually the
% vehicle must be relatively slower wrt the ego (if the vehicle is behind)
% or relatively faster wrt the ego (if the vehicle is in front)
% 4) the distance from the vehicle in front have to be less or equal the safe_d

% In order to accomplish the RE-ENTRY,
% 1) The previous lane must exist
% 2) in the right lane there mustn't be any vehicle, or eventually the
% vehicle must be relatively slower/faster wrt the ego
% *************************************************************************

% Data initialization
ovt_cond = [0 0 0 0];
reentry_cond = [0 0];

Curv = LaneDet.LaneBoundaries(1).Curvature(end);

if(abs(Curv) > 1000)
    th = 0.2;
else
    th = 0.1;
end
vdes = vdes_ms;
k_closest   = [];

% Actual safety distance
safe_d = S0 + head_t*norm(egoState.Velocity);
actual_lane = which_lane([0 0],LaneDet); % Where I am currently

flag_lane = prev_flag_lane;
next_state_LAT = prev_state_LAT;

if(prev_curr_lane < LaneDet.NumLaneBoundaries-1)
    ovt_cond(1) = 1;
end

if(prev_curr_lane > 1)
    reentry_cond(1) = 1;
end

% Update the vehicle seen
obs = obs_find(LaneDet,ObjDet,egoState,R);

% When the vehicle crosses the lane line
if prev_curr_lane~=actual_lane
    flag_lane = 1;
end

if(flag_lane == 1)
    next_lane = actual_lane;
else
    next_lane = actual_lane + lane_change;
end

%% CHECK IF THE OVERTAKE MANEUVER IS COMPLETED


% Identifies the centers of the lanes in order to check how far the ego is
laneCenter = [(LaneDet.LaneBoundaries(4-next_lane).Coordinates(:,1)+...
    LaneDet.LaneBoundaries(4-next_lane+1).Coordinates(:,1))/2, ...
            (LaneDet.LaneBoundaries(4-next_lane).Coordinates(:,2)+...
            LaneDet.LaneBoundaries(4-next_lane+1).Coordinates(:,2))/2];

% Identify the index of the lanecenter at min distance from the ego
[indx_pos_wrt_cntr,~] = min_distance(laneCenter,[0 0]);

% Compute the actual distance from the center
pos_wrt_cntr = norm(laneCenter(indx_pos_wrt_cntr,:));

% If the maneuver was started, the distance wrt to the center lane is <1
% and the ego is aligned to the lane then the maneuver is completed
if lane_change ~= 0 && abs(pos_wrt_cntr)< th
   lane_change = 0;
   flag_lane = 0;
   next_state_LAT = 2; % LK
   ovt_cond = [0 0 0 0];
   reentry_cond = [0 0];
end

%% FIND VEHICLES ON SAME LANE
k_obs_same_lane = find(obs(:,5) == prev_curr_lane);

% Check if there are vehicles in front (only if there are any)
if(~isempty(k_obs_same_lane))
    
    % if x_ego - x_obs > 0
    k_obs_front = k_obs_same_lane(obs(k_obs_same_lane,1) > 0); 
    
    % If there are vehicle in front takes the nearest in order to approach
    % it
    
    if(~isempty(k_obs_front))
        [~,near_ind]= min(obs(k_obs_front,1).^2+obs(k_obs_front,2).^2);
        k_closest = k_obs_front(near_ind);
    end
   
     %If i have another vehicle in front of me i take the relative distance
     %d_k_closest=obs(k_closest,1); 
    
    % If the vehicle is faster than egoVehicle free the memory and doesn't
    % approach it
    if(~isempty(k_closest))
        if  obs(k_closest,4) >= vdes_ms
            k_closest=[];
        end
    end
end

% If the vehicle in front is slower than the desired speed
if obs(k_closest,4) < vdes_ms
    ovt_cond(2) = 1;    
end

if(~isempty(k_closest))
    act_dist = norm([obs(k_closest,1) obs(k_closest,2)]);
    if(act_dist <= 1.3*safe_d)
        ovt_cond(4) = 1;
    end
end

%% FIND VEHICLES ON NEXT LANE
k_obs_next_lane = find(obs(:,5) == prev_curr_lane + 1);

ovt_cond(3) = 1;

if ~isempty(k_obs_next_lane)  
    for j = 1:length(k_obs_next_lane)
        
        i = k_obs_next_lane(j);
        
        % If the obstacle vehicle in the next lane is behind the ego and
        % it's faster => cannot overtake 
        if obs(i,1) < 0 && obs(i,1) > -1.1*safe_d - max(0,5*(obs(i,4)-x0(4))) 
            ovt_cond(3) = 0;
        end
        
        % If the obstacle vehicle is in front of the ego and it's slower =>
        % cannot overtake
        if obs(i,1) >= 0 && obs(i,1) <= 1.1*safe_d + max(0,5*(x0(4)-obs(i,4)))   
            ovt_cond(3) = 0;
        end
        
    end
end

%% FIND VEHICLES ON PREVIOUS LANE
k_obs_prev_lane = find(obs(:,5) == prev_curr_lane - 1);

reentry_cond(2) = 1;

if ~isempty(k_obs_prev_lane) 
    
    for j = 1:length(k_obs_prev_lane)
        
        i = k_obs_prev_lane(j);
        
        % If the obstacle vehicle in the previous lane is behind the ego and
        % it's faster => cannot re-entry 
        if obs(i,1) > -safe_d - max(0,5*(obs(i,4)-x0(4))) && obs(i,1) < 0 
           reentry_cond(2) = 0;
        end
        
        % If the obstacle vehicle in the right lane is in ahead of the ego and 
        %it's slower wrt the desired speed => cannot re-entry
        if obs(i,1) > 0 && obs(i,4) <= vdes   
           reentry_cond(2) = 0;
        end
        
    end
end

%% MANUVER FLAG 

% overtake_1 flag 1 -> can overtake (just waiting for distance to decrease)  
% 0 -> cannot overtake
% overtake_2 flag 1 -> can overtake  0 -> cannot overtake

ovt_flag_1 = ovt_cond(1)==1 && ovt_cond(2)==1 && ovt_cond(3)==1;
ovt_flag_2 = ovt_flag_1 && ovt_cond(4) == 1;

% Reentry flag 1 -> can re-entry  0 -> cannot re-entry
reentry_flag = reentry_cond(1)==1 && reentry_cond(2)==1;

%% DECISION MAKER
% Hierarchy: Re-entry -> Overtake -> Adaptive CC -> Lane keeping

% If the overtake conditions aren't satisfied the ego hooks the vehicle in
% front

% Pre-initialization to speed control
next_state_LON = 2;

% ADAPTIVE CRUISE CONTROL *************************************************
if (~isempty(k_closest) && ~ovt_flag_1 && ~reentry_flag)
    
    act_dist = norm([obs(k_closest,1) obs(k_closest,2)]); 
    
    % if obstacle is far enough or performing a maneuver
    if act_dist > 115 || lane_change ~= 0 
        next_state_LON = 2; % speed control
    
    elseif act_dist <=  110 % if in LK and dist < 80 => HK
        next_state_LON = 3; % distance control
    end
end
% *************************************************************************
% If there aren't vehicles in front => velocity tracking

% OVERTAKE ****************************************************************
% If all conditions for overtaking are satisfied, I'm not perfoming any 
% maneuver yet and I cannot re-entry => overtake
if (lane_change == 0 && ovt_flag_2 && ~reentry_flag)
    next_state_LAT = 3; % overtake
    next_state_LON = 2; % speed control
    lane_change = 1;
    next_lane = prev_curr_lane + 1; % objective lane

end
% *************************************************************************

% RE-ENTRY ****************************************************************
% If all condition for the re-entry are satisfied and I'm not performing
% any manuver yet => re-entry
if (lane_change == 0 && reentry_flag)
    next_state_LAT = 4; % re-entry
    next_state_LON = 2; % speed control
    lane_change = -1;
    next_lane = prev_curr_lane - 1; % objective lane
end
% *************************************************************************
