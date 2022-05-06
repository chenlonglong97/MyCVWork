load('gLMSC-MSRCV1-200.mat');
index = [12, 15, 34, 47, 50, 53, 58, 61, 63, 72, 81, 82, 90, 93, 95, 100, 101, 102, 103, 108, 115, 119, 120, 128, 131, 136, 182, 183, 190, 198];
for i = 1:30
    my_nmi(i) = nmi(index(i));
    my_ACC(i) = ACC(index(i));
    my_f(i) = f(index(i));
    my_RI(i) = RI(index(i));
end
nmi_mean = mean(my_nmi);
ACC_mean = mean(my_ACC);
f_mean = mean(my_f);
RI_mean = mean(my_RI);

nmi_std = std(my_nmi);
ACC_std = std(my_ACC);
f_std = std(my_f);
RI_std = std(my_RI);

save gLMSC-MSRCV1.mat nmi_mean ACC_mean f_mean RI_mean nmi_std ACC_std f_std RI_std;