# Goldbach partitions of 100; expect 6.
function is_prime(n,  d) { if (n < 2) return 0; for (d = 2; d * d <= n; d++) if (n % d == 0) return 0; return 1 }
BEGIN {
  for (p = 2; p <= 50; p++) if (is_prime(p) && is_prime(100 - p)) { print p "+" (100 - p); c++ }
  print c
}
