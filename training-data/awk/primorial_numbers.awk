# Primorials up to 1e6, including 1; expect 8.
function is_prime(n,  d) { if (n < 2) return 0; for (d = 2; d * d <= n; d++) if (n % d == 0) return 0; return 1 }
BEGIN {
  acc = 1; count = 1; out = "1"
  for (p = 2; ; p++) {
    if (!is_prime(p)) continue
    acc *= p
    if (acc > 1000000) break
    out = out " " acc; count++
  }
  print out; print count
}
