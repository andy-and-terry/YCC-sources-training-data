# Fermat primality test; Carmichael number 561 fools it.
function powmod(b, e, m,    r) {
    r = 1
    b = b % m
    while (e > 0) {
        if (e % 2 == 1) r = (r * b) % m
        b = (b * b) % m
        e = int(e / 2)
    }
    return r
}

function probably_prime(n) { return n > 2 && powmod(2, n - 1, n) == 1 }

BEGIN {
    split("97 91 561", tests, " ")
    for (i = 1; i <= 3; i++)
        print tests[i], (probably_prime(tests[i]) ? "true" : "false")
}
