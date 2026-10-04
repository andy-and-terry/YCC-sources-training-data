f = @(x) sin(x);

x = linspace(0, pi, 101);
y = f(x);
fprintf('trapz:    %.6f\n', trapz(x, y));
fprintf('integral: %.6f\n', integral(f, 0, pi));
fprintf('exact:    %.6f\n', 2);

% Composite trapezoid rule by hand
n = 100;
h = pi / n;
xs = 0:h:pi;
approx = h * (sum(f(xs)) - 0.5 * (f(xs(1)) + f(xs(end))));
fprintf('manual:   %.6f\n', approx);

% Simpson's rule
m = 100;
hs = pi / m;
xk = 0:hs:pi;
simpson = hs / 3 * (f(xk(1)) + 4 * sum(f(xk(2:2:end-1))) + 2 * sum(f(xk(3:2:end-2))) + f(xk(end)));
fprintf('simpson:  %.8f\n', simpson);

% Cumulative integral and error as step count grows
cum = cumtrapz(x, y);
fprintf('cumtrapz end: %.6f\n', cum(end));

for steps = [4 16 64]
    xx = linspace(0, pi, steps + 1);
    err = abs(trapz(xx, f(xx)) - 2);
    fprintf('steps=%3d error=%.2e\n', steps, err);
end

g = @(x) exp(-x .^ 2);
disp(integral(g, -Inf, Inf) - sqrt(pi) < 1e-8);
