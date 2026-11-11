# Fermat primality test; Carmichael number 561 fools it.
probably_prime(n) = n > 2 && powermod(2, n - 1, n) == 1

for n in (97, 91, 561)
    println(n, " ", probably_prime(n))
end
