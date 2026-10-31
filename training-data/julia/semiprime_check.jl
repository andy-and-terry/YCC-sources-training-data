function prime_factor_count(n)
    count, p = 0, 2
    while p * p <= n
        while n % p == 0
            n ÷= p
            count += 1
        end
        p += 1
    end
    n > 1 ? count + 1 : count
end

println(filter(n -> prime_factor_count(n) == 2, 2:29))
