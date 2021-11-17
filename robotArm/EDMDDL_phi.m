function [Wout_,bout_,W0_,W1_,W2_,b0_,b1_,b2_] = EDMDDL_phi(nx,x,K,l_k,Wout,bout,W0,W1,W2,b0,b1,b2,delta)
% The code illustrates the backpropagation process of a DL with three
% layers explicitly.
for k = 1:l_k
    x_Phi = FFnet(Wout,bout,W0,W1,W2,b0,b1,b2,x(:, k));    
    xp_Phi = FFnet(Wout,bout,W0,W1,W2,b0,b1,b2,x(:, k+1)); 
    difference = (xp_Phi'-K*x_Phi')';
    dJdp = 2*difference(1+nx+1:25);% 1*21
  
    input = [x(:,k)];
    h0 = input; % inputs layer
    h1 = tanh(W0*h0+b0); % first layer
    h2 = tanh(W1*h1+b1); % second layer 
    h3 = tanh(W2*h2+b2); % third layer
    
    dJdWout = dJdp'*h3';
    dJdbout = dJdp';
    dJdh3 = (dJdp*Wout)'.*(1-tanh(W2*h2+b2).^2);
    dJdh2 = W2'*dJdh3.*(1-tanh(W1*h1+b1).^2);
    dJdh1 = W1'*dJdh2.*(1-tanh(W0*h0+b0).^2);

    dJdW2 = dJdh3*h2';
    dJdb2 = dJdh3;
    dJdW1 = dJdh2*h1';
    dJdb1 = dJdh2;
    dJdW0 = dJdh1*h0';
    dJdb0 = dJdh1;
    
    Wout = Wout+delta*dJdWout;
    bout = bout+delta*dJdbout;
    W2 = W2+delta*dJdW2;
    b2 = b2+delta*dJdb2;
    W1 = W1+delta*dJdW1;
    b1 = b1+delta*dJdb1;
    W0 = W0+delta*dJdW0;
    b0 = b0+delta*dJdb0;
end
Wout_ = Wout;
bout_ = bout;
W2_ = W2;
b2_ = b2;
W1_ = W1;
b1_ = b1;
W0_ = W0;
b0_ = b0;  
