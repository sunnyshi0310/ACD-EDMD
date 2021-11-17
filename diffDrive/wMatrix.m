function B = wMatrix(nx,nu,l_d,index_d)
% n = nx+nu+1;
n = nx+nu;
B = zeros(l_d,n);

if index_d == 1   
    B(9,1) = 1;
    B(5,2) = 1;
    B(2,3) = 1;
    B(3,4) = 1;
    B(33,5) = 1;
    B(17,6) = 1;
end

if index_d == 2   
    B(10,1) = 1;
    B(4,2) = 1;
    B(2,3) = 1;
    B(55,4) = 1;
    B(28,5) = 1;
end

