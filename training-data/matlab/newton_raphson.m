function root = newton_raphson(f, df, x0, tol, max_iter)
    x = x0;
    for i = 1:max_iter
        fx = f(x);
        if abs(fx) < tol
            break
        end
        x = x - fx / df(x);
    end
    root = x;
end

f = @(x) x^3 - x - 2;
df = @(x) 3 * x^2 - 1;
disp(newton_raphson(f, df, 1.5, 1e-8, 50))
