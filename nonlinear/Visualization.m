close all;
addpath './dataset';
addpath 'E:\matlab_work\paper_retrieval\GLMSC\mytry2';
load('MSRCV1.mat');
load('resultH.mat');
Y = gt;

rng default % for reproducibility
Result = tsne(H','Algorithm','barneshut');
figure
gscatter(Result(:,1),Result(:,2),Y)