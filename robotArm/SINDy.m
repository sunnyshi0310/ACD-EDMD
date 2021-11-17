function Xi = SINDy(x, u, Ts)
X = [x',u'];

% Construct the theta(X) and X_dot matrices
n = size(X,2);
l_k = size(X,1);
X_theta(:,1) = Dic_sindy(X,'constant');
X_theta = [X_theta, Dic_sindy(X,'first')];
X_theta = [X_theta, Dic_sindy(X,'second')];
X_theta = [X_theta, Dic_sindy(X,'sin')];
X_theta = [X_theta, Dic_sindy(X,'cos')];
for i = 1:l_k-1
    X_dot(i,:) = X(i+1,:)-X(i,:);
end
    
for k = 1:n
    B = lasso(X_theta(1:end-1,:),X_dot(:,k));
    Xi(k,:) = B(:,1);
end
