%% LMSC (CVPR-17)
% load('bbcsport-mtv.mat');
load('ORL_mtv.mat')
fprintf('Latent representation multiview subspace clustering\n');
num_views = size(X,2);
numClust = size(unique(gt),1);

lambda = 100; K = 100; 
[nmi,ACC,f,RI,H] = LRMSC(X,gt,numClust,lambda,K);
% H = H./repmat(sqrt(sum(H.^2,1)),size(H,1),1);
% for i = 1:30
%     [nmi(i),ACC(i),f(i),RI(i)] = KMEANS2(H', numClust, gt);
% end
% nmi_mean = mean(nmi);
% ACC_mean = mean(ACC);
% f_mean = mean(f);
% RI_mean = mean(RI);
% 
% nmi_std = std(nmi);
% ACC_std = std(ACC);
% f_std = std(f);
% RI_std = std(RI);
%save KMEANORLH.mat nmi ACC f RI nmi_mean ACC_mean f_mean RI_mean nmi_std ACC_std f_std RI_std lambda K;