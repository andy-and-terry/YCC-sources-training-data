# Pernicious numbers: the popcount is prime.
function is_prime(n)
    n < 2 && return false
    for d in 2:isqrt(n)
        n % d == 0 && return false
    end
    return true
end

println(join(filter(n -> is_prime(count_ones(n)), 1:20), " "))
