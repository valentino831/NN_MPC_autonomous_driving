clear all
close all
clc

figure,
hold on

x_set = [0 2 3.4 5.2 6.8];
y_set = [0 0.8 1.75 3 3.5];
time = linspace(0,6.8,100);
t0 = 6.8;
b =3.5/t0;

rho = 0.0375*(130/3.6)-0.5500;

f_prime_1 = b*cos(2*pi*time/t0);
f_prime_2 = -f_prime_1;
f_prime_3 = f_prime_2+b;
f = -b*t0/(2*pi)*sin(2*pi*time/t0)+b*time;
f_trasl = -b*t0/(2*pi)*sin(2*pi*(time+rho)/t0)+b*(time+rho);

 plot(time,f,'b--','linewidth',1)
 hold on
 plot(time,f_trasl,'color','[0.4660 0.6740 0.1880]','linewidth',1)
 legend('Original offset function','Offset function when v_{ego} = 130 km/h')
 title('Offset function shifted')
 
yline(0,'k--');
scatter(0,0,'b','o','linewidth',1);
scatter(6.8,3.5,'r','o','linewidth',1);
txt ='T_f'
text(6.5,-2.3,txt,'fontsize',10,'color','[0.9290 0.6940 0.1250]')
ylim([-2.5 6])
xline(6.8,'color','[0.9290 0.6940 0.1250]','linewidth',1)
yline(3.5,'k--')
yline(5.25,'k','linewidth',1)
yline(1.75,'k','linewidth',1)
yline(-1.75,'k','linewidth',1)
P1=[6.6 3.5];
P2=[6.8 3.5];
P3=[0 0];
P4=[0.2 0];
x_s_1 = [P1(1) P2(1)];
y_s_1 = [P1(2) P2(2)];
t_s_1 = linspace(6.6,6.8,10);
x_s_2 = [P3(1) P4(1)];
y_s_2 = [P3(2) P4(2)];
t_s_2 = linspace(0,0.2,10);
seg_1 = spline(x_s_1,y_s_1,t_s_1);
seg_2 = spline(x_s_2,y_s_2,t_s_2);
xlabel('Time [s]')
ylabel('Lateral displacement [m]')



traj_orig = spline(x_set,y_set,time);
t0 = 6.8;
b =3.5/t0;

rho = 0.0375*(130/3.6)-0.5500;

f_prime_1 = b*cos(2*pi*time/t0);
f_prime_2 = -f_prime_1;
f_prime_3 = f_prime_2+b;
f = -b*t0/(2*pi)*sin(2*pi*time/t0)+b*time;
f_trasl = -b*t0/(2*pi)*sin(2*pi*(time+rho)/t0)+b*(time+rho);

legend('Original offset function','Offset function when v_{ego} = 130 km/h')

return
% plot(time,traj_orig,'b','color','[0 0.4470 0.7410]','linewidth',1)
% title('Overtake & Re-entry offsets')
%   plot(t_s_1,seg_1,'color','[0.3010 0.7450 0.9330]','linewidth',4) 
%   hold on 
%   plot(t_s_2,seg_2,'color','[0.3010 0.7450 0.9330]','linewidth',4) 
%   title('Overtake & Re-entry offsets')
% plot(time,f_prime_1,'color','[0.4660 0.6740 0.1880]','linewidth',1)
% title('Derivative of the function')
%  plot(time,f_prime_2,'color','[0.4940 0.1840 0.5560]','linewidth',1)
%  title('Derivative of the function mirrored')
% plot(time,f_prime_3,'color','[0.8500 0.3250 0.0980]','linewidth',1)
% title('Derivative of the function shifted')
%   plot(time,f,'b--','linewidth',1)
%   hold on
% % title('Offset function')
%  plot(time,f_trasl,'color','[0.4660 0.6740 0.1880]','linewidth',1)
%  legend('Original offset function','Offset function when v_{ego} = 130 km/h')
%  title('Offset function translated')




