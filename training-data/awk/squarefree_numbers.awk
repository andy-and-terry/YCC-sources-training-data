# Squarefree numbers up to 100; expect 61.
function squarefree(n,  d) { for (d = 2; d * d <= n; d++) if (n % (d * d) == 0) return 0; return 1 }
BEGIN { for (n = 1; n <= 100; n++) c += squarefree(n); print c }
