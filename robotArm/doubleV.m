function vv = doubleV(K,nx,nu,index_d)
[V,D]= eig(K);
W = inv(V).';
l_d = length(K);
B_para = wMatrix(nx,nu,l_d,index_d);
vv= zeros(size(B_para));
for j = 1:length(V)
    vj = W(:,j).'*B_para;
    vv = D(j,j)*V(:,j)*vj+vv;
end