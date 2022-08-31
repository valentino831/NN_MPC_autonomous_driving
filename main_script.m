%clear all;
close all;
clc;

Ts = 0.1;
Hp = 10;

load('busA1A');

% VECTORS INITIALIZATION **************************************************

InLK  = [];
InHK  = [];
InOT  = [];
InRE  = [];
OutLK = [];
OutHK = [];
OutOT = [];
OutRE = [];

% BICYCLE MODEL DATA ******************************************************
ego_L = 4.5;    % m

% Cornering stiffness of the tyre
Cf = 12000*2;   %N/rad
Cr = 11000*2;   %N/rad

% Wheel base
L_wb = 1.7;     %m   

% Mass of the Ego
m = 1625;       % Kg

% Inertia in the Yaw axis
Iz = 2865.61;   % Kg*m^2 

% Axle lengths
lr = 1.592;     % m  
lf = 1.108;     % m

% Constraints
acc_max = 2;            % m/s^2
acc_min = -3;           % m/s^2
acc_lat_max = 1.5;      % m/s^2
acc_lat_min = -1.5;     % m/s^2

jerk_max = 2.5;         % m/s^3
jerk_min = -2.5;        % m/s^3

max_speed = 36.1;       % m/s

max_steer_ang = 25;     % DEG
min_steer_ang = -25;    % DEG

max_steer_inc = 2.35;   % DEG
min_steer_inc = -2.35;  % DEG

Rs = 15; % Steering ratio SteeringWheel : wheels

% INITIAL COORDINATES *****************************************************

%Alberto
% V0 = 20;
% InitYaw = -18;
% InitVelX = V0*cosd(InitYaw);
% InitVelY = V0*sind(InitYaw);
% InitPosX = -351.5400;
% InitPosY =  306.3400;
% numVehicles = 0;

% %test1
% V0 = 20;
% InitYaw = 1;
% InitVelX = V0*cosd(InitYaw);
% InitVelY = V0*sind(InitYaw);
% InitPosX = -1.4875e+03;
% InitPosY =  -3.3600;
% numVehicles = 0;

%test2
% V0 = 20;
% InitYaw = 15;
% InitVelX = V0*cosd(InitYaw);
% InitVelY = V0*sind(InitYaw);
% InitPosX = -3.9282e+03;
% InitPosY =  23.6900;
% numVehicles = 0;
% t_sim = 400;

% Scenario no pink
% V0 = 20;
% InitYaw = 70.5132;
% InitVelX = V0*cosd(InitYaw);
% InitVelY = V0*sind(InitYaw);
% % 1st lane
% InitPosX = -395.9600;
% InitPosY = -1.1995e+03;
% 3rd lane
% InitPosX = -74.8371;
% InitPosY = -196.7743;
%numVehicles = 5;


% ScenarioTest4_rev1_0 - Patrick Circuit
% V0 = 28;
% InitYaw = 65.157;
% InitVelX = V0*cosd(InitYaw);
% InitVelY = V0*sind(InitYaw);
% % 1st lane
% InitPosX = -40;
% InitPosY = 0;

% %ScenarioTest5_rev1_4 - Rettilineo
% V0 = 25;
% InitYaw = 0;
% InitVelX = V0*cosd(InitYaw);
% InitVelY = V0*sind(InitYaw);
% InitPosX = 3;
% InitPosY = -3.5;
% numVehicles = 2;
% t_sim = 280;

% %Test curva sx 
% V0 = 25 ;
% InitYaw = 0;
% InitVelX = V0*cosd(InitYaw);
% InitVelY = V0*sind(InitYaw);
% InitPosX = -700;
% InitPosY = -3.5;
% numVehicles = 1;
% t_sim = 200;

%Scenario completo 500
% V0 = 25 ;
% InitYaw = 103;
% InitVelX = V0*cosd(InitYaw);
% InitVelY = V0*sind(InitYaw);
% InitPosX = -2.3775e+03;
% InitPosY = -1.5879e+03;
% numVehicles = 2;
% t_sim = 280;

%Video
% V0 = 25 ;
% InitYaw = 103;
% InitVelX = V0*cosd(InitYaw);
% InitVelY = V0*sind(InitYaw);
% InitPosX = -3.1469e+03;
% InitPosY = -1.4726e+03;
% numVehicles = 2;
% t_sim = 280;

%Scenario completo 1000
% V0 = 25 ;
% InitYaw = 103;
% InitVelX = V0*cosd(InitYaw);
% InitVelY = V0*sind(InitYaw);
% InitPosX = -2.9873e+03;
% InitPosY = -2.1733e+03;
% numVehicles = 1;
% t_sim = 250;

%Test curva dx
% V0 = 25 ;
% InitYaw = -77;
% InitVelX = V0*cosd(InitYaw);
% InitVelY = V0*sind(InitYaw);
% InitPosX = 364.5800;
% InitPosY = 1.6447e+03;
% numVehicles = 1;
% t_sim = 190;

disp('main ok')


% %Test_clotoide_sx_0_punti_tot -------------->  clotoide sx  t_sim = 65
% V0 = 25 ;
% InitYaw = 0;
% InitVelX = V0*cosd(InitYaw);
% InitVelY = V0*sind(InitYaw);
% InitPosX = -590;%-387.2288;
% InitPosY = -3.5;
% numVehicles = 2;
% t_sim = 90;

%Test_clotoide_sx_0_punti_tot-------------> ribaltata 500 m( la macchina percorre la curva sx al contraio)
% V0 = 25 ;
% InitYaw = -77;
% InitVelX = V0*cosd(InitYaw);
% InitVelY = V0*sind(InitYaw);
% InitPosX = 491.6800;
% InitPosY = 1.0869e+03;
% numVehicles = 2;
% t_sim = 200;

%Curva dx 700 m
% V0 = 25 ;
% InitYaw = -77;
% InitVelX = V0*cosd(InitYaw);
% InitVelY = V0*sind(InitYaw);
% InitPosX = 722.2500;
% InitPosY = 1.3801e+03;
% numVehicles = 1;
% t_sim = 100;


%Test_clotoide_dx_0_punti_tot --------> clotoide dx
% V0 = 25 ;
% InitYaw = 102;
% InitVelX = V0*cosd(InitYaw);
% InitVelY = V0*sind(InitYaw);
% InitPosX = -397.8088;
% InitPosY = 6.7900;
% numVehicles = 1;
% t_sim = 200;

% %Scenario Torino - Pinerolo 2
V0 = 25 ;
InitYaw = 21;
InitVelX = V0*cosd(InitYaw);
InitVelY = V0*sind(InitYaw);
InitPosX = -2.4980e+03;
InitPosY = -650.5503;
numVehicles = 1;
t_sim = 140;


return

%% On-road simulation

%[scenario, egoVehicle] = ScenarioTestA_rev1_0()
%[scenario, egoVehicle] = ScenarioTest5_rev1_4()
% [scenario, egoVehicle] = ScenarioTest6_curva_sxLK()
%[scenario, egoVehicle] = Scenario_completo_500_HK_OV_RE()
%[scenario, egoVehicle] = Scenario_completo_600_OV_re_hk()
[scenario, egoVehicle] = Scenario_completo_1000()
% [scenario, egoVehicle] = Scenario_Torino_Pinerolo_2()

for k = 1:size(out.egoSim.Position.data,3)
    waypoints(k,:)=out.egoSim.Position.data(:,:,k);
    speed(k)=norm(out.egoSim.Velocity.data(:,:,k));
end
trajectory(egoVehicle,waypoints,speed)

drivingScenarioDesigner(scenario)



