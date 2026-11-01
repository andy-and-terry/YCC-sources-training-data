A = [2 1; 1 3];
b = [3; 5];
x = A \ b;
disp(x')
disp(det(A))
disp(inv(A))
disp(A * x - b)
