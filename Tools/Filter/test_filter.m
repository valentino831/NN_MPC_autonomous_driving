clear all
close all
clc

Ts = 0.1;
load('Test_LK_to_pin_STEER_Filtered.mat')

time = time;

load('Data_LK_to_pin_steer.mat')

N = length(Y);

N_field = 2;

%time=linspace(0,139,1400);

% field1='time';
% field2='delta_deg';
% field3='Lateral_offset_3';
% field4='xddot';
% field5='yddot';
% field6='xdot';
% field7='ydot';

val2=Output_data';
val3=Y';
% val3=Lateral_offset_3;
% val4=xddot;
% val5=yddot;
% val6=xdot;
% val7=ydot;
%val8=d_rel;

%time = time;

%val = [val2,val3,val4,val5,val6,val7];
%val = [val2,val3-1.75];
val = [val2,val3];

for i =1:N_field
f_spect = fft(val(:,i))
f_spect = fftshift(f_spect);

freqs = N/2*linspace(-1,1,N);
figure,plot(freqs,abs(f_spect)),title('Frequency spectrum'),xlabel('frequency [Hz]');

%f_cut = 100; %Hz

Fnorm = 0.05;

df = designfilt('lowpassfir','FilterOrder',70,'CutoffFrequency',Fnorm);

grpdelay(df,2048,1/Ts)

D = mean(grpdelay(df));

y = filter(df,[val(:,i); zeros(D,1)]);  % Append D zeros to the input data
y = y(D+1:end);                  % Shift data to compensate for delay

plot(val(:,i));
hold on
plot(y);
hold off
title('Filtered Waveforms')
xlabel('Time (s)')
legend('Original Noisy Signal','Filtered Signal')
grid on
axis tight

figure,
plot(y)

val(:,i) = y;

end

%  delta_deg = val(:,1);
%  Lateral_offset_3 = val(:,2);
 st_cntr = val(:,1);
 st_nn = val(:,2);
% Lateral_offset_3 = val(:,2);
% xddot = val(:,3);
% yddot = val(:,4);
% xdot = val(:,5);
% ydot = val(:,6);
%d_rel = val(:,7);

save('Test_LK_to_pin_STEER_Filtered.mat','time','st_cntr','st_nn')%,'Lateral_offset_3','xddot','yddot','xdot','ydot')%,'d_rel')

%%
% f_spect1 = fft(y);
% f_spect1 = fftshift(length(y));

% freqs = length(y)/2*linspace(-1,1,length(y));
% figure,
% plot(freqs,abs(f_spect1)),title('Frequency spectrum'),xlabel('frequency [Hz]')
% hold on;
% plot(freqs,abs(f_spect)), grid on;