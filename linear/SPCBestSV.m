% load('ORL_mtv.mat');
% load('bbcsport-mtv.mat');
% load('MSRC-v1.mat');
load('MSRCV1.mat');

cls_num = size(unique(gt),1);
V = size(X,2);
for i=1:V
    X{i} = X{i}./repmat(sqrt(sum(X{i}.^2,1)),size(X{i},1),1);
    %X{i} = X{i}(:,1:100);
end

S = GetSimilarityMatrix(X{6}');
for i = 1:30
    [nmi(i),ACC(i),f(i),RI(i)]=clustering(S, cls_num, gt);
end
nmi_mean = mean(nmi);
ACC_mean = mean(ACC);
f_mean = mean(f);
RI_mean = mean(RI);

nmi_std = std(nmi);
ACC_std = std(ACC);
f_std = std(f);
RI_std = std(RI);
save MSRC1view6.mat nmi ACC f RI nmi_mean ACC_mean f_mean RI_mean nmi_std ACC_std f_std RI_std;

% % select single view rapidly
% C =spectralcluster(X{1}',cls_num);
% [A nmi avgent] = compute_nmi(gt,C);
% ACC = Accuracy(C,double(gt));
% [f,p,r] = compute_f(gt,C);
% [AR,RI,MI,HI]=RandIndex(gt,C);

% for i = 1:30
%     C =spectralcluster(X{1}',cls_num);
%     [A nmi(i) avgent] = compute_nmi(gt,C);
%     ACC(i) = Accuracy(C,double(gt));
%     [f(i),p,r] = compute_f(gt,C);
%     [AR,RI(i),MI,HI]=RandIndex(gt,C);
% end
% 
% nmi_mean = mean(nmi);
% ACC_mean = mean(ACC);
% f_mean = mean(f);
% RI_mean = mean(RI);
% 
% nmi_std = std(nmi);
% ACC_std = std(ACC);
% f_std = std(f);
% RI_std = std(RI);
% 
% save SPCbestsv-BBCSport.mat nmi ACC f RI nmi_mean ACC_mean f_mean RI_mean nmi_std ACC_std f_std RI_std;