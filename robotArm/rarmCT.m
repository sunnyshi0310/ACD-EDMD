function dxdt = rarmCT(x,u,index_j)
if index_j == 2
    % x: theta1, theta2, theta1_dot, theta2_dot; u: tau1, tau2
    L1 = 1;
    L2 = 1;
    m1 = 0.1;
    m2 = 0.1;
    g = 9.8;
    dxdt = x;
    M = [m1*L1^2+m2*(L1^2+2*L1*L2*cos(x(2))+L2^2) m2*(L1*L2*cos(x(2))+L2^2);m2*(L1*L2*cos(x(2))+L2^2) m2*L2^2];
    C = [-m2*L1*L2*sin(x(2))*(2*x(3)*x(4)+x(4)^2);m2*L1*L2*x(3)^2*sin(x(2))];
    g = [(m1+m2)*L1*g*cos(x(1))+m2*g*L2*cos(x(1)+x(2)); m2*g*L2*cos(x(1)+x(2))];
    dxdt(1:2) = [x(3);x(4)];  
    dxdt(3:4) = inv(M)*(u-C-g);
end
