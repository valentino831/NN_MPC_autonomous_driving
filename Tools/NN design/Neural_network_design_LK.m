
%Inizializzazione
inLK_tot = [];
outLK_tot = [];
Ts = 0.1;
hiddenLayer1Size = 30;
%hiddenLayer2Size = 30;

%Fino al dato 19 per curva sinistra. Con gli altri per curva destra

%  Data = ['LK_data_01.mat';'LK_data_02.mat';'LK_data_03.mat';'LK_data_14.mat';...
%         'LK_data_15.mat';'LK_data_19.mat';'LK_data_22.mat';'LK_data_23.mat';'LK_data_24.mat']

Data = ['LK_to_pin_data_01.mat'];

%Data = ['LK_SC_data_01']
    
[nR,~] = size(Data);

%Concateno i dati delle varie simulazioni
for i = 1 : nR
    load(Data(i,:))
    
%     if i == 1
%     Coord_iniz = 4:6;
%     x0   = InLK(:,1:8);
%     vdes = InLK(:,9);
%     %wall = InLK(:,9+Coord_iniz:11:end);
%     wall = InLK(:,[9+Coord_iniz 20+Coord_iniz 31+Coord_iniz 42+Coord_iniz]);
%     curv = InLK(:,end);
%     in = [x0,vdes,wall,curv];
%     out = OutLK;  
%    else 
    in  = InLK;
    out = OutLK(:,2); 
%    end
        
    if i > 1
        inLK_tot = cat(1,in_prev,in);
        outLK_tot = cat(1,out_prev,out);
        in_prev = inLK_tot;
        out_prev= outLK_tot;
    else
        in_prev = in;
        out_prev= out;
        inLK_tot = in;
        outLK_tot = out;
    end  
    
end

save('Data_LK_tot_to_pin_mesc_steer','inLK_tot','outLK_tot')
disp ('Saved')

%Rimescoliamo il vettore delle informazioni
% index = 1 : length(inLK_tot);
% index_rand = randperm(length(index));
% inLK_tot_tmp = inLK_tot(index_rand,:);
% outLK_tot_tmp = outLK_tot(index_rand,:);

% inLK_tot = inLK_tot_tmp;
% outLK_tot = outLK_tot_tmp;
disp('Random input-output')

%% NEURAL NETWORK DESIGN

Input_data = inLK_tot';
Output_data = outLK_tot';

% Levenberg-Marquardt backpropagation.
trainFcn = 'trainlm';
%Output_data(2,:)=Output_data(2,:); %Riscalo l'angolo di sterzata

% Create a Fitting Network
% net = fitnet([hiddenLayer1Size hiddenLayer2Size],  trainFcn);
net = fitnet([hiddenLayer1Size],  trainFcn);

%Train the network
[net_trained,TR] = train(net,Input_data,Output_data);

%Get the simulink block
gensim(net_trained,Ts)

%save('Data_LK_to_pin_.mat','Input_data','Output_data','net_trained')
%% SIMULATION
% close all
% clear all

 %load('Data_LK_tot_Curva_dx_net.mat')
% 
% %Rimescoliamo il vettore delle informazioni
% [R C]=size(Input_data);
% index = linspace(1,C,C);
% index_rand = randperm(length(index));
% 
% for i = 1:length(Input_data)
%     
% Input_data_tmp(i,:) = Input_data(index_rand(i),:);
% Output_data_tmp(i,:) = Output_data(index_rand(i),:);
% 
% end 

% Input_data = Input_data_tmp;
% Output_data = Input_data_tmp;
% disp('Random input-output')

t = length(Input_data);

Y = sim (net_trained,Input_data)

% Acc_real = Output_data(1,:)';
% Acc_est = Y(1,:)';

% Str_real = Output_data(2,:);
% Str_est = Y(2,:);

Str_real = Output_data(1,:);
Str_est = Y(1,:);

%Number of data
L = length(Output_data(1,:)); 

%Acceleration errors
% MSE_acc = 1/L*norm(Acc_real-Acc_est)^2
% RMSE_acc =sqrt(MSE_acc);
% Acc_bar = 1/L*norm(Acc_real);
% Best_fit_acc = (1 - sqrt ( MSE_acc/(1/L*norm(Acc_real-Acc_bar)^2)))*100

%Steering angle errors
MSE_str = 1/L*norm(Str_real-Str_est)^2
RMSE_str =sqrt(MSE_str);
Str_bar = 1/L*norm(Str_real);
Best_fit_str = (1 - sqrt ( MSE_str/(1/L*norm(Str_real-Str_bar)^2)))*100

%save('Data_LK_to_pin_steer.mat','Input_data','Output_data','net_trained','Y')
%%
%PLOT

load('Data_LK_tot_Curva_dx_net.mat')

%t = linspace(0,4000,4000);
figure,
stem(Output_data(1,1:100),'bo','linewidth',1), hold on, stem(Y(1,1:100),'rx','linewidth',1)
legend('Controller','Estimated')
xlabel('Samples')
ylabel('Acceleration [m/s^2]')
title('Acceleration')
grid on

figure,
stem(Output_data(2,1:100),'bo','linewidth',1), hold on, stem(Y(2,1:100),'rx','linewidth',1)
legend('Controller','Estimated')
xlabel('Samples')
ylabel('Steering angle [rad]')
title('Steering angle')
grid on
% stem(Output_data(1,1:100),'bo','linewidth',1), hold on, stem(Y(1,1:100),'rx','linewidth',1)
% legend('Controller','Estimated')
% xlabel('Samples')
% ylabel('Steering angle [rad]')
% title('Steering angle')
% grid on

%% RISULTATI 
% Risultati = fopen('Errori.txt','wt');
% 
% fprintf ( Risultati_fine_clotoide, '%s \n\n',' Errori accelerazione - angolo di sterzata');
% fprintf ( Risultati_fine_clotoide, '%s %d \n','MSE_acc  = ',MSE_acc);
% fprintf ( Risultati_fine_clotoide, '%s %d \n','MSE_str = ',MSE_str);
% fprintf ( Risultati_fine_clotoide, '%s %d \n','Best_fit_acc = ',Best_fit_acc);
% fprintf ( Risultati_fine_clotoide, '%s %d \n','Best_fit_str = ',Best_fit_str);



