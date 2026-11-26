# Emirps below 200; expect 15.
function is_prime(n,  d) { if (n < 2) return 0; for (d = 2; d * d <= n; d++) if (n % d == 0) return 0; return 1 }
function rev(n,  s, r, i) { s = n ""; r = ""; for (i = length(s); i > 0; i--) r = r substr(s, i, 1); return r + 0 }
BEGIN { for (n = 2; n < 200; n++) if (rev(n) != n && is_prime(n) && is_prime(rev(n))) c++; print c }
