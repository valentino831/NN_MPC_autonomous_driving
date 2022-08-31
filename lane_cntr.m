function [t0_new,APF_lane] = lane_cntr(LaneDet,current_lane,next_lane,lane_change,x_hat,Hp,t0,next_state_LON)

    %% DATA 
    Lw = 3.5;%abs(LaneDet.LaneBoundaries(current_lane).LateralOffset - LaneDet.LaneBoundaries(current_lane+1).LateralOffset);     %Lane width
    param.Hp = Hp;
    param.Ts = 0.1;
    
    % Potential fields data
    param.Lw = Lw;
    param.Ot = 2; %Overtake time [s]
    param.Rt = 2; %Re-entry time [s]
    param.dref = Lw/2;
    
    param.P_min = 0.1;
    
    param.Ar1 = 1000;
    param.Ar2 = 1000;
        
    % During a lane change maneuver is more useful to reduce the height of
    % the walls in order to increase the mobility and the performances
    if lane_change ~= 0                 
        param.Ar1 = 500;
        param.Ar2 = 500;
    end

    %% LANE DETECTION (NO SENSOR)

    Curv = LaneDet.LaneBoundaries(1).Curvature(end);

    % coordinates wrt the Vehicle [xL yL xR yR]
    if lane_change == 1
        if(current_lane == next_lane)
           Coord = [LaneDet.LaneBoundaries(4-next_lane+1).Coordinates(:,1:2),LaneDet.LaneBoundaries(4-current_lane+2).Coordinates(:,1:2)];
        else 
           Coord = [LaneDet.LaneBoundaries(4-next_lane+1).Coordinates(:,1:2),LaneDet.LaneBoundaries(4-current_lane+1).Coordinates(:,1:2)];
        end

    elseif lane_change == -1
       if(current_lane == next_lane)
           Coord = [LaneDet.LaneBoundaries(4-current_lane-1).Coordinates(:,1:2),LaneDet.LaneBoundaries(4-next_lane).Coordinates(:,1:2)];
        else
           Coord = [LaneDet.LaneBoundaries(4-current_lane).Coordinates(:,1:2),LaneDet.LaneBoundaries(4-next_lane).Coordinates(:,1:2)];
        end
    else
         Coord = [LaneDet.LaneBoundaries(4-current_lane).Coordinates(:,1:2),LaneDet.LaneBoundaries(4-current_lane+1).Coordinates(:,1:2)];
    end

    [t0_new,APF_lane] = APF_build(x_hat,Coord,param,lane_change,t0);

end

function [t0_new,APF_lane] = APF_build(x_hat,Coord,param,lane_change,t0)

    APF_lane = zeros(param.Hp,1);
    offset = zeros(param.Hp,1);
    
    gamma = 1.38; %1.38
    
    t = t0;
    
    for k = 1:param.Hp
        
        Xv = x_hat(1,k);
        Yv = x_hat(2,k);
        
        %par_A   = 1;%-0.0188*x_hat(4,k) + 1.675;
        %par_off = 3;%0.0500*x_hat(4,k) + 1.200;
      
        % Update offset computation
        %w_off = 1.10*param.Lw/(1+exp(-par_A*(t-par_off)));
        
        par_a = 6.8;
        par_b = param.Lw/par_a;
        
        %par_off = 0.0312*x_hat(4,k)-0.3250;
        par_off = 0.0375*x_hat(4,k)-0.5500;
         
        w_off = -par_b*par_a/(2*pi) * sin(2*pi/par_a*(t+par_off))+par_b*(t+par_off);
        
        % ****************** LEFT LANE ******************
        
        [~,index] = min(abs(Coord(:,1)-Xv));
        
        % Lane Keeping
        if lane_change == 0
            offset = 0;
            
        % Overtake
        elseif lane_change == 1
            offset = w_off;
         
        % Re-entry
        elseif lane_change == -1
            offset = -w_off;
        end

        % Impose that the potential wall passes from the (X0_L,Y0_L) point
        X0_L = Coord(index,1); 
        Y0_L = Coord(index,2)+offset;
        
        % Build the potential wall
        d1=((Xv-X0_L)^2)/60^2+((Yv-Y0_L)^2)/gamma^2;
        
        APF_L = param.Ar1*exp(-(d1).^5);
        
        % ****************** RIGHT LANE ****************** 
        
        [~,index] = min(abs(Coord(:,3)-Xv));
        
        % Impose that the potential wall passes from the (X0_L,Y0_L) point
        X0_R = Coord(index,3);
        Y0_R = Coord(index,4)+offset;
        
        d2=((Xv-X0_R)^2)/60^2+((Yv-Y0_R)^2)/gamma^2;
        
        APF_R = param.Ar2*exp(-(d2).^5);
        
        APF_lane(k) = APF_L + APF_R;
        
        t = t+param.Ts;     
    end
    
    % Update t0 for the next time step
    if lane_change == 0
        t0_new = 0;
    else
        t0_new = t0+param.Ts;
    end

end