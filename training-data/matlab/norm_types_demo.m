v = [3 4];
fprintf('2-norm %.2f\n', norm(v));
fprintf('1-norm %.2f\n', norm(v, 1));
fprintf('inf-norm %.2f\n', norm(v, Inf));
A = [1 2; 3 4];
fprintf('frobenius %.4f\n', norm(A, 'fro'));
fprintf('spectral %.4f\n', norm(A));
fprintf('cond %.4f\n', cond(A));
