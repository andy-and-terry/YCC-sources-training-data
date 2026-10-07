x = linspace(0, pi, 101);
y = sin(x);

area = trapz(x, y);
fprintf('trapz sin: %.5f\n', area);

disp(cumtrapz([0 1 2], [0 1 4]))

f = @(t) t.^2;
disp(integral(f, 0, 3))
disp(quad_simpson(f, 0, 3, 100))

g = @(t) exp(-t.^2);
fprintf('%.6f\n', integral(g, -Inf, Inf));
fprintf('%.6f\n', sqrt(pi));

h = @(a, b) a + b;
disp(integral2(h, 0, 1, 0, 2))

function s = quad_simpson(f, a, b, n)
    h = (b - a) / n;
    xs = a:h:b;
    ys = f(xs);
    s = h / 3 * (ys(1) + 4 * sum(ys(2:2:end-1)) + 2 * sum(ys(3:2:end-2)) + ys(end));
end
