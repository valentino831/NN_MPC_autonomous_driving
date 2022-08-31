% calcola rette

% Sigmoide: 1/(1+e^(-a*(x-b)))

% Retta per a
% x1a = 20; % 80 km/h
% y1a = 0.3;
% 
% x2a = 36;
% y2a = 0.8;

x1a = 20; % 80 km/h
y1a = 0.2;

x2a = 36;
y2a = 0.8;


ma = (y1a-y2a)/(x1a-x2a)
qa = y1a-ma*x1a

return
% Retta per b
x1b = 20; % 80 km/h
y1b = 2.2;

x2b = 36;
y2b = 3;

mb = (y1b-y2b)/(x1b-x2b)
qb = y1b-mb*x1b
