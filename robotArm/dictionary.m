function x_phi = dictionary(x, u, index_j, index_d)%
% x = theta1, theta2, theta1_dot, theta2_dot, u= tau1 tau2
% check the number of links    
if index_j == 2
    if index_d == 1
        x1_2r = radial(x(1),2);
        x2_2r = radial(x(2),2);
        u1 = [1,u(1)];
        u2 = [1,u(2)];
        x_ext = kron(x1_2r,x2_2r);
        u_ext = kron(u1,u2);
        x_phi = kron(x_ext,u_ext);
    end
    
    if index_d == 2
        x1_2r = radial(x(1),2);
        x2_2r = radial(x(2),2);
        x3 = [1,x(3)];
        x4 = [1,x(4)];
        u1 = [1,u(1)];
        u2 = [1,u(2)];
        x_ext = kron(kron(kron(x1_2r,x2_2r),x3),x4);
        u_ext = kron(u1,u2);
        x_phi = kron(x_ext, u_ext);        
    end
    
    if index_d == 3
        x1_2r = [1, x(1)];
        x2_2r = [1, x(2)];
        x3 = [1,x(3)];
        x4 = [1,x(4)];
        u1 = [1,u(1)];
        u2 = [1,u(2)];
        x_ext = kron(kron(kron(x1_2r,x2_2r),x3),x4);
        u_ext = kron(u1,u2);
        x_phi = kron(x_ext, u_ext);  %[x_ext,u(1),u(2)];%      
    end    
    
    if index_d == 4
        x1_2r = [1, x(1), x(1)^2-1];
        x2_2r = [1, x(2), x(2)^2-1];
        u1 = [1,u(1)];
        u2 = [1,u(2)];
        x_ext = kron(x1_2r,x2_2r);
        u_ext = kron(u1,u2);
        x_phi = kron(x_ext, u_ext); 
    end
    
    if index_d == 5
        
        x_phi = [x(1),x(2),u(1),u(2)]; 
    end
    if index_d == 6
        x1_2h = [1, x(1), 1*x(1)^2-1];
        x2_2h = [1, x(2), 1*x(2)^2-1];
        x3_3h = [1, x(3), 1*x(3)^2-1];
        x4_4h = [1, x(4), 1*x(4)^2-1];
        u1 = [1,u(1)];
        u2 = [1,u(2)];
        x_ext = kron(kron(kron(x1_2h,x2_2h),x3_3h),x4_4h);
        u_ext = kron(u1, u2);
        x_phi = kron(u_ext,x_ext);
    end
    
    if index_d == 7
        x1_2h = [1, x(1), 1*x(1)^2-1];
        x2_2h = [1, x(2), 1*x(2)^2-1];
        u1 = [1,u(1)];
        u2 = [1,u(2)];
        x_ext = kron(x1_2h,x2_2h);
        u_ext = kron(u1, u2);
        x_phi = kron(u_ext,x_ext);
    end

    if index_d == 9
        x1_2r = [1, x(1)];
        x2_2r = [1, x(2)];
        x3 = [1,x(3)];
        x4 = [1,x(4)];
        x_ext = kron(kron(kron(x1_2r,x2_2r),x3),x4);
        x_phi = x_ext;     
    end
end