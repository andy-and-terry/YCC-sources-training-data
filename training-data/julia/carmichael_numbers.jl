# Carmichael numbers: composite n where a^(n-1) = 1 (mod n) for all a coprime to n.
is_prime(n) = n > 1 && all(n % p != 0 for p in 2:isqrt(n))

function is_carmichael(n)
    is_prime(n) && return false
    return all(a -> gcd(a, n) != 1 || powermod(a, n - 1, n) == 1, 2:n-1)
end

println(join(filter(is_carmichael, 3:2:2999), " "))
