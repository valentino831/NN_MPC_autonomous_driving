function dir_ovt = ovt_cntr(LaneDet,x_hat)

Hp = 10;

dir_ovt = zeros(Hp,1);

for k = 1:Hp
actual_lane = which_lane([x_hat(1,k) x_hat(2,k)],LaneDet);

% Identifies the centers of the lanes in order to check how far the ego is
laneCenter=[(LaneDet.LaneBoundaries(4-actual_lane).Coordinates(:,1)+LaneDet.LaneBoundaries(4-actual_lane+1).Coordinates(:,1))/2, ...
            (LaneDet.LaneBoundaries(4-actual_lane).Coordinates(:,2)+LaneDet.LaneBoundaries(4-actual_lane+1).Coordinates(:,2))/2];

% Identify the index of the lanecenter at min distance from the ego
[indx_pos_wrt_cntr,~]=min_distance(laneCenter,[x_hat(1,k) x_hat(2,k)]);

% Compute the angle between the centers direction and the ego direction
dir_ovt(k) = atan2(laneCenter(indx_pos_wrt_cntr+1,2)-...
    laneCenter(indx_pos_wrt_cntr,2),laneCenter(indx_pos_wrt_cntr+1,1)-...
    laneCenter(indx_pos_wrt_cntr,1));


end

