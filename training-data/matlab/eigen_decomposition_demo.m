A = [2 0; 0 3];

[V, D] = eig(A);
disp(D)
disp(V)

lambda1 = D(1, 1);
v1 = V(:, 1);
disp(A * v1 - lambda1 * v1)
