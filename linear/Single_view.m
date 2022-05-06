load('bbcsport-mtv.mat');

cls_num = size(unique(gt),1);
V = size(X,2);
% for i=1:V
%     X{i} = X{i}./repmat(sqrt(sum(X{i}.^2,1)),size(X{i},1),1);
%     %X{i} = X{i}(:,1:100);
% end

for i = 1:30
    [nmi(i),ACC(i),f(i),RI(i)] = KMEANS2(X{2}', cls_num, gt);
end
nmi_mean = mean(nmi);
ACC_mean = mean(ACC);
f_mean = mean(f);
RI_mean = mean(RI);

nmi_std = std(nmi);
ACC_std = std(ACC);
f_std = std(f);
RI_std = std(RI);
save KMEANSBBCSportview2.mat nmi ACC f RI nmi_mean ACC_mean f_mean RI_mean nmi_std ACC_std f_std RI_std;