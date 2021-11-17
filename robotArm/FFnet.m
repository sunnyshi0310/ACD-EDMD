function x_phi = FFnet(W_out,b_out,W0,W1,W2,b0,b1,b2,x)
input = [x];
h0 = input;
h1 = tanh(W0*h0+b0);
h2 = tanh(W1*h1+b1);
h3 = tanh(W2*h2+b2);
x_net = W_out*h3+b_out;
x_phi = [1,x',x_net'];