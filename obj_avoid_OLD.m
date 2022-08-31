function APF_obj = obj_avoid(k_closest,egoState,LaneDet,ObjDet,safe_d,x_hat,R,Hp)

%% DATA
Lw = 3.5;     %Lane width

param.Ts = 0.1;

% Potential fields data
param.dref = Lw/2;
param.Aatt = 30;
param.Aobs = 50;

APF_obj = zeros(Hp,1);

obs = obs_find(LaneDet,ObjDet,egoState,R);

% IF HOOKING
obs_hat = obs_state_pred(param.Ts,Hp,obs);

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
        
        p = 4;
        val = 0.1;
        X2 = Xo - safe_d*1.05;
        Y2 = 0;
        
        % Rotation of the attractive obstacle potential field
        X02 =  X2*cos(Psio)+Y2*sin(Psio);
        Y02 = -X2*sin(Psio)+Y2*cos(Psio);
        
        % APF build
%         sigma_x  = (1.15*safe_d)^(2*p)/(2^p*log(param.A0/val));  %25;%    
%         sigma_y1 = safe_d^2/(2*log(param.A0/0.1)); %100; %APF OBS
%         sigma_y2 = safe_d^2/(2*log(param.A0/5)); %100;% %BUCA
        
%         APF_1 = param.A0*exp(-(X1-X01)^(2*p)/(2^p*sigma_x)-(Y1-Y01)^2/(2*sigma_y1));
%         APF_2 = -param.A0*exp(-(X1-X02)^(2*p)/(2^p*sigma_x)-(Y1-Y02)^2/(2*sigma_y2));
          
        sigma_xobs  = 10;
        sigma_xatt  = 10;
        sigma_yobs  = 3.5;
        sigma_yatt  = 3.5;
        

        APF_obs = param.Aobs*exp(-(((X1-X01)^2/sigma_xobs^2)^1) - (((Y1-Y01)^2/sigma_yobs^2)^1));
        APF_att = -param.Aatt*exp(-(((X1-X02)^2/sigma_xatt^2)^1) - (((Y1-Y02)^2/sigma_yatt^2)^1));
        
        APF_obj(t) = APF_obs+APF_att;
        
    end
end
