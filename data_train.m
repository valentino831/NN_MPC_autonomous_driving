%load('InLK_data')

% Save the actual length of the data vectors
dimLK  = length(InLK);
dimHK  = length(InHK);
dimOT  = length(InOT);
dimRE  = length(InRE);

% Retrieve the enable signals from the simulink schematic
en1 = out.en1.signals.values;
en2 = out.en2.signals.values;
en3 = out.en3.signals.values;
en4 = out.en4.signals.values;

% Save the data coming from the simulation
% INPUT
In1 = out.InLK.signals.values;
In2 = out.InHK.signals.values;
In3 = out.InOT.signals.values;
In4 = out.InRE.signals.values;

%OUTPUT
Out1 = out.OutLK.signals.values;
Out2 = out.OutHK.signals.values;
Out3 = out.OutOT.signals.values;
Out4 = out.OutRE.signals.values;

% t is the index of the data vectors in order to append the new data to the
% old ones
t1 = dimLK+1;
t2 = dimHK+1;
t3 = dimOT+1;
t4 = dimRE+1;


% Append the data in the correspondant vector
for k = 1:length(en1)
    if en1(k) == 1
        InLK(t1,:)  = out.InLK.signals.values(k,:);
        OutLK(t1,:) = out.OutLK.signals.values(k,:);
        t1 = t1+1;
    end
    if en2(k)
        InHK(t2,:)  = out.InHK.signals.values(k,:);
        OutHK(t2,:) = out.OutHK.signals.values(k,:);
        t2 = t2+1;
    end
    if en3(k)
        InOT(t3,:)  = out.InOT.signals.values(k,:);
        OutOT(t3,:) = out.OutOT.signals.values(k,:);
        t3 = t3+1;
    end
    if en4(k)
        InRE(t4,:)  = out.InRE.signals.values(k,:);
        OutRE(t4,:) = out.OutRE.signals.values(k,:);
        t4 = t4+1;
    end
    
end

save('LK_to_pin_data_01.mat','InLK','OutLK')
