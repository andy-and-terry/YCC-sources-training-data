function newton_sqrt(x; tol = 1e-12, maxiter = 50)
    x < 0 && throw(DomainError(x, "sqrt of negative"))
    x == 0 && return 0.0
    guess = x > 1 ? x / 2 : 1.0
    for i in 1:maxiter
        next = (guess + x / guess) / 2
        abs(next - guess) < tol && return next
        guess = next
    end
    return guess
end

for v in (2, 9, 0.25, 1e6)
    println(v, " => ", newton_sqrt(v), " (", sqrt(v), ")")
end

try
    newton_sqrt(-1)
catch e
    println(e)
end
