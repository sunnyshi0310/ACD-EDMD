function z = koopEst(x,u,vv,index_d)

phi =  dictionary(x,u,index_d);
prediction = phi*vv;
if index_d == 1 % ACD-EDMD
    z = real(prediction(1:4));
else
    z = real(prediction(1:3));% Hermite polynomial
end
