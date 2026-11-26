# Circular primes below 100; expect 13.
function is_prime(n,  d) { if (n < 2) return 0; for (d = 2; d * d <= n; d++) if (n % d == 0) return 0; return 1 }
function circular(n,  s, i) {
  s = n ""
  for (i = 0; i < length(s); i++) if (!is_prime((substr(s, i + 1) substr(s, 1, i)) + 0)) return 0
  return 1
}
BEGIN { for (n = 2; n < 100; n++) if (circular(n)) c++; print c }
