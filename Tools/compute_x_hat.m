function x_hat = compute_x_hat(X,x0,Hp,VehData)

x_hat = zeros(8,Hp);
x_hat_c = cell(1,Hp);

% Create the cells
for t = 1:Hp
    x_hat_c{t} = zeros(8,1);
end

% Initialize the first cell
x_hat_c{1} = x0;

% Simulate the NL system over the prediction horizon
for t = 1:Hp-1
    u = X(t,:);
    x_hat_c{t+1} = state_pred(VehData,x_hat_c{t},u);
end

% Convert the cell array into an Hpx8 Matrix
for t = 1:Hp
    x_hat(:,t) = x_hat_c{t};
end

end