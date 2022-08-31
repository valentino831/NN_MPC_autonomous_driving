function current_lane = which_lane(pos,lanes)

d = zeros(lanes.NumLaneBoundaries,1);

for i=1:lanes.NumLaneBoundaries
    % find the index of the minimum distance between coordinates of lane
    % and the position of the object
    [row,~]=min_distance(lanes.LaneBoundaries(i).Coordinates,[pos 0]);
    
    % Calculate the effective distance
    d(i)=norm(lanes.LaneBoundaries(i).Coordinates(row,:) - [pos 0]);
end

% Order the distances and save the ordered indices
[~,index]=sort(d);

current_lane = lanes.NumLaneBoundaries - min(index(1:2));
end




