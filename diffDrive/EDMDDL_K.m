function K = EDMDDL_K(x, numTraingData,lambda,W_out,b_out,W0,W1,W2,b0,b1,b2)
% Estimate the Koopman operator with EDMD
G = 0;
A = 0;
for i = 1:numTraingData  
    x_Phi = FFnet(W_out,b_out,W0,W1,W2,b0,b1,b2,x(:, i));    
    xp_Phi = FFnet(W_out,b_out,W0,W1,W2,b0,b1,b2,x(:, i+1));    
    G = G+x_Phi'*x_Phi;
    A = A+x_Phi'*xp_Phi;
end
G = G/numTraingData;
A = A/numTraingData;
M = length(G);
K = (pinv(G)+lambda*eye(M))*A;
