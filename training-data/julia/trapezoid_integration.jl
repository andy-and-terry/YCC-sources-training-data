function trapezoid(f, a, b, n)
    h = (b - a) / n
    s = (f(a) + f(b)) / 2
    for i in 1:n-1
        s += f(a + i * h)
    end
    return s * h
end

function simpson(f, a, b, n)
    iseven(n) || error("n must be even")
    h = (b - a) / n
    s = f(a) + f(b)
    for i in 1:n-1
        s += (iseven(i) ? 2 : 4) * f(a + i * h)
    end
    return s * h / 3
end

println(trapezoid(sin, 0, pi, 100))
println(simpson(sin, 0, pi, 100))
println(trapezoid(x -> x^2, 0, 3, 1000))
println(simpson(exp, 0, 1, 10) - (exp(1) - 1))
