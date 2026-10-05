% Composite trapezoidal rule for numerical integration
f = @(x) sin(x);
a = 0; b = pi; n = 100;
fprintf('Integral of sin on [0, pi] ~ %.6f\n', trapezoid(f, a, b, n));

function area = trapezoid(f, a, b, n)
    x = linspace(a, b, n + 1);
    y = f(x);
    h = (b - a) / n;
    area = h * (sum(y) - 0.5 * (y(1) + y(end)));
end
