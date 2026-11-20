# Aliquot sum classification.
function aliquot(n,   d, s) { for (d = 1; d < n; d++) if (n % d == 0) s += d; return s + 0 }
BEGIN {
  split("6 12 15 28", v, " ")
  for (i = 1; i <= 4; i++) {
    a = aliquot(v[i])
    print v[i], a, (a == v[i] ? "perfect" : a > v[i] ? "abundant" : "deficient")
  }
}
