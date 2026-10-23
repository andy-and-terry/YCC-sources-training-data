digitsum(n) = sum(digits(n))

function prime_factors(n)
    fs = Int[]
    p = 2
    while n > 1
        if p * p > n
            push!(fs, n)
            break
        end
        while n % p == 0
            push!(fs, p)
            n ÷= p
        end
        p += 1
    end
    return fs
end

function is_smith(n)
    fs = prime_factors(n)
    return length(fs) > 1 && digitsum(n) == sum(digitsum, fs)
end

println(join(filter(is_smith, 2:99), " "))
