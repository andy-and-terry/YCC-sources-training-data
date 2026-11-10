function is_prime(n,   i) {
  if (n < 2) return 0
  for (i = 2; i * i <= n; i++) if (n % i == 0) return 0
  return 1
}
function rev(n,   s, r, i) {
  s = n ""; r = ""
  for (i = length(s); i >= 1; i--) r = r substr(s, i, 1)
  return r + 0
}
BEGIN {
  for (n = 2; count < 10; n++) {
    r = rev(n)
    if (r != n && is_prime(n) && is_prime(r)) { printf "%d ", n; count++ }
  }
  print "" # 13 17 31 37 71 73 79 97 107 113
}
