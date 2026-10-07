A = [2 1; 1 3];
b = [3; 5];

x = A \ b;
disp(x)

residual = norm(A * x - b);
disp(residual)

disp(rank(A))
