clc
close all
clear all

load ('Data_LK_tot_curva_sx_net_Y_mescolati.mat')

cut = 100;
Input_data = Input_data(:,1:cut);
Output_data = Output_data(:,1:cut);

Y = Y(:,1:cut);

%% ----------------- DATI NORMALI ------------------------

% Change data curva dx

% t1 = 1760;
% t2 = 1780;
% t3 = 2404;
% t4 = 2430;
% t5 = 3810;
% t6 = 3835;
% 
% 
% Output_data(2,t1:t2) = 0;
% Y(2,t1:t2) = 0;
% 
% Output_data(2,t3:t4) = 0;
% Y(2,t3:t4) = 0;
% 
% Output_data(2,t5:t6) = 0;
% Y(2,t5:t6) = 0;

% Change data curva sx

% t1 = 1760;
% t2 = 1772;
% t3 = 2406;
% t4 = 2416;
% 
% 
% Output_data(2,t1:t2) = 0;
% Y(2,t1:t2) = 0;
% 
% Output_data(2,t3:t4) = 0;
% Y(2,t3:t4) = 0;


%%  ------------------------ DATI MESCOLATI ---------------------------

% Change data curva dx
% t1 = 414;
% t2 = 416;
% t3 = 1199;
% t4 = 1200;
% t5 = 1225;
% t6 = 1227;


% Output_data(2,t1:t2) = 0;
% Y(2,t1:t2) = 0;

% Output_data(2,t3:t4) = 0;
% Y(2,t3:t4) = 0;
% 
% Output_data(2,t5:t6) = 0;
% Y(2,t5:t6) = 0;

% Change data curva sx

% t1 = 694;
% t2 = 696;
% t3 = 2155;
% t4 = 2157;
% t5 = 2473;
% t6 = 2475;
% t7 = 2724;
% t8 = 2726;
% t9 = 2786;
% t10 = 2788;
% 
% 
% Output_data(2,t1:t2) = 0;
% Y(2,t1:t2) = 0;
% 
% Output_data(2,t3:t4) = 0;
% Y(2,t3:t4) = 0;
% 
% Output_data(2,t5:t6) = 0;
% Y(2,t5:t6) = 0;
% 
% Output_data(2,t7:t8) = 0;
% Y(2,t7:t8) = 0;
% 
% Output_data(2,t9:t10) = 0;
% Y(2,t9:t10) = 0;







%%  Errors
Acc_real = Output_data(1,:)';
Acc_est = Y(1,:)';

Str_real = Output_data(2,:);
Str_est = Y(2,:);

%Number of data
L = length(Output_data(2,:)); 

%Acceleration errors
MSE_acc = 1/L*norm(Acc_real-Acc_est)^2
RMSE_acc =sqrt(MSE_acc);
Acc_bar = 1/L*norm(Acc_real);
Best_fit_acc = (1 - sqrt ( MSE_acc/(1/L*norm(Acc_real-Acc_bar)^2)))*100

%Steering angle errors
MSE_str = 1/L*norm(Str_real-Str_est)^2
RMSE_str =sqrt(MSE_str);
Str_bar = 1/L*norm(Str_real);
Best_fit_str = (1 - sqrt ( MSE_str/(1/L*norm(Str_real-Str_bar)^2)))*100

%%
%PLOT

figure,
stem(Output_data(1,:),'bo','linewidth',1), hold on, stem(Y(1,:),'rx','linewidth',1)
legend('Controller','Estimated')
xlabel('time [s]')
ylabel('Acceleration [m/s^2]')
title('Acceleration')
grid on
x0 = 10;
y0 = 10;
width = 700;
height = 500;
set(gcf,'position',[x0 y0 width height])

figure,
stem(Output_data(2,:),'bo','linewidth',1), hold on, stem(Y(2,:),'rx','linewidth',1)
legend('Controller','Estimated')
xlabel('time [s]')
ylabel('Steering angle [rad]')
title('Steering angle')
grid on
x0 = 10;
y0 = 10;
width = 700;
height = 500;
set(gcf,'position',[x0 y0 width height])


