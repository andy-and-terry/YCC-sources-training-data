function root = bisection_method(f, a, b, tol)
    while (b - a) / 2 > tol
        mid = (a + b) / 2;
        if sign(f(mid)) == sign(f(a))
            a = mid;
        else
            b = mid;
        end
    end
    root = (a + b) / 2;
end

f = @(x) x^2 - 2;
disp(bisection_method(f, 0, 2, 1e-6))
