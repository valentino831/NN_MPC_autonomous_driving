
inLK_tot = [];
outLK_tot = [];

Data = ['LK_data_01';'LK_data_02';'LK_data_03';'LK_data_14';'LK_data_15';'LK_data_19']

[nR,~] = size(Data);

for i = 1 : nR
    load(Data(i,:))
    
    L = length(InLK);
    
    x0   = InLK(:,1:8);
    vdes = InLK(:,9);
    wall = InLK(:,10:21);
    obs =  zeros(L,4);
    curv = InLK(:,end);
    in = [x0,vdes,wall,obs,curv];
    out = OutLK;
    
    if i > 1
        inLK_tot = cat(1,in_prev,in);
        outLK_tot = cat(1,out_prev,out);
        in_prev = inLK_tot;
        out_prev= outLK_tot;
    else
        in_prev = in;
        out_prev= out;
        inLK_tot = in;
        outLK_tot = out;
    end  
    
end

save('LK_data_00','inLK_tot','outLK_tot')
disp ('Saved')
    