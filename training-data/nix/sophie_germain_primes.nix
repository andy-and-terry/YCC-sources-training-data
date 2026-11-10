let
  isPrime = n:
    n >= 2 && builtins.all (d: n - (n / d) * d != 0)
      (builtins.filter (d: d * d <= n) (builtins.genList (i: i + 2) (if n > 2 then n - 2 else 0)));
in
builtins.filter (p: isPrime p && isPrime (2 * p + 1)) (builtins.genList (i: i + 2) 90)
# [ 2 3 5 11 23 29 41 53 83 89 ]
