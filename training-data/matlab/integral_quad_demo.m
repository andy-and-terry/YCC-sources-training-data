f = @(x) exp(-x.^2);
I = integral(f, -Inf, Inf);
fprintf('integral %.6f, sqrt(pi) %.6f\n', I, sqrt(pi));
J = integral(@(x) x.^2, 0, 3);
fprintf('x^2 over [0,3] = %.4f\n', J);
