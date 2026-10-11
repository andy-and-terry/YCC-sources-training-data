x = [1 2 3 4 5];
y = [2 4 5 4 5];
C = cov(x, y);
R = corrcoef(x, y);
disp(C);
fprintf('r = %.4f\n', R(1, 2));
