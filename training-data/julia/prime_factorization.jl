function factorize_trial(n::Int)
    factors = Int[]
    d = 2
    while d * d <= n
        while n % d == 0
            push!(factors, d)
            n ÷= d
        end
        d += d == 2 ? 1 : 2
    end
    n > 1 && push!(factors, n)
    return factors
end

for n in (12, 97, 360, 1001, 600851475143)
    fs = factorize_trial(n)
    println(n, " = ", join(fs, " x "))
    @assert prod(fs) == n
end
