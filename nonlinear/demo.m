% GLMSC(TPAMI-2018)
clear;
addpath './dataset';
% load('bbcsport_2view.mat');
% load('MSRCV1.mat');
load('ORL.mat');

fprintf('Generalized Latent Multi-View Subspace Clustering\n');
numClust = size(unique(gt),1);
% alpha: view-specific weights networks
% lambda: regularization on subspace representations
% gamma: regularization on networks
% eta1: learning rate for updating networks
% eta2: learning rate for updating latent representation H
% K: The dimensionality of latent representation
alpha = 0.6 ; lambda = 0.7; gamma = 0.1; eta1 = 0.1; eta2 = 0.01; K = 100; 

[nmi,ACC,f,RI,H] = GLMSC(X,gt,numClust,alpha,lambda,gamma,eta1,eta2, K);

% save resultH.mat H;

% for i = 1:200
%     [nmi(i),ACC(i),f(i),RI(i),H] = GLMSC(X,gt,numClust,alpha,lambda,gamma,eta1,eta2, K);
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
% 
% save gLMSC-MSRCV1.mat nmi ACC f RI nmi_mean ACC_mean f_mean RI_mean nmi_std ACC_std f_std RI_std alpha lambda gamma eta1 eta2 K H;
