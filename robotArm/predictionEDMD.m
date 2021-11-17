function [K, G, A] = predictionEDMD(x, u, numTraingData, index_j, index_d)
% Estimate the Koopman operator with EDMD
G = 0;
A = 0;
for i = 1:numTraingData  
    x_Phi = dictionary(x(:, i),u(:,i),index_j, index_d);    
    xp_Phi = dictionary(x(:, i+1),u(:,i+1), index_j, index_d);    
    G = G+x_Phi'*x_Phi;
    A = A+x_Phi'*xp_Phi;
end
G = G/numTraingData;
A = A/numTraingData;
K = pinv(G)*A;
