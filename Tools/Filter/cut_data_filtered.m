clear all
close all
clc

load('Test_NN_LK_scenario_completo_1000_cut_Filtered.mat')

in = 65;
fin =2464;

T = length(time);
T_cut = fin-in;

time = time(1:(T_cut+1));
delta_deg = delta_deg(in:fin);
Lateral_offset_3 = Lateral_offset_3(in:fin);
xddot = xddot(in:fin);
yddot = yddot(in:fin);
xdot = xdot(in:fin);
ydot = ydot(in:fin);
%d_rel = d_rel(in:fin);

save('Test_NN_LK_scenario_completo_1000_cut_Filtered_C.mat','time','delta_deg','Lateral_offset_3','xddot','yddot','xdot','ydot')%,'d_rel')