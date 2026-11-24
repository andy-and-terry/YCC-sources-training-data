# Moebius function: 0 if n has a squared prime factor, else (-1)^k.
let
  range = lo: hi: builtins.genList (i: lo + i) (hi - lo + 1);
  mod = a: b: a - (a / b) * b;
  # go m p acc: trial division with bounded recursion over p.
  go = m: p: acc:
    if p * p > m then (if m > 1 then -acc else acc)
    else if mod m p == 0 then
      (let m2 = m / p; in if mod m2 p == 0 then 0 else go m2 (p + 1) (-acc))
    else go m (p + 1) acc;
  mobius = n: go n 2 1;
in
map mobius (range 1 30)
