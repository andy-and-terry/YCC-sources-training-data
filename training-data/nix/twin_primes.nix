# Twin prime pairs below 50
let
  range = lo: hi: builtins.genList (i: lo + i) (hi - lo + 1);
  mod = a: b: a - (a / b) * b;
  isPrime = n: n > 1 && builtins.all (d: mod n d != 0) (builtins.filter (d: d * d <= n) (range 2 (n - 1 + 1)));
in
map (p: [ p (p + 2) ]) (builtins.filter (p: isPrime p && isPrime (p + 2)) (range 3 48))
