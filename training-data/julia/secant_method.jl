function secant(f, x0, x1; tol = 1e-12, limit = 50)
    for _ in 1:limit
        f0, f1 = f(x0), f(x1)
        f1 == f0 && break
        x0, x1 = x1, x1 - f1 * (x1 - x0) / (f1 - f0)
        abs(x1 - x0) < tol && break
    end
    return x1
end

println(secant(x -> x^2 - 2, 1.0, 2.0))
