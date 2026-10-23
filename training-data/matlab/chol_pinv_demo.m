% Cholesky factorization and pseudo-inverse
A = [4 12 -16; 12 37 -43; -16 -43 98];   % symmetric positive definite
R = chol(A);                              % upper triangular, A = R'*R
disp(R);
fprintf('reconstruction error: %g\n', norm(R' * R - A));

% Solve A*x = b using the factors (two triangular solves)
b = [1; 2; 3];
x = R \ (R' \ b);
disp(x');
fprintf('residual: %g\n', norm(A * x - b));

% chol detects matrices that are not positive definite
B = [1 2; 2 1];
[~, p] = chol(B);
if p > 0
    fprintf('B is not positive definite (failed at order %d)\n', p);
end

% Pseudo-inverse gives least-squares solutions for non-square systems
M = [1 1; 1 2; 1 3];
y = [1; 2; 2];
coef = pinv(M) * y;
disp(coef');
disp((M \ y)');

% For rank-deficient matrices pinv still works
D = [1 2; 2 4];
disp(rank(D));
disp(pinv(D));
