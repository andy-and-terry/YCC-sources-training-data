# Munchausen numbers: sum of digit^digit equals n (0^0 counted as 0).
let
  range = lo: hi: builtins.genList (i: lo + i) (hi - lo + 1);
  mod = a: b: a - (a / b) * b;
  sum = builtins.foldl' (a: b: a + b) 0;
  pow = b: e: if e == 0 then 1 else b * pow b (e - 1);
  digits = n: if n < 10 then [ n ] else digits (n / 10) ++ [ (mod n 10) ];
  gcd = a: b: if b == 0 then a else gcd b (mod a b);
  isMunchausen = n: sum (map (d: if d == 0 then 0 else pow d d) (digits n)) == n;
in
builtins.filter isMunchausen (range 1 4999)
