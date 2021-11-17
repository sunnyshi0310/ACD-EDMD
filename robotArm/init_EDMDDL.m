function [K,Wout,bout,W0,W1,W2,b0,b1,b2,delta_phi] = init_EDMDDL(Ts, nx, nu, INPUTS,index_j)
nx = nx+2;
M = 1000;
l_k =10; % length for estimation 

delta = 0.01; % learning rate
lambda = 0.01; % regularizer 
K = zeros(25); % initialize K
D = 25-nx-1; % size of learned dictionary
size_h = 10; % size of hidden layer

% Initialize the weighting matrix and bias
Wout = ones(D,size_h);
bout = zeros(D,1);
W0 = ones(size_h,nx);
W1 = eye(size_h);
W2 = eye(size_h);
b0 = zeros(size_h,1);
b1 = zeros(size_h,1);
b2 = zeros(size_h,1);

% Generate the training data set
for i = 1:M
    x_test(:,(i-1)*l_k+1) = zeros(nx,1);    
    u_hat(1,1) = INPUTS(1,i,1); 
    u_hat(2,1) = INPUTS(2,i,1);
    
    for j = 1:l_k-1
        x_test(:,(i-1)*l_k+j+1) = rarmDT(x_test(:,(i-1)*l_k+j),u_hat(:,j),Ts,index_j);        
        u_hat(1,j+1) = INPUTS(1,i,j+1); 
        u_hat(2,j+1) = INPUTS(2,i,j+1);
    end     
end

%%
e = 0.01; % error threshold
delta_phi = 1;
index = 0;
while and(delta_phi > e,index<1000) 
    for i = 1:M
        x = x_test(:,(i-1)*l_k+1:(i-1)*l_k+l_k);
        % Forward propagation: estimate the operator using current nn
        K = EDMDDL_K(x, l_k-1,lambda,Wout,bout,W0,W1,W2,b0,b1,b2);
        % Back propagation: use current K to update weighting matrix and bias 
        [Wout,bout,W0,W1,W2,b0,b1,b2] = EDMDDL_phi(nx,x,K,l_k-1,Wout,bout,W0,W1,W2,b0,b1,b2,delta);
    end
    
    % Calculate the error (cost function)
    delta_phi = 0;
    for k = 1:l_k-1
        x_Phi = FFnet(Wout,bout,W0,W1,W2,b0,b1,b2,x(:, k));    
        xp_Phi = FFnet(Wout,bout,W0,W1,W2,b0,b1,b2,x(:, k+1)); 
        delta_phi = delta_phi+norm(xp_Phi'-K*x_Phi')^2;
    end
    delta_phi = delta_phi+lambda*norm(K,Inf)^2;
    index = index+1;
end
