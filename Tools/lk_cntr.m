function APF_lane = lk_cntr(LaneDet,current_lane,x_hat)

%% DATA 
Lw = 3.5;     %Lane width
param.Hp = 10;

% Potential fields data
param.dref = Lw/2;
param.Ar1 = 100;
param.Ar2 = 100;

param.P_min = 0.1;


%% LANE DETECTION (NO SENSOR)

% coordinates wrt the Vehicle [xL yL xR yR]
Coord = [LaneDet.LaneBoundaries(4-current_lane).Coordinates(:,1:2),LaneDet.LaneBoundaries(4-current_lane+1).Coordinates(:,1:2)];

% Lane APF construction
APF_lane = APF_build(x_hat,Coord,param);

end

%% APF Construction
function APF_lane = APF_build(x_hat,Coord,param)
    
    APF_lane = zeros(param.Hp,1);
    
    for k = 1:param.Hp
        % for each point in the prediction construct the APF
        Xv = x_hat(1,k);
        Yv = x_hat(2,k);
        
        % LEFT Line (gaussian 6th order)
        
        [~,index] = min(abs(Coord(:,1)-Xv)); % take the index of the nearest point (x)
        
        gamma = 1.2;%1.1103;%(-param.dref/(log(param.P_min/param.Ar1)))^(1/4);
        
        X0_L = Coord(index,1);  % Impose that the wall passes from the (X0_L,Y0_L) point
        Y0_L = Coord(index,2);
        
        d1=((Xv-X0_L)^2+(Yv-Y0_L)^2)/gamma^2;
        
        APF_L = param.Ar1*exp(-(d1).^2); % Construct the potential wall
        
        % RIGHT Line (gaussian 6th order)
        
        [~,index] = min(abs(Coord(:,3)-Xv));
        
        gamma = 1.2;%1.1103;%(-param.dref/(log(param.P_min/param.Ar2)))^(1/4);
        
        X0_R = Coord(index,3);
        Y0_R = Coord(index,4);
        
        d2=((Xv-X0_R)^2+(Yv-Y0_R)^2)/gamma^2;
        
        APF_R = param.Ar2*exp(-(d2).^2);
        
        % APF Complete for time k
        APF_lane(k) = APF_L + APF_R;
    end

end