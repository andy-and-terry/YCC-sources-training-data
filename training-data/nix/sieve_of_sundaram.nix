let
  limit = 50;
  n = limit / 2;

  isSundaramMarked = k:
    builtins.any
      (i: builtins.any (j: i + j + 2 * i * j == k) (builtins.genList (jj: jj + 1) n))
      (builtins.genList (ii: ii + 1) n);

  unmarked = builtins.filter (k: !(isSundaramMarked k)) (builtins.genList (k: k + 1) n);
  oddPrimes = map (k: 2 * k + 1) unmarked;
  primes = [ 2 ] ++ oddPrimes;
in
  primes
