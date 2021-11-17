function z = sindyEst(x,u,E, Ts)
X = [x',u'];
X_theta(:,1) = Dic_sindy(X,'constant');
X_theta = [X_theta, Dic_sindy(X,'first')];
X_theta = [X_theta, Dic_sindy(X,'second')];
X_theta = [X_theta, Dic_sindy(X,'sin')];
X_theta = [X_theta, Dic_sindy(X,'cos')];
x_dot = E*X_theta';
x_k = x_dot;
z = real(x_k(1:3))+x;

