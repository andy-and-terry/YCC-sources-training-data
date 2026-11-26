# Palindromic primes below 200; expect 10.
function is_prime(n,  d) { if (n < 2) return 0; for (d = 2; d * d <= n; d++) if (n % d == 0) return 0; return 1 }
function rev(s,  r, i) { r = ""; for (i = length(s); i > 0; i--) r = r substr(s, i, 1); return r }
BEGIN {
  for (n = 2; n < 200; n++)
    if (n "" == rev(n "") && is_prime(n)) { printf "%d ", n; c++ }
  print ""
  print c
}
