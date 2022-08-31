function obs_hat = obs_state_pred(Ts,Hp,obs_obj)

% Structure of the output:
% obs_hat = [x_hat y_hat phi_hat v_hat]

n = length(obs_obj(:,1));

obs_hat.xo_hat  = zeros(Hp,n);
obs_hat.yo_hat  = zeros(Hp,n);
obs_hat.psi_hat = zeros(Hp,n);

for i = 1:n
    
    % First step
    obs_hat.xo_hat(1,i)  = obs_obj(i,1);
    obs_hat.yo_hat(1,i)  = obs_obj(i,2);
    obs_hat.psi_hat(1,i) = obs_obj(i,3);
    
    % Prediction
    % x(k+1) = x(k) + Vobs * cos(psi(k))*Ts
    % y(k+1) = y(k) + Vobs * sin(psi(k))*Ts
    % psi(k+1) = psi(k) + w(k)*Ts
    
    for k = 2:Hp
        obs_hat.xo_hat(k,i)  = obs_hat.xo_hat(k-1,i)+ obs_obj(i,4).*...
                                cos(obs_hat.psi_hat(k,i))*Ts;
        obs_hat.yo_hat(k,i)  = obs_hat.yo_hat(k-1,i)+ obs_obj(i,4).*...
                                sin(obs_hat.psi_hat(k,i))*Ts;
        obs_hat.psi_hat(k,i) = obs_hat.psi_hat(k-1,i) + obs_obj(i,6)*Ts;
    end
end
    
    

