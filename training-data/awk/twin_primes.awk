# Twin primes below 50 via sieve.
BEGIN {
  for (i = 2; i <= 52; i++) s[i] = 1
  for (i = 2; i * i <= 52; i++) if (s[i]) for (j = i * i; j <= 52; j += i) s[j] = 0
  for (p = 2; p <= 50; p++) if (s[p] && s[p + 2]) printf "(%d,%d) ", p, p + 2
  print ""
}
