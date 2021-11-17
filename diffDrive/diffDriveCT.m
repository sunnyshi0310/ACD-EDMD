function dxdt = diffDriveCT(x,u)
% x: x, y, theta; u: vr,vl
r = 53/1000;%0.33;
L = 210/1000;%2;
dxdt = x;
dxdt(1) = r/2*(u(1)+u(2))*cos(x(3));
dxdt(2) = r/2*(u(1)+u(2))*sin(x(3));
dxdt(3) = r/L*(u(1)-u(2));