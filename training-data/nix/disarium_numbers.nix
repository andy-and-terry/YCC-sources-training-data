# Disarium numbers: digits raised to their 1-based positions sum to n.
let
  range = lo: hi: builtins.genList (i: lo + i) (hi - lo + 1);
  mod = a: b: a - (a / b) * b;
  sum = builtins.foldl' (a: b: a + b) 0;
  pow = b: e: if e == 0 then 1 else b * pow b (e - 1);
  digits = n: if n < 10 then [ n ] else digits (n / 10) ++ [ (mod n 10) ];
  gcd = a: b: if b == 0 then a else gcd b (mod a b);
  isDisarium = n:
    let ds = digits n; in
    sum (builtins.genList (i: pow (builtins.elemAt ds i) (i + 1)) (builtins.length ds)) == n;
in
builtins.filter isDisarium (range 1 999)
