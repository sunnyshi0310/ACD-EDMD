function x_phi = dictionary(x, u, index_d)
if index_d == 1
    x1_2h = [1, x(1), x(1)^2-1];
    x2_2h = [1, x(2), x(2)^2-1];
    x3_1es = [1, x(3)];
    x3_1ec = [1, x(4)];
    x3_1r = kron(x3_1ec,x3_1es);
    u1 = [1,u(1)];
    u2 = [1,u(2)];
    x_ext = kron(kron(x1_2h,x2_2h),x3_1r);
    u_ext = kron(u1, u2);
    x_phi = kron(u_ext,x_ext);
end
if index_d == 2 % ACD-EDMD
    x1_2h = [1, x(1)];
    x2_2h = [1, x(2)];
    x3_1es = [1, x(3)];
    x3_1ec = [1, x(4)];
    x3_1r = kron(x3_1ec,x3_1es);
    u1 = [1,u(1)];
    u2 = [1,u(2)];
    x_ext = kron(kron(x1_2h,x2_2h),x3_1r);
    u_ext = kron(u1, u2);
    x_phi = kron(u_ext,x_ext);%[x_ext,u(1),u(2)];%
end
if index_d == 3
    x1_2h = [1, x(2), x(2)^2-1];
    x3_1es = [1, x(3)];
    x3_1ec = [1, x(4)];
    x3_1r = kron(x3_1ec,x3_1es);
    u1 = [1,u(1)];
    u2 = [1,u(2)];
    x_ext = kron(x1_2h,x3_1r);
    u_ext = kron(u1, u2);
    x_phi = kron(u_ext,x_ext);
end   

if index_d == 4 % DMD
    x_phi = [x(1),x(2),x(3),u(1),u(2)];
end

if index_d == 5
    x1_2h = [1, x(1), 1*x(1)^2-1];
    x2_2h = [1, x(2), 1*x(2)^2-1];
    x3_2h = [1, x(3), 1*x(3)^2-1];
    u1 = [1,u(1)];
    u2 = [1,u(2)];
    x_ext = kron(kron(x1_2h,x2_2h),x3_2h);
    u_ext = kron(u1, u2);
    x_phi = kron(u_ext,x_ext);
end

if index_d == 7
    x1_2h = [1, x(1)];
    x2_2h = [1, x(2)];
    x3_1es = [1, x(3)];
    x3_1ec = [1, x(4)];
    x3_1r = kron(x3_1ec,x3_1es);
    x_ext = kron(kron(x1_2h,x2_2h),x3_1r);
    x_phi = x_ext;
end
    