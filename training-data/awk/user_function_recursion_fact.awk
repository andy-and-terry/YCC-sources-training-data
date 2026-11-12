function fact(n) { return n <= 1 ? 1 : n * fact(n - 1) }
BEGIN { for (i = 1; i <= 6; i++) printf "%d! = %d\n", i, fact(i) }
