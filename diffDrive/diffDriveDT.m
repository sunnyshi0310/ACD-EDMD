function xk1 = diffDriveDT(xk,uk,Ts)
M = 1;
delta = Ts/M;
xk1 = xk;
for ct = 1:M
    xk1 = xk+delta*diffDriveCT(xk1,uk);
end