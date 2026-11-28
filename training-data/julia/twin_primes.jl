function sieve(n)
    is = trues(n)
    is[1] = false
    for i in 2:isqrt(n)
        is[i] && (is[i*i:i:n] .= false)
    end
    return findall(is)
end

ps = sieve(50)
println([(p, q) for (p, q) in zip(ps, ps[2:end]) if q - p == 2])
