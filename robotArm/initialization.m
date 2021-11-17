function [K] = initialization(index_d, Ts, index_j,nx,nu,INPUTS)
% index_d: choose different dictionaries
% index_j: number of joints
% T_s: sampling rate
% nx: number of states
% nu: number of inputs

M = 100; % number of tests
l_k = 200; % length for estimation 
% initialize the estimated Koopman operater
K = zeros(length(dictionary(zeros(nx,1),zeros(nu,1),index_j,index_d)));

for i = 1:M
    x_test(:,1) = zeros(nx+2,1);
    u_hat(1,1) = INPUTS(1,i,1); 
    u_hat(2,1) = INPUTS(2,i,1);
    
    % propagate the system
    for j = 1:l_k
        x_test(:,j+1) = rarmDT(x_test(:,j),u_hat(:,j),Ts,index_j);
        x_hat(:,j+1) = [sin(x_test(1,j+1)),cos(x_test(1,j+1)),sin(x_test(2,j+1)),cos(x_test(2,j+1))];
 
        u_hat(1,j+1) = INPUTS(1,i,j+1); 
        u_hat(2,j+1) = INPUTS(2,i,j+1);
    end
    K_test = predictionEDMD(x_hat, u_hat, l_k, index_j, index_d);
    
    K = (K+K_test);
end

K = K/M;

