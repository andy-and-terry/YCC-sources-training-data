# Count bouncy numbers (neither increasing nor decreasing digits) below 1000.
let
  range = lo: hi: builtins.genList (i: lo + i) (hi - lo + 1);
  mod = a: b: a - (a / b) * b;
  sum = builtins.foldl' (a: b: a + b) 0;
  pow = b: e: if e == 0 then 1 else b * pow b (e - 1);
  digits = n: if n < 10 then [ n ] else digits (n / 10) ++ [ (mod n 10) ];
  gcd = a: b: if b == 0 then a else gcd b (mod a b);
  sorted = builtins.sort (a: b: a < b);
  isBouncy = n:
    let d = digits n; in
    d != sorted d && d != (builtins.sort (a: b: a > b) d);
in
builtins.length (builtins.filter isBouncy (range 1 999))
