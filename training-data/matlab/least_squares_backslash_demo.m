x = (0:5)';
y = [1.1 2.9 5.2 7.1 8.8 11.2]';
X = [ones(size(x)) x];
beta = X \ y;
fprintf('intercept %.3f slope %.3f\n', beta(1), beta(2));
res = y - X * beta;
fprintf('residual norm %.3f\n', norm(res));
