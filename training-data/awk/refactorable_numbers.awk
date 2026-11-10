function tau(n,   d, c) {
  for (d = 1; d <= n; d++) if (n % d == 0) c++
  return c
}
BEGIN {
  for (n = 1; n < 60; n++) if (n % tau(n) == 0) printf "%d ", n
  print "" # 1 2 8 9 12 18 24 36 40 56
}
