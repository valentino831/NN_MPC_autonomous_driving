

% ------------------------------------ NOTA ---------------------------------------

% Dati in ingresso due punti A=(X_inters,Y_inters), B=(Xm,Ym) e  un set di
% punti [P_rett_1;P] la funzione ritorna il simmetrico di questi punti
% rispetto alla retta passante per A e B e la lunghezza del vettore
% contenente questi punti.

% ---------------------------------------------------------------------------------
syms x y d y_rette_tmp

load('Curva_sx_OV.mat')

P1(:,1) = data.RoadSpecifications(1,3).Centers(:,1);
P2(:,1) = data.RoadSpecifications(1,2).Centers(:,1);
P3(:,1) = data.RoadSpecifications(1,1).Centers(:,1);

P1(:,2) = data.RoadSpecifications(1,3).Centers(:,2);
P2(:,2) = data.RoadSpecifications(1,2).Centers(:,2);
P3(:,2) = data.RoadSpecifications(1,1).Centers(:,2);


%Punti dello scenario
P_originali_tmp = [P1;P2;P3];
P_originali = flip(P_originali_tmp);

Len=length(P_originali);

load ('Curva_dx_plot.mat')
data.RoadSpecifications.Centers = zeros(Len,3);
P_new=zeros(Len,2);

P_new(:,1) = P_originali(:,1);
P_new(:,2) = -P_originali(:,2);

figure,

% for i = 1:Len
%     
%     scatter(P_originali(i,1),P_originali(i,2),'o');
%     hold on
%     scatter(P_new(i,1),P_new(i,2),'o');
%     xline(0,'k--')
%     yline(0,'k--')
%     
% end

data.RoadSpecifications.Centers(:,1) = P_new(:,1);
data.RoadSpecifications.Centers(:,2) = P_new(:,2);

save('Curva_dx_plot.mat','tag','data')

disp('Fine')








