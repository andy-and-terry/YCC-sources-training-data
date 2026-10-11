A = [4 7; 2 6];
d = det(A);
fprintf('det = %g\n', d);
Ainv = inv(A);
disp(Ainv);
disp(A * Ainv);
fprintf('rank = %d\n', rank(A));
B = [1 2; 2 4];
fprintf('rank singular = %d\n', rank(B));
