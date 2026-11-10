let
  isPrime = n:
    n >= 2 && builtins.all (d: n - (n / d) * d != 0)
      (builtins.filter (d: d * d <= n) (builtins.genList (i: i + 2) (if n > 2 then n - 2 else 0)));
in
builtins.map (p: [ p (p + 2) ])
  (builtins.filter (p: isPrime p && isPrime (p + 2)) (builtins.genList (i: i + 3) 76))
# [ [ 3 5 ] [ 5 7 ] [ 11 13 ] [ 17 19 ] [ 29 31 ] [ 41 43 ] [ 59 61 ] [ 71 73 ] ]
