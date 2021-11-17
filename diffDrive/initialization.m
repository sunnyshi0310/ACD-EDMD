function [K,INPUTS] = initialization(index_d,Ts,nx,nu,INPUTS)
% index_d: choose different dictionaries
% T_s: sampling rate
% nx: number of states
% nu: number of inputs

M = 100; % number of tests
l_k = 500; % length for estimation
% initialize the estimated Koopman operater
K = zeros(length(dictionary(zeros(nx+1,1),zeros(nu,1),index_d)));
noise = zeros(nx,1); % optional

for i = 1:M
    x_test(:,1) = zeros(nx,1);    
    u_hat(1,1) = INPUTS(1,i,1); 
    u_hat(2,1) = INPUTS(2,i,1);
    x_hat(:,1) = zeros(nx+1,1);
    
    % propagate the system
    for j = 1:l_k
        x_test(:,j+1) = diffDriveDT(x_test(:,j),u_hat(:,j),Ts);
        x_hat(1:2,j+1) = x_test(1:2,j+1)+noise;
        x_hat(3:4,j+1) = [sin(x_test(3,j+1)),cos(x_test(3,j+1))];
        
        u_hat(1,j+1) = INPUTS(1,i,j+1); 
        u_hat(2,j+1) = INPUTS(2,i,j+1);
    end
    K_test = predictionEDMD(x_hat, u_hat, l_k, index_d); % estimate the operator from data
    K = (K+K_test);    
end

K = K/M;
