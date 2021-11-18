function z = koopEst(x,u,vv,index_j,index_d,nx)

phi =  dictionary(x,u,index_j, index_d);
prediction = phi*vv;

if index_d == 1
    z = real(prediction(1:2));% ACD-EDMD
else
    z = real(prediction(1:4));% Hermite poly
end
