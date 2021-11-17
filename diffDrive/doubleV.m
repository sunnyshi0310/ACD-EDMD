function vv = doubleV(K,nx,nu,index_d)
[V,D]= eig(K); % calculate the eigen-decomposition of K: V eigenvector; D eigenvalues
W = inv(V).';
l_d = length(K);
B_para = wMatrix(nx+1,nu,l_d,index_d); % get the weighting matrix according to the selected dictionary
vv = zeros(size(B_para));
for j = 1:length(V)
    vj = W(:,j).'*B_para;
    vv = D(j,j)*V(:,j)*vj+vv;
end