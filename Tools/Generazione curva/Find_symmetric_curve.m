
clear all
close all
clc

tic

% ------------------------------------ NOTA ---------------------------------------

% Dati in ingresso due punti A=(Xa,Ya), B=(Xm,Yb) e  un set di
% punti [P_rett_1;P] la funzione ritorna il simmetrico di questi punti
% rispetto alla retta passante per A e B e la lunghezza del vettore
% contenente questi punti.

% ---------------------------------------------------------------------------------
syms x y d y_rette_tmp

load('Curva_sx_OV.mat')

N=50;

% P(:,1) = decimate(data.RoadSpecifications.Centers(:,1),N)';
% P(:,2) = decimate(data.RoadSpecifications.Centers(:,2),N)';

P(:,1) = data.RoadSpecifications.Centers(:,1);
P(:,2) = data.RoadSpecifications.Centers(:,2);

Xa = P(1,1);
Ya = P(1,2);

Xb = P(end,1);
Yb = P(end,2);

%Coordinate dei punti dell'asse di simmetria
P_A=[double(Xa),double(Ya)];
P_B=[Xb,Yb];

%Asse di simmetria
y=(P_A(2)-P_B(2))/(P_A(1)-P_B(1))*(x-P_A(1))+P_A(2);
%Coefficiente angolare asse di simmetria e ordinata
m=(P_A(2)-P_B(2))/(P_A(1)-P_B(1));
q=-((P_A(2)-P_B(2))/(P_A(1)-P_B(1))*P_A(1))+P_A(2);

%Punti dello scenario
P_originali_tmp = P;
P_originali = flip(P_originali_tmp);

%Inizializzazione
L=length(P_originali);
P_new=zeros(L,2);
X=zeros(L,1);
Y=zeros(L,1);

% 1) Per ogni punto originale si traccia la retta passante per quel punto e
%    perpendicolare all'asse di simmetria (R)
% 2) Si trova l'intersezione tra i due (I)
% 3) Si trova la distanza tra il punto originale e l'asse (D).
% 4) Si traccia la circonderenza di raggio = d e centro = I. (C)
% 5) L'intersezione tra la circonferenza e la retta R darà in output il
%    punto simmetrico. (P_new)

figure,
for i =1:L
    %Retta R
    y_rette(i)=-1/m*(x-P_originali(i,1))+P_originali(i,2);
    c0 = double(subs(y_rette(i),x,0));
    y_rette_tmp = -1/m*(x-P_originali(i,1))+P_originali(i,2)-c0;
    a0 = double(subs(y_rette_tmp,x,1));
    %Distanza D
    distanza_P_Asse = abs(P_originali(i,2)-(m*P_originali(i,1)+q))/(sqrt(1+m^2));
    %Intersezione I
    X=vpasolve( y == y_rette(i),x);
    Y=subs(y,x,X);
    %Cerchio C
    cerchio_imm = @(x,y) (x-X)^2+(y-Y)^2-distanza_P_asse^2;
    y_cerchio = Y+sqrt(distanza_P_Asse^2-(x-X).^2);
    %Punti simmetrici P_new
    P_new(i,1)= vpasolve ( y_rette(i) == y_cerchio,x);
    P_new(i,2) = subs(y_rette(i),x,P_new(i,1));
    
    %PLOT
    %fplot(y_rette(i),[-400 1000],'b','linewidth',0.5)
    hold on
    fplot(y,'color','[1 0.4 0.3]','linewidth',2)
%     xline(0,'k--')
%     yline(0,'k--')
    scatter(P_originali(i,1),P_originali(i,2),'MarkerEdgeColor',[0.6 0.3 1],'MarkerFaceColor',[0.6 0.8 1],'linewidth',1)
    grid on
    %scatter(X,Y,'o','y','linewidth',1)
    hold on
    scatter(P_new(i,1),P_new(i,2),'MarkerEdgeColor',[1 0.3 0.9],'MarkerFaceColor',[1 0.5 0.5],'linewidth',1)
   % axis([-500 800 -100 1200])
   % axis([-1100 1200 -100 1200])
   legend('Symmetry axis','Left curve points','Right curve points')
   xlabel('x')
   ylabel('y')
   title('Right curve design')
      
end

disp('Fine calcolo')

toc
%%
load('Curva_dx_plot.mat')

data.RoadSpecifications.Centers = zeros(L,3);

data.RoadSpecifications.Centers (:,1) = P_new(:,1);
data.RoadSpecifications.Centers (:,2) = P_new(:,2);

save('Curva_dx_plot.mat','tag','data')

disp('Salvato')





