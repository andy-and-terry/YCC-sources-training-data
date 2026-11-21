# Perfect totient numbers: sum of the iterated totient chain down to 1 equals n.
let
  range = lo: hi: builtins.genList (i: lo + i) (hi - lo + 1);
  mod = a: b: a - (a / b) * b;
  sum = builtins.foldl' (a: b: a + b) 0;
  pow = b: e: if e == 0 then 1 else b * pow b (e - 1);
  digits = n: if n < 10 then [ n ] else digits (n / 10) ++ [ (mod n 10) ];
  gcd = a: b: if b == 0 then a else gcd b (mod a b);
  phi = n: builtins.length (builtins.filter (k: gcd k n == 1) (range 1 n));
  chainSum = m: if m <= 1 then 0 else phi m + chainSum (phi m);
in
builtins.filter (n: chainSum n == n) (range 2 199)
