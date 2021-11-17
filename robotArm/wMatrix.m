function B = wMatrix(nx,nu,l_d,index_d)
n = nx+nu;
B = zeros(l_d,n);

if index_d == 1
    B(33,1) = 1; 
    B(17,2) = 1; 
    B(9,3) = 1; 
    B(5,4) = 1; 
    B(3,5) =1;
    B(2,6) = 1;
end


if index_d == 2
    B(28,1) = 1;
    B(10,2) = 1;
    B(4,3) =1;
    B(2,4) = 1;
    B(163,5) = 1;
    B(82,6) = 1;
end
