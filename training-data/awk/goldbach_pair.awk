# Goldbach pair.
function is_prime(n,   d) {
  if (n < 2) return 0
  for (d = 2; d * d <= n; d++) if (n % d == 0) return 0
  return 1
}
BEGIN {
  n = 28
  for (p = 2; p <= n / 2; p++)
    if (is_prime(p) && is_prime(n - p)) { print p " + " (n - p); break }
}
