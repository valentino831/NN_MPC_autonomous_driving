
%Inizializzazione
inHK_tot = [];
outHK_tot = [];
Ts = 0.1;
hiddenLayer1Size = 50;
hiddenLayer2Size = 20;
hiddenLayer3Size = 5;

Data = ['HK_data_02';'HK_data_03';'HK_data_04';'HK_data_06';'HK_data_07';...
        'HK_data_08';'HK_data_09';'HK_data_16';'HK_data_17';'HK_data_19';'HK_data_23']%HK_data_19';...
        %'HK_data_20';'HK_data_21']%;'HK_data_10';'HK_data_11';'HK_data_12';...
        %'HK_data_13';'HK_data_14']

%Data = ['BruteForce_HK_data'] 

[nR,~] = size(Data);

%Concateno i dati delle varie simulazioni
for i = 1 : nR
    load(Data(i,:))
    
    x0   = InHK(:,1:8);
    vdes = InHK(:,9);
    obs =  InHK(:,22:25);
    
    in = [x0,vdes,obs];
    out = OutHK(:,1);

%       in  = InHK;
%       out = OutHK;
        
    if i > 1
        inHK_tot = cat(1,in_prev,in);
        outHK_tot = cat(1,out_prev,out);
        in_prev = inHK_tot;
        out_prev= outHK_tot;
    else
        in_prev = in;
        out_prev= out;
        inHK_tot = in;
        outHK_tot = out;
    end  
    
end

save('Data_HK_tot','inHK_tot','outHK_tot')
disp ('Saved')

% %Rimescoliamo il vettore delle informazioni
% index = 1 : length(inHK_tot);
% index_rand = randperm(length(index));
% inHK_tot_tmp = inHK_tot(index_rand,:);
% outHK_tot_tmp = outHK_tot(index_rand,:);
% 
% inHK_tot = inHK_tot_tmp;
% outHK_tot = outHK_tot_tmp;
% disp('Random input-output')

%% NEURAL NETWORK DESIGN

Input_data = inHK_tot';
Output_data = outHK_tot';

% Levenberg-Marquardt backpropagation.
trainFcn = 'trainlm';
%Output_data(2,:)=Output_data(2,:); %Riscalo l'angolo di sterzata

% Create a Fitting Network
net = fitnet([hiddenLayer1Size hiddenLayer2Size hiddenLayer3Size],  trainFcn);

%Train the network
[net_trained,TR] = train(net,Input_data,Output_data);

%Get the simulink block
gensim(net_trained,Ts)
%% SIMULATION
close all

Y = sim (net_trained,Input_data)

Acc_real = Output_data(1,:)';
Acc_est = Y(1,:)';

% Str_real = Output_data(2,:);
% Str_est = Y(2,:);

%Number of data
L = length(Output_data(1,:)); 

%Acceleration errors
MSE_acc = 1/L*norm(Acc_real-Acc_est)^2
RMSE_acc =sqrt(MSE_acc);
Acc_bar = 1/L*norm(Acc_real);
Best_fit_acc = (1 - sqrt ( MSE_acc/(1/L*norm(Acc_real-Acc_bar)^2)))*100

%Steering angle errors
% MSE_str = 1/L*norm(Str_real-Str_est)^2
% RMSE_str =sqrt(MSE_str);
% Str_bar = 1/L*norm(Str_real);
% Best_fit_str = (1 - sqrt ( MSE_str/(1/L*norm(Str_real-Str_bar)^2)))*100

%PLOT
figure,
plot(Output_data(1,:),'b'), hold on, plot(Y(1,:),'r')
legend('Real','Estimated')
title('Acceleration')
grid on

% figure,
% plot(Output_data(2,:),'b'), hold on, plot(Y(2,:),'r')
% legend('Real','Estimated')
% title('Steering angle')
% grid on

%% RISULTATI 
Risultati = fopen('Errori.txt','wt');

fprintf ( Risultati, '%s \n\n',' Errori accelerazione - angolo di sterzata');
fprintf ( Risultati, '%s %d \n','MSE_acc  = ',MSE_acc);
% fprintf ( Risultati, '%s %d \n','MSE_str = ',MSE_str);
fprintf ( Risultati, '%s %d \n','Best_fit_acc = ',Best_fit_acc);
%fprintf ( Risultati, '%s %d \n','Best_fit_str = ',Best_fit_str);



