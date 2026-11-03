function count_primes_below(n::Int)
    n < 3 && return 0
    composite = falses(n)
    for i in 2:n-1
        composite[i] && continue
        for j in i*i:i:n-1
            composite[j] = true
        end
    end
    count(i -> !composite[i], 2:n-1)
end

println(count_primes_below(100))
