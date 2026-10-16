function power(base::Integer, exp::Integer)
    exp < 0 && throw(DomainError(exp, "negative exponent"))
    result = one(base)
    b = base
    e = exp
    while e > 0
        if isodd(e)
            result *= b
        end
        b *= b
        e >>= 1
    end
    return result
end

println(power(2, 10))
println(power(3, 13))
println(power(big(7), 50))
println(power(5, 0))
println(power(2, 10) == 2^10)
