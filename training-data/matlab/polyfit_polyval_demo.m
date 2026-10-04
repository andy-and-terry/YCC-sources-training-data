x = 0:5;
y = [1.1 2.9 5.2 7.1 8.8 11.2];

p = polyfit(x, y, 1);
fprintf('slope = %.3f, intercept = %.3f\n', p(1), p(2));

yfit = polyval(p, x);
residuals = y - yfit;
fprintf('rms error = %.4f\n', sqrt(mean(residuals .^ 2)));

p2 = polyfit(x, y, 2);
disp(p2);

% Polynomial arithmetic: coefficients in descending order
a = [1 -3 2];      % x^2 - 3x + 2
b = [1 1];         % x + 1
disp(conv(a, b));
[q, r] = deconv(conv(a, b), b);
disp(q);
disp(r);

disp(roots(a)');
disp(poly([1 2]));
disp(polyval(a, 3));
disp(polyder(a));
disp(polyint(a));

r2 = 1 - sum((y - polyval(p, x)) .^ 2) / sum((y - mean(y)) .^ 2);
fprintf('R^2 = %.4f\n', r2);

xi = 2.5;
fprintf('interp1: %.3f, polyval: %.3f\n', interp1(x, y, xi), polyval(p, xi));
