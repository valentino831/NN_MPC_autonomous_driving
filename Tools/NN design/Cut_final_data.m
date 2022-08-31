
load ('Test_CNTR_HK_scenario_completo_500.mat')

L_iniz = length(delta_deg);

Ts=0.1;

Ncut = 15/Ts;

L_fin = L_iniz-Ncut;


Curv_1 = Curv (Ncut:end);
delta_deg_1 = delta_deg (Ncut:end,1);
jerk_1 = jerk (Ncut:end,1);
Lateral_offset_1_1 = Lateral_offset_1 (Ncut:end,1);
Lateral_offset_2_1  = Lateral_offset_2 (Ncut:end,1);
Lateral_offset_3_1  = Lateral_offset_3 (Ncut:end,1);
Lateral_offset_4_1 = Lateral_offset_4 (Ncut:end,1);
time_1 = time (1:L_fin+1,1);
xddot_1 = xddot (Ncut:end,1);
xdot_1 = xdot (Ncut:end,1);
yddot_1 = yddot (Ncut:end,1);
ydot_1 = ydot(Ncut:end,1);


load ('Test_CNTR_HK_scenario_completo_500_cut.mat')

Curv = zeros (L_fin,1);
delta_deg = zeros (L_fin,1);
jerk = zeros (L_fin,1);
Lateral_offset_1 = zeros (L_fin,1);
Lateral_offset_2  = zeros (L_fin,1);
Lateral_offset_3  = zeros (L_fin,1);
Lateral_offset_4  = zeros (L_fin,1);
time = zeros (L_fin,1);
xddot = zeros (L_fin,1);
xdot = zeros (L_fin,1);
yddot = zeros (L_fin,1);
ydot = zeros(L_fin,1);


Curv = Curv_1;
delta_deg = delta_deg_1;
jerk = jerk_1;
Lateral_offset_1 = Lateral_offset_1_1;
Lateral_offset_2  = Lateral_offset_2_1;
Lateral_offset_3  = Lateral_offset_3_1;
Lateral_offset_4  = Lateral_offset_4_1;
time = time_1;
xddot = xddot_1;
xdot = xdot_1;
yddot = ydot_1;
ydot = ydot_1;



save('Test_CNTR_HK_scenario_completo_500_cut.mat','Curv','delta_deg','jerk','Lateral_offset_1','Lateral_offset_2',...
    'Lateral_offset_3','Lateral_offset_4','time','xddot','xdot','yddot','ydot')
disp('salvato')
return
clear all

load ('Test_NN_LK_scenario_completo_1000.mat')

L_iniz = length(delta_deg);

Ts=0.1;

Ncut = 15/Ts;

L_fin = L_iniz-Ncut;

Curv_1 = Curv (Ncut:end,1);
delta_deg_1 = delta_deg (Ncut:end,1);
jerk_1 = jerk (Ncut:end,1);
Lateral_offset_1_1 = Lateral_offset_1 (Ncut:end,1);
Lateral_offset_2_1 = Lateral_offset_2 (Ncut:end,1);
Lateral_offset_3_1  = Lateral_offset_3 (Ncut:end,1);
Lateral_offset_4_1  = Lateral_offset_4 (Ncut:end,1);
time_1 = time (1:L_fin+1,1);
xddot_1 = xddot (Ncut:end,1);
xdot_1 = xdot (Ncut:end,1);
yddot_1 = yddot (Ncut:end,1);
ydot_1 = ydot(Ncut:end,1);


load ('Test_NN_HK_scenario_completo_500_cut.mat')

Curv = zeros (L_fin,1);
delta_deg = zeros (L_fin,1);
jerk = zeros (L_fin,1);
Lateral_offset_1 = zeros (L_fin,1);
Lateral_offset_2  = zeros (L_fin,1);
Lateral_offset_3  = zeros (L_fin,1);
Lateral_offset_4  = zeros (L_fin,1);
time = zeros (L_fin,1);
xddot = zeros (L_fin,1);
xdot = zeros (L_fin,1);
yddot = zeros (L_fin,1);
ydot = zeros(L_fin,1);


Curv = Curv_1;
delta_deg = delta_deg_1;
jerk = jerk_1;
Lateral_offset_1 = Lateral_offset_1_1;
Lateral_offset_2  = Lateral_offset_2_1;
Lateral_offset_3  = Lateral_offset_3_1;
Lateral_offset_4  = Lateral_offset_4_1;
time = time_1;
xddot = xddot_1;
xdot = xdot_1;
yddot = ydot_1;
ydot = ydot_1;



save('Test_NN_LK_scenario_completo_1000_cut.mat','Curv','delta_deg','jerk','Lateral_offset_1','Lateral_offset_2',...
    'Lateral_offset_3','Lateral_offset_4','time','xddot','xdot','yddot','ydot')