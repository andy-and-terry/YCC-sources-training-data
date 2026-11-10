function sigma(n,   d, s) {
  for (d = 1; d <= n; d++) if (n % d == 0) s += d
  return s
}
BEGIN {
  for (n = 1; n < 100; n++) if (sigma(sigma(n)) == 2 * n) printf "%d ", n
  print "" # 2 4 16 64
}
