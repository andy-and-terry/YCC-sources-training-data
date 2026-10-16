A = reshape(1:16, 4, 4)';
disp(triu(A));
disp(tril(A, -1));
disp(diag(A)');
disp(diag([1 2 3]));
disp(trace(A));
