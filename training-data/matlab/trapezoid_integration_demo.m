f = @(x) x .^ 2;
a = 0;
b = 3;

for n = [3 6 12 24]
    x = linspace(a, b, n + 1);
    manual = (b - a) / n * (sum(f(x)) - 0.5 * (f(a) + f(b)));
    built_in = trapz(x, f(x));
    fprintf('n=%2d manual=%.6f trapz=%.6f error=%.2e\n', n, manual, built_in, abs(manual - 9));
end

% composite Simpson's rule converges faster
n = 6;
x = linspace(a, b, n + 1);
h = (b - a) / n;
simpson = h / 3 * (f(x(1)) + 4 * sum(f(x(2:2:end-1))) + 2 * sum(f(x(3:2:end-2))) + f(x(end)));
fprintf('simpson = %.6f\n', simpson);

% adaptive quadrature from the standard library
fprintf('integral = %.6f\n', integral(f, a, b));
fprintf('sin on [0, pi] = %.6f\n', integral(@sin, 0, pi));

% cumulative integral
xs = 0:0.5:2;
disp(cumtrapz(xs, 2 * xs));
