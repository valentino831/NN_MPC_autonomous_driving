function [dudy,APF_lane] = lane_cntr(LaneDet,current_lane,next_lane,lane_change,x_hat,Hp)

%% DATA 
Lw = 3.5;     %Lane width
param.Hp = Hp;

% Potential fields data
param.dref = Lw/2;
param.Ar1 = 100;
param.Ar2 = 100;
param.Att = 2.5; 

param.P_min = 0.1;

duR = zeros(Hp,1);
duL = zeros(Hp,1);
dudy = zeros(Hp,1);

%% LANE DETECTION (NO SENSOR)

Curv = LaneDet.LaneBoundaries(1).Curvature(end);

% coordinates wrt the Vehicle [xL yL xR yR]
if lane_change == 1
    if(current_lane == next_lane)
        Coord = [LaneDet.LaneBoundaries(4-next_lane).Coordinates(:,1:2),LaneDet.LaneBoundaries(4-current_lane+2).Coordinates(:,1:2)];
    else 
        Coord = [LaneDet.LaneBoundaries(4-next_lane).Coordinates(:,1:2),LaneDet.LaneBoundaries(4-current_lane+1).Coordinates(:,1:2)];
    end
    
elseif lane_change == -1
        if(current_lane == next_lane)
            Coord = [LaneDet.LaneBoundaries(4-current_lane-1).Coordinates(:,1:2),LaneDet.LaneBoundaries(4-next_lane+1).Coordinates(:,1:2)];
        else
            Coord = [LaneDet.LaneBoundaries(4-current_lane).Coordinates(:,1:2),LaneDet.LaneBoundaries(4-next_lane+1).Coordinates(:,1:2)];
        end
else
     Coord = [LaneDet.LaneBoundaries(4-next_lane).Coordinates(:,1:2),LaneDet.LaneBoundaries(4-current_lane+1).Coordinates(:,1:2)];
end

% Lane APF construction
[duR,duL,APF_lane] = APF_build(x_hat,Coord,param,next_lane,current_lane,lane_change,Curv);

dudy = duR + duL;

end

%% APF Construction
function [duR,duL,APF_lane] = APF_build(x_hat,Coord,param,next_lane,current_lane,lane_change,Curv)
    
    APF_lane = zeros(param.Hp,1);
    duR = zeros(param.Hp,1);
    duL = zeros(param.Hp,1);
    
    th_dcurve = 1000;
    
    for k = 1:param.Hp
        
        % for each point in the prediction construct the APF
        Xv = x_hat(1,k);
        Yv = x_hat(2,k);
        
        v_ego = x_hat(4,k);
        
        % ************ LEFT Line (gaussian)
        
        % Index of the nearest point of the ego wrt lane (x coord)
        [~,index] = min(abs(Coord(:,1)-Xv)); 
        
        % OVERTAKE
        if lane_change == 1   
            if Curv > 1/th_dcurve           % left curve (disadvantageous)
                gamma = 1.3;
            elseif abs(Curv)<=1/th_dcurve   % Neutral
                if(v_ego >= 28)
                    gamma = 2; %1.8
                elseif(v_ego > 22 && v_ego < 28)
                    gamma = 1.75;
                else
                    gamma = 1.5;
                end
                
            else                            % right curve (advantageous)
                gamma = 2; 
            end
        
        % RE-ENTRY
        elseif lane_change == -1 
            if Curv < -1/th_dcurve 
                gamma = 3.2;
            elseif abs(Curv) <= 1/th_dcurve
                gamma = 2.75; 
            else
                gamma = 1.3;
            end
            
        % LANE KEEPING
        else
            gamma = 1.3;
        end
                
        % Impose that the potential wall passes from the (X0_L,Y0_L) point
        X0_L = Coord(index,1); 
        Y0_L = Coord(index,2);
        
        % Build the potential wall
        d1=((Xv-X0_L)^2+(Yv-Y0_L)^2)/gamma^2;
        
        APF_L = param.Ar1*exp(-(d1).^3);
        
        duL(k) = -6*param.Ar1*(Yv-Y0_L)*(-(Xv-X0_L)^2-(Yv-Y0_L)^2)^2*exp((-d1)^3)/gamma^6;
        
        % ************ RIGHT Line (gaussian)
        
        % Index of the nearest point of the ego wrt lane (x coord)
        [~,index] = min(abs(Coord(:,3)-Xv));
        
        % OVERTAKE
        if lane_change == 1   
            if Curv > 1/th_dcurve
                gamma = 2.9;%3.2
            elseif abs(Curv) <= 1/th_dcurve
                if(v_ego > 28)
                    gamma = 3;  
                else
                    gamma = 3.5;
                end
            else
                if(v_ego > 28)
                    gamma = 2.9;
                else
                    gamma = 3.2;
                end
            end
            
        % RE-ENTRY
        elseif lane_change == -1
            if Curv < -1/th_dcurve
                gamma = 1.4;
            elseif abs(Curv) <= 1/th_dcurve
                if(v_ego > 29)
                    gamma = 2;
                elseif(v_ego < 28 && v_ego > 26)
                    gamma = 1.5;
                else
                    gamma = 1.5;
                end
            else
                gamma = 2.6;
            end
        
        % LANE KEEPING
        else
            gamma = 1.3;
        end
       
        % Impose that the potential wall passes from the (X0_L,Y0_L) point
        X0_R = Coord(index,3);
        Y0_R = Coord(index,4);
        
        d2=((Xv-X0_R)^2+(Yv-Y0_R)^2)/gamma^2;
        
        APF_R = param.Ar2*exp(-(d2).^3);
        duR(k) = -6*param.Ar2*(Yv-Y0_R)*(-(Xv-X0_R)^2-(Yv-Y0_R)^2)^2*exp((-d2)^3)/gamma^6;
        
        % If I'm overtaking the potential wall should push sweetly the ego to the
        % next centerline
        
        % ************ ATTRACTIVE gaussian
        
        if(lane_change == 1)
                gamma = 3;%(-param.dref/(log(param.P_min/param.Ar2)))^(1/4);
                datt=((Xv-X0_L)^2+(Yv-(Y0_L-1.75))^2)/gamma^2;
                APF_att = -param.Att*exp(-(datt).^3);
                APF_lane(k) = APF_att;
        end 
        
        if(lane_change == -1)
                gamma = 3;%(-param.dref/(log(param.P_min/param.Ar2)))^(1/4);
                datt=((Xv-X0_R)^2+(Yv-(Y0_R+1.75))^2)/gamma^2;
                APF_att = -param.Att*exp(-(datt).^3);
                APF_lane(k) = APF_att;
        end
        
        
        
        % APF Complete for time k
        APF_lane(k) = APF_lane(k) + APF_L + APF_R;
    end

end
