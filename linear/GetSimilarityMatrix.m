function [S] = GetSimilarityMatrix(M)
%Find the distance between each pair of observations in X
%by using the pdist and squareform functions with the 
%default Euclidean distance metric.
dist_temp = pdist(M);
dist = squareform(dist_temp);
S = exp(-dist.^2);