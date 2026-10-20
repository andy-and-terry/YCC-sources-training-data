f = @(x) x .^ 2 - 2;
a = 1; b = 2;
for i = 1:30
    c = (a + b) / 2;
    if f(a) * f(c) <= 0, b = c; else, a = c; end
end
fprintf('%.6f\n', c);
x = 1;
for i = 1:8, x = x - f(x) / (2 * x); end
fprintf('%.6f\n', x);
g = @(x) sin(x);
xs = linspace(0, pi, 1001);
fprintf('%.4f\n', trapz(xs, g(xs)));
fprintf('%.4f\n', integral(g, 0, pi));
p = polyfit(1:5, [2.1 3.9 6.2 7.8 10.1], 1);
fprintf('%.2f %.2f\n', p);
disp(polyval([1 0 -1], 3)); disp(roots([1 -3 2])');
[t, y] = ode45(@(t, y) -y, [0 1], 1);
fprintf('%.3f\n', y(end));
disp(interp1([1 2 3], [10 20 30], 2.5));
disp(fzero(@(x) cos(x) - x, 0.5));
disp(round(cumtrapz(1:4)))
r = 1; h = 1e-5; df = (g(r + h) - g(r - h)) / (2 * h); fprintf('%.4f\n', df);
