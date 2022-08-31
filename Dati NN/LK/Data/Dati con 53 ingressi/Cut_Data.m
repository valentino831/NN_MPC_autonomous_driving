load ('HK_data_23.mat')
Ts = 0.1;
in  = 20 / Ts;
fin = 22 / Ts;

InHK= InHK(in:end,:);
OutHK = OutHK(in:end,:);

save('HK_data_23.mat','InHK','OutHK')
