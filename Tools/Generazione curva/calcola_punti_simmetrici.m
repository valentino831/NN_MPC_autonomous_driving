function [P_new,L] = calcola_punti_simmetrici (X_inters,Y_inters,Xm,Ym,P_rett_1,P)


% ------------------------------------ NOTA ---------------------------------------

% Dati in ingresso due punti A=(X_inters,Y_inters), B=(Xm,Ym) e  un set di
% punti [P_rett_1;P] la funzione ritorna il simmetrico di questi punti
% rispetto alla retta passante per A e B e la lunghezza del vettore
% contenente questi punti.

% ---------------------------------------------------------------------------------
syms x y d y_rette_tmp

%Coordinate dei punti dell'asse di simmetria
P_A=[double(X_inters),double(Y_inters)];
P_B=[Xm,Ym];

%Asse di simmetria
y=(P_A(2)-P_B(2))/(P_A(1)-P_B(1))*(x-P_A(1))+P_A(2);
%Coefficiente angolare asse di simmetria e ordinata
m=(P_A(2)-P_B(2))/(P_A(1)-P_B(1));
q=-((P_A(2)-P_B(2))/(P_A(1)-P_B(1))*P_A(1))+P_A(2);

%Punti dello scenario
% P_originali_tmp = [P_rett_1(2:end,:);P]; %altrimenti l'ultimo punto viene replicato e driving scenario interpola male
P_originali_tmp = P_rett_1(2:end,:);
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
    fplot(y_rette(i),[-400 1000],'b','linewidth',0.5)
    hold on
    fplot(y,'r','linewidth',0.5)
    xline(0,'k--')
    yline(0,'k--')
    scatter(P_originali(i,1),P_originali(i,2),'o','k','linewidth',1)
    grid on
    scatter(X,Y,'o','y','linewidth',1)
    hold on
    scatter(P_new(i,1),P_new(i,2),'o','m','linewidth',1)
    axis([-500 800 -100 1200])
    
end

end



