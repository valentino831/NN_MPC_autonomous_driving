clear all
close all
clc

syms x y y_h


% ---------------------------------- NOTE --------------------------------

% Lo scopo di questo script è quello di estrarre un set di punti da fornire
% a driving scenario in modo tale da avere una curva realistica.
% Nello specifico, si crea un primo tratto rettifilo, una clotoide e un
% arco di circonferenza. Da questi tre si estraggono un set di punti. Per
% ottenere i punti appartenenti all'uscita della curva viene fatto il
% simmetrico del rettifilo e della clotoide rispetto a un asse di
% simmetria.
% ------------------------------------------------------------------------

%% DATI DI PROGETTO

%Rettifilo dati:
Inizio_rettifilo = -1000; %coordinata x
Fine_rettifilo = 0;      %Coordinata x
Y0 = 0;                  %Ordinata del rettifilo
M0 = 0;                  %Coefficiente angolare rettifilo
N_punti_rett_1 =10;      %Numero di punti da estrarre dal primo rettifilo
%Clotoide dati:
N_punti = 2;           %Numero di punti tra l'inizio e la fine dlla clotoide
%Mezzo cerchio dati
N_punti_cerchio = 50;   %Numero di punti da estrarre dal mezzo cerchio
r  = 1000;                %Raggio di curvatura del cerchio
v_max = 130;
v_min = 80;
P_A=[0,v_max];
P_B=[2e-3,v_min];
v_km_h =(P_A(2)-P_B(2))/(P_A(1)-P_B(1))*((1/r)-P_A(1))+P_A(2); %Velocità a cui si intende far percorrere la curva
           
%Dati finali
N_dec = 50;              %Numero legato alla decimazione dei dati

%% Clotoide Design

%Parametri della clotoide
n=1;
R=r;

%----------------- TROVO A ---------------------------------------

%Limitazione del contraccolpo
A1=0.021*v_km_h^2;

%Limitazione della sovrapendenza
B = 3.5; %larghezza corsia
qf =7/100; %standard se non fornito
qi =2.5/100; %stanfard se non fornito
delta_i_max =18*B/v_km_h;

A2=sqrt(R/delta_i_max*100*B*(qf-qi));

%Vincolo sulla percettività ottica
A3=R/3;

%Vincolo sulla percettività ottica
A4=R;

%Calcolo la A finale
Amin = max([A1 A2 A3]);
Amax = A4;

A=abs(Amin+Amax)/2;

%----------------  HO TROVATO A, ORA POSSO TROVARE TAO CENT ---------------------

%Calcolo di Tao in radianti
tao_rad  = A^2/(2*R^2);

%Converto tao_rad in centesimali, servirà per poter consultare la tabella
%nel file " Retta interpolante per clotoide"
tao_cent = tao_rad*200/pi;

%% Cerchio design

%Calcolo centro del cerchio
Xm = (A*sqrt(2*tao_rad) - R*tao_rad);
Ym = (A*sqrt(2*tao_rad)*tao_rad/3 + R*cos(tao_rad));

%Dati cerchio: raggio - coordinate centro
Xc = Xm;
Yc = Ym;

%Delta R
delta_R = Yc-r;

%% Funzioni a tratti

%--------------- RETTIFILO

rettifilo = @(x,y) y-M0*x-Y0; %Equazione rettifilo per il plot
y_rett = M0*x+Y0; %Equazione rettifilo per estrapolare i punti

%Coordinate x estrapolate dal rettifilo 1
x_rettifilo = linspace (Inizio_rettifilo,Fine_rettifilo,N_punti_rett_1);
%Coordinate y estrapolate dal rettifilo 1
for i = 1:N_punti_rett_1
    y_rettifilo(i) = subs(y_rett,x,x_rettifilo(i));
end

%Punti rettifilo 1
P_rett_1 = zeros(N_punti_rett_1,2);

for i=1:N_punti_rett_1
    
    P_rett_1(i,1) = x_rettifilo(i);
    P_rett_1(i,2) = y_rettifilo(i);
    
end

%------------------ CLOTOIDE

 [P,S_star,XF_star_tmp,YF_star_tmp] = trova_punti_clotoide(A,N_punti,tao_cent);
 
%------------------ MEZZO CERCHIO

%Dati mezzo cerchio
Inizio_cerchio = S_star;
Fine_cerchio = Xm+R;

%cerchio = @(x,y) (y-Yc).^2+(x-Xc).^2-r^2;
mezzo_cerchio = @(x,y)(y-Yc)+sqrt(r^2-(x-Xc).^2); %Equazione mezzo cerchio per il plot
y_mezzo_cerchio =Yc-sqrt(r^2-(x-Xc).^2); %Equazione mezzo cerchio per estrarre i punti

%Coordinate x estrapolate dal rettifilo 1
x_m_cerchio = linspace (Inizio_cerchio,Fine_cerchio,N_punti_cerchio);
%Coordinate y estrapolate dal rettifilo 1
for i = 1:N_punti_cerchio
    y_m_cerchio(i) = subs(y_mezzo_cerchio,x,x_m_cerchio(i));
end

%Punti arco di cerchio
P_cerchio = zeros(N_punti_cerchio,2);

for i=1:N_punti_cerchio
    
    P_cerchio(i,1) = x_m_cerchio(i);
    P_cerchio(i,2) = y_m_cerchio(i);
    
end

% --------------------- RETTA PASSANTE PER:
% P1=(P_cerchio(1,1),P_cerchio(1,2))
% P2=(P_cerchio(N_punti_cerchio,1),P_cerchio(N_punti_cerchio,2))
% C = (Xm,Ym)

%Retta numero 1
y1 =(P_cerchio(1,2)-Ym)/(P_cerchio(1,1)-Xm)*(x-P_cerchio(1,1))+P_cerchio(1,2);
c1=subs(y1,x,0);
y1_tmp =(P_cerchio(1,2)-Ym)/(P_cerchio(1,1)-Xm)*(x-P_cerchio(1,1))+P_cerchio(1,2)-c1;
a1=subs(y1_tmp,x,1);

%Retta numero 2
y2 =(P_cerchio(N_punti_cerchio,2)-Ym)/(P_cerchio(N_punti_cerchio,1)-Xm)*(x-P_cerchio(N_punti_cerchio,1))+P_cerchio(N_punti_cerchio,2);
c2=subs(y2,x,0);
y2_tmp =(P_cerchio(N_punti_cerchio,2)-Ym)/(P_cerchio(N_punti_cerchio,1)-Xm)*(x-P_cerchio(N_punti_cerchio,1))+P_cerchio(N_punti_cerchio,2)-c2;
a2=subs(y2_tmp,x,1);

%Bisettrice delle due rette
alfa = (sqrt(a1^2+1))/(sqrt(a2^2+1));
m = (-a2*alfa-a1)/(-1-alfa);
q = (-c1-c2*alfa)/(-1-alfa);
y_biset = m*x+q;

%Punto di intersezione tra retta bisettrice e circonferenza
[X_inters,Y_inters] = solve (y == m*x+q, y == Yc-sqrt(r^2-(x-Xc).^2),x,y);

%Calcolo i punti simmetrici rispetto alla bisettrice
[P_new,L] = calcola_punti_simmetrici (X_inters,Y_inters,Xm,Ym,P_rett_1,P);

%Composizione funzioni
y = piecewise(-1000<x<0, rettifilo, S_star<x<1000, mezzo_cerchio);

%% Plot
figure,
%Function
fimplicit(y,[-1000 1000 -200 1500],'b--','linewidth',1);
hold on
%Cartesian axes
yline(0,'k--','linewidth',0.5);
xline(0,'k--','linewidth',0.5);
%Center of the circle
scatter(Xc,Yc,'k','linewidth',1.5);
%End of the circle
%xline(Fine_cerchio);
%End of the rettifile
scatter(0,0,'k','x','linewidth',1.5);
%Delta_R coordinates
%scatter(Xc,delta_R,'k','x','linewidth',1.5);
grid on
%Punti intermermedi della clotoide
% for i=1:N_punti
%     scatter(P(i,1),P(i,2),'x','r','linewidth',1);
%     hold on
%     grid on
% end
%Punti intermermedi del primo rettifilo
for i=1:N_punti_rett_1
    scatter(P_rett_1(i,1),P_rett_1(i,2),'MarkerEdgeColor',[0 0.4 0.3],'MarkerFaceColor',[0.4660 0.6740 0.1880],'linewidth',1);
    hold on
    grid on
end
%Punti intermermedi del cerchio
for i=1:N_punti_cerchio
    scatter(P_cerchio(i,1),P_cerchio(i,2),'MarkerEdgeColor',[1 0.7 0],'MarkerFaceColor',[1 0.9 0.3],'linewidth',1);
    hold on
    grid on
end
%Rette passanti per i punti estremi del cerchio
fplot(y1,'color','[0.3010 0.7450 0.9330]','linewidth',1)
fplot(y2,'color','[0.3010 0.7450 0.9330]','linewidth',1)
fplot(y_biset,'r','linewidth',1)
scatter(X_inters,Y_inters,'k','linewidth',1.5)
xlabel('x')
ylabel('y')
title('Left curve design')
%Punti simmetrici
for i=1:L
    scatter(P_new(i,1),P_new(i,2),'MarkerEdgeColor',[0.8 0 0.3],'MarkerFaceColor',[0.8 0.2 0.6],'linewidth',1);
    hold on
    grid on
end
%Interpolazione dei punti della clotoide tramite spline
% delta_time=0:0.1:S_star;
% Curva = spline( XF_star_tmp',YF_star_tmp',delta_time);
% plot(delta_time,Curva,'Color',[0.4660 0.6740 0.1880],'linewidth',0.5)
axis equal

%% Insieme di punti

Inizio_curva_simm = P_new(1,1);
Fine_curva_simm = P_new(end,1);

%Punti totali
% P_x = real([P_rett_1(:,1);P(:,1);P_cerchio(:,1);P_new(:,1)]);
% P_y = real([P_rett_1(:,2);P(:,2);P_cerchio(:,2);P_new(:,2)]);

offset = 1;
P_x = real([P_rett_1(:,1);P_cerchio(offset:end,1);P_new(:,1)]);
P_y = real([P_rett_1(:,2);P_cerchio(offset:end,2);P_new(:,2)]);

%Punti rettifilo+clotoide+cerchio
% P_x_1 = real([P_rett_1(:,1);P(:,1);P_cerchio(:,1)]);
% P_y_1 = real([P_rett_1(:,2);P(:,2);P_cerchio(:,2)]);

offset = 1;
P_x_1 = real([P_rett_1(:,1);P_cerchio(offset:end,1)]);
P_y_1 = real([P_rett_1(:,2);P_cerchio(offset:end,2)]);

%Interpolo rettifilo+clotoide+cerchio
tempo = Inizio_rettifilo:0.1:Fine_cerchio;
Curva_interp=spline(P_x_1,P_y_1,tempo);

tempo_simm = Fine_curva_simm:0.1:Inizio_curva_simm;
Curva_interp_simm=spline(P_new(:,1),P_new(:,2),tempo_simm);

%Ne ricavo i punti da mandare a driving scenario. Dato che sono tanti li
%decimo di un numero pari N_dec
%N_dec = 1;
y_spline = (decimate(Curva_interp,N_dec))';
x_spline = (decimate(tempo,N_dec))';

% y_spline_simm = (decimate(Curva_interp_simm,N_dec))';
% x_spline_simm = (decimate(tempo_simm,N_dec))';
% 
% Data_DS(:,1) = [ x_spline;x_spline_simm];
% Data_DS(:,2) = [ y_spline;y_spline_simm];

%Distanza tra centro del cerchio (Xm,Ym) e Punti di
%rettifilo+clotoide+cerchio
d_C_curva_interp = sqrt((x_spline-Xm).^2 + (y_spline-Ym).^2);

%Plot
figure,
plot(d_C_curva_interp)
figure,
plot(tempo,Curva_interp,'b');
hold on
% plot(tempo_simm,Curva_interp_simm,'r');
grid on
for i=1:length(P_x)
    scatter(P_x(i),P_y(i),'x','r');
end
axis equal

figure,
hold on
for i=1:length(P_x_1)
    scatter(P_x_1(i),P_y_1(i),'x','b');  
end
grid on


%% LOADING DATA ON SCENARIO 
load('Test_clotoide_sx_10000.mat')

% data.RoadSpecifications.Centers = zeros(length(x_spline),3);
data.RoadSpecifications.Centers = zeros(length(P_x),3);

% data.RoadSpecifications.Centers (:,1) = x_spline ;
% data.RoadSpecifications.Centers (:,2) = y_spline;

data.RoadSpecifications.Centers (:,1) = P_x ;
data.RoadSpecifications.Centers (:,2) = P_y;

save('Test_clotoide_sx_10000.mat','tag','data')

disp('Fine')

%% RICORDA DI FAR GIRARE IL MAIN 

