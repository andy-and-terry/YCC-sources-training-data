x = 0:5;
y = [1.1 2.9 5.2 6.8 9.1 11.0];

p = polyfit(x, y, 1);
fprintf('slope = %.3f, intercept = %.3f\n', p(1), p(2));

y_fit = polyval(p, x);
residuals = y - y_fit;
fprintf('sum of squared residuals = %.4f\n', sum(residuals .^ 2));

ss_tot = sum((y - mean(y)) .^ 2);
r_squared = 1 - sum(residuals .^ 2) / ss_tot;
fprintf('R^2 = %.4f\n', r_squared);

% exact quadratic fit
xq = [-1 0 1 2];
yq = 2 * xq .^ 2 - 3 * xq + 1;
pq = polyfit(xq, yq, 2);
disp(round(pq, 6));

% roots, derivative, integral of a polynomial
c = [1 -6 11 -6];
disp(sort(roots(c))');
disp(polyder(c));
disp(polyint(c));
disp(polyval(c, 2));
disp(conv([1 1], [1 -1]));
