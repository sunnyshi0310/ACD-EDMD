function B = wMatrix(nx,nu,l_d,index_d)
n = nx+nu;
B = zeros(l_d,n);

if index_d == 1
    B(29,1) = 1;
    B(5,2) = 1;
    B(3,3) = 1;
    B(2,4) = 1;
end
if index_d == 2
    B(113,1) = 1;
    B(17,2) = 1;
    B(9,3) = 1;
    B(5,4) = 1;
    B(3,5) =1;
    B(2,6) = 1;
end
if index_d == 3
    B(33,1) = 1; % 33
    B(17,2) = 1; % 17
    B(9,3) = 1; % 9
    B(5,4) = 1; % 5
    B(3,5) =1;
    B(2,6) = 1;
end
if index_d == 4
    B(29,1) = 1;
    B(5,2) = 1;
    B(3,5) =1;
    B(2,6) = 1;
end
if index_d == 5
    B = eye(4);
end

if index_d == 6
    B(28,1) = 1;
    B(10,2) = 1;
    B(4,3) =1;
    B(2,4) = 1;
    B(163,5) = 1;
    B(82,6) = 1;
end

if index_d == 7
    B(4,1) = 1;
    B(2,2) = 1;
    B(19,3) =1;
    B(10,4) = 1;
end

if index_d == 8% learn
    B(2,1) = 1;
    B(3,2) = 1;
end

if index_d == 9 % without u   
    B(9,1) = 1;
    B(5,2) = 1;
    B(3,3) = 1;
    B(2,4) = 1;
end