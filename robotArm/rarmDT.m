function xk1 = rarmDT(xk,uk,Ts,index_j)
M = 1;
delta = Ts/M;
xk1 = xk;
for ct = 1:M
    xk1 = xk+delta*rarmCT(xk1,uk,index_j);
end