# Deficient numbers below 100; expect 76.
function proper_sum(n,  d, t) { for (d = 1; d < n; d++) if (n % d == 0) t += d; return t + 0 }
BEGIN { for (n = 1; n < 100; n++) if (proper_sum(n) < n) c++; print c }
