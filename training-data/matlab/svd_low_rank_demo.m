A = [3 2 2; 2 3 -2];
[U, S, V] = svd(A);
disp(diag(S)');
k = 1;
Ak = U(:, 1:k) * S(1:k, 1:k) * V(:, 1:k)';
fprintf('rank-%d error %.4f\n', k, norm(A - Ak));
