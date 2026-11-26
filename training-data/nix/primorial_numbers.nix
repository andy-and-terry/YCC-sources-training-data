# Primorials up to 1e6, including 1; expect 8 (count of values).
# Evaluate with: nix-instantiate --eval <file>
let
  mod = a: b: a - (a / b) * b;
  range = lo: hi: if lo > hi then [] else builtins.genList (i: lo + i) (hi - lo + 1);
  isPrime = n:
    n > 1 && builtins.all (d: mod n d != 0) (builtins.filter (d: d * d <= n) (range 2 (n / 2 + 1)));
  count = pred: xs: builtins.length (builtins.filter pred xs);
  primes = builtins.filter isPrime (range 2 30);
  go = acc: ps:
    if ps == [] || acc * builtins.head ps > 1000000 then [ acc ]
    else [ acc ] ++ go (acc * builtins.head ps) (builtins.tail ps);
  values = go 1 primes;
in
builtins.length values
