function [nmi,ACC,f,RI,H] = GLMSC(X,gt,cls_num,alpha_v,lambda,gamma,eta1,eta2, K)
% Initialize
V = size(X,2); %number of views
N = size(X{1},2); % number of data points
eps = 10e-8;

for v=1:V
    X{v} = X{v}./(repmat(sqrt(sum(X{v}.^2,1)+10e-8),size(X{v},1),1)+eps);
end
for v=1:V 
    alpha{v} = alpha_v;
    d1{v} = 100;  %dimentionality of the middle layer
    d2{v} = N;  %dimentionality of the output layer
end
Z = zeros(N,N);
J = zeros(N,N);
H = rand(K,N)/10;
Y = zeros(N,N);
for v = 1:V
    W1{v} = rand(d1{v},K)/10;
    W2{v} = zeros(d2{v},d1{v});
end

% updating variables...
IsConverge = 0;
mu = 1e-6;
pho = 1.2;
max_mu = 1e6;
max_iter = 30;
max_iter_out = 100;
iter = 1;
while (IsConverge == 0&&iter<max_iter_out+1)
    % Update the networks
    [W1,W2] = ext_updateNetwork(X,H,W1,W2,alpha,gamma,eta1,max_iter,d1);
    % Update latent representation H
    H = ext_updateH(X,H,Z,W1,W2,alpha,eta2,max_iter);
    % Update Z
    Z = inv(H'*H+mu*eye(N))*(mu*J-Y+H'*H);
    % Update J
    J = softth((Z+Y/mu)+eye(N)*1e-8,lambda/mu);
    % Update Y
    Y = Y+ mu.*(Z-J);
    
    mu = min(pho*mu, max_mu);
    % convergence conditions
    thrsh = 1e-5;
    if(norm(Z-J,inf)<thrsh)
        IsConverge = 1;
    end
    iter = iter + 1;
end
[nmi,ACC,f,RI]=clustering(abs(Z)+abs(Z'), cls_num, gt);
