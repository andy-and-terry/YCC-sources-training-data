function sieve(limit::Int)
    is_composite = falses(limit + 1)
    for i in 2:isqrt(limit)
        if !is_composite[i]
            for j in i*i:i:limit
                is_composite[j] = true
            end
        end
    end
    return [n for n in 2:limit if !is_composite[n]]
end

println(sieve(50))
