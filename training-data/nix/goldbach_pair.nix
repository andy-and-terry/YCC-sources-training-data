# Goldbach pair.
let
  range = a: b: if a > b then [ ] else builtins.genList (i: a + i) (b - a + 1);
  rem = a: b: a - (a / b) * b;
  isPrime = n: n > 1 && builtins.all (d: rem n d != 0) (range 2 (n / 2));
  n = 28;
  candidates = builtins.filter (p: isPrime p && isPrime (n - p)) (range 2 (n / 2));
  p = builtins.head candidates;
in
[ p (n - p) ]
