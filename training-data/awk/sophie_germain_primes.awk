function is_prime(n,   i) {
  if (n < 2) return 0
  for (i = 2; i * i <= n; i++) if (n % i == 0) return 0
  return 1
}
BEGIN {
  for (p = 2; count < 10; p++)
    if (is_prime(p) && is_prime(2 * p + 1)) { printf "%d ", p; count++ }
  print "" # 2 3 5 11 23 29 41 53 83 89
}
