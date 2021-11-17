function B = wMatrix(nx,nu,l_d,index_d)
% n = nx+nu+1;
n = nx+nu;
B = zeros(l_d,n);
if index_d == 1   
    B(13,1) = 1;
    B(5,2) = 1;
    B(2,3) = 1;
    B(3,4) = 1;
    B(73,5) = 1;
    B(37,6) = 1;
end
if index_d == 2   
    B(9,1) = 1;
    B(5,2) = 1;
    B(2,3) = 1;
    B(3,4) = 1;
    B(33,5) = 1;
    B(17,6) = 1;
end
if index_d == 3   
    B(5,2) = 1;
    B(2,3) = 1;
    B(3,4) = 1;
    B(25,5) = 1;
    B(13,6) = 1;
end
if index_d == 4
    B = eye(5);
end

if index_d == 5   
    B(10,1) = 1;
    B(4,2) = 1;
    B(2,3) = 1;
    B(55,4) = 1;
    B(28,5) = 1;
end

if index_d == 6 % DL   
    B(2,1) = 1;
    B(3,2) = 1;
    B(4,3) = 1;
end

if index_d == 7 % without u   
    B(9,1) = 1;
    B(5,2) = 1;
    B(2,3) = 1;
    B(3,4) = 1;
end