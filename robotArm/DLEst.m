function z = DLEst(x, vv, W_out,b_out,W0,W1,W2,b0,b1,b2)
phi =  FFnet(W_out,b_out,W0,W1,W2,b0,b1,b2,x);
prediction = phi*vv;

z = real(prediction(1:2));

