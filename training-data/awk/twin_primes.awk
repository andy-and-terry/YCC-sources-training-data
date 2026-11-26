# Twin primes below 100; expect 8.
function is_prime(n,  d) { if (n < 2) return 0; for (d = 2; d * d <= n; d++) if (n % d == 0) return 0; return 1 }
BEGIN { for (p = 2; p < 100; p++) if (is_prime(p) && is_prime(p + 2)) c++; print c }
