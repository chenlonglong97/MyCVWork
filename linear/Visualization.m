rng default % for reproducibility
Result = tsne(H','Algorithm','barneshut');
figure
gscatter(Result(:,1),Result(:,2),Y)