

syms x y y1 y1 y2 y3 y4 y5 

%Coordinate dei punti dell'asse di simmetria
A=[X_inters,Y_inters];
B=[Xm,Ym];

%Asse di simmetria
y=(A(2)-B(2))/(A(1)-B(1))*(x-A(1))+A(2)
%Coefficiente angolare asse di simmetria
m=(A(2)-B(2))/(A(1)-B(1));

%Punti dello scenario


A1=[-388,-47];
B1=[-55,43];
C1=[110,169];
D1=[237,409];
E1=[271,723];

%Rette passanti per i punti dello scenario perpendicolari all'asse di
%simmetria y

y1=-1/m*(x-A1(1))+A1(2);
y2=-1/m*(x-B1(1))+B1(2);
y3=-1/m*(x-C1(1))+C1(2);
y4=-1/m*(x-D1(1))+D1(2);
y5=-1/m*(x-E1(1))+E1(2);

%Plot dell'asse di simmetria dei punti dello scenario e delle rette y1...ym
figure,
fplot(y)
hold on
scatter(A(1),A(2))
hold on
scatter(B(1),B(2))
hold on
scatter(A1(1),A1(2))
hold on
scatter(B1(1),B1(2))
hold on
scatter(C1(1),C1(2))
hold on
scatter(D1(1),D1(2))
hold on
scatter(E1(1),E1(2))
hold on
fplot(y1)
fplot(y1)
fplot(y2)
fplot(y3)
fplot(y4)
fplot(y5)
grid on

%% Calcolo dei nuovi punti A2,,,Am simmetrici a A1...Am rispetto all'asse di simmetria y

%A2
temp1=subs(y,x,A1(1));
ya=abs(temp1-A1(2));

temp2=solve(y-(A(2)-B(2))/(A(1)-B(1))*(x-A(1))-A(2)==0,y==A1(2),x);
xa=abs(temp2-A1(1));
 
A2=[A1(1)-xa,A1(2)+ya];
 
scatter(A2(1),A2(2))


%B2
temp1=subs(y,x,B1(1));
yb=abs(temp1-B1(2));

temp2=solve(y-(A(2)-B(2))/(A(1)-B(1))*(x-A(1))-A(2)==0,y==B1(2),x);
xb=abs(temp2-B1(1));
 
B2=[B1(1)-xb,B1(2)+yb];

scatter(B2(1),B2(2))

%C2
temp1=subs(y,x,C1(1));
yc=abs(temp1-C1(2));

temp2=solve(y-(A(2)-B(2))/(A(1)-B(1))*(x-A(1))-A(2)==0,y==C1(2),x);
xc=abs(temp2-C1(1))

C2=[C1(1)-xc,C1(2)+yc];
scatter(C2(1),C2(2))

%D2
temp1=subs(y,x,D1(1));
yd=abs(temp1-D1(2));

temp2=solve(y-(A(2)-B(2))/(A(1)-B(1))*(x-A(1))-A(2)==0,y==D1(2),x);
xd=abs(temp2-D1(1));

D2=[D1(1)-xd,D1(2)+yd];
scatter(D2(1),D2(2))

%E2
temp1=subs(y,x,E1(1));
ye=abs(temp1-E1(2));

temp2=solve(y-(A(2)-B(2))/(A(1)-B(1))*(x-A(1))-A(2)==0,y==E1(2),x)
xe=abs(temp2-E1(1));

E2=[E1(1)-xe,E1(2)+ye];
scatter(E2(1),E2(2))

%% Interpolazione - spline

X1=[A(1),A1(1),B1(1),C1(1),D1(1),E1(1),B(1)];
Y1=[A(2),A1(2),B1(2),C1(2),D1(2),E1(2),B(2)];

QX1=-800:0.1:300
QY1=spline(X1,Y1,QX1)

hold on
plot(QX1,QY1)

X2=[A(1),A2(1),B2(1),C2(1),D2(1),E2(1),B(1)];
Y2=[A(2),A2(2),B2(2),C2(2),D2(2),E2(2),B(2)];

QX2=-800:0.1:300
QY2=spline(X2,Y2,QX2)

hold on
plot(QX2,QY2)




