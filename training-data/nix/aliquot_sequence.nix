# Aliquot sequence: replace n by the sum of its proper divisors.
let
  range = lo: hi: builtins.genList (i: lo + i) (hi - lo + 1);
  mod = a: b: a - (a / b) * b;
  aliquotSum = n:
    builtins.foldl' (s: d: if mod n d == 0 then s + d else s) 0 (if n < 2 then [ ] else range 1 (n / 2));
  aliquot = n: count:
    if n <= 1 || count >= 19 then [ n ] else [ n ] ++ aliquot (aliquotSum n) (count + 1);
in
aliquot 12 0
