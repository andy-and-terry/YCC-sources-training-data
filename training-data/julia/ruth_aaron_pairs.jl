# Consecutive n, n+1 with equal sums of prime factors (with multiplicity).
function sopfr(n)
    total = 0
    p = 2
    while p * p <= n
        while n % p == 0
            total += p
            n ÷= p
        end
        p += 1
    end
    return total + (n > 1 ? n : 0)
end

println(join(filter(n -> sopfr(n) == sopfr(n + 1), 2:109), " "))
