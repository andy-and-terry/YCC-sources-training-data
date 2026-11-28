function rho(n::Int)
    n % 2 == 0 && return 2
    f(v) = (v * v + 1) % n
    x = y = 2
    d = 1
    while d == 1
        x = f(x)
        y = f(f(y))
        d = gcd(abs(x - y), n)
    end
    return d
end

n = 8051
p = rho(n)
println("$n = $p * $(n ÷ p)")
