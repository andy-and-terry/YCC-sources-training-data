# Goldbach decompositions of 28
let
  range = lo: hi: builtins.genList (i: lo + i) (hi - lo + 1);
  mod = a: b: a - (a / b) * b;
  isPrime = n: n > 1 && builtins.all (d: mod n d != 0) (builtins.filter (d: d * d <= n) (range 2 n));
  n = 28;
in
map (p: [ p (n - p) ]) (builtins.filter (p: isPrime p && isPrime (n - p)) (range 2 (n / 2)))
