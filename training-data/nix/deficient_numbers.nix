# Deficient numbers up to 20 (sigma(n) < 2n)
let
  range = lo: hi: builtins.genList (i: lo + i) (hi - lo + 1);
  mod = a: b: a - (a / b) * b;
  sigma = n: builtins.foldl' (s: d: s + d) 0 (builtins.filter (d: mod n d == 0) (range 1 n));
in
builtins.filter (n: sigma n < 2 * n) (range 1 20)
