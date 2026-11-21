# Carmichael numbers via Korselt's criterion: n is squarefree, composite,
# and p - 1 divides n - 1 for every prime factor p.
let
  range = lo: hi: builtins.genList (i: lo + i) (hi - lo + 1);
  mod = a: b: a - (a / b) * b;
  sum = builtins.foldl' (a: b: a + b) 0;
  pow = b: e: if e == 0 then 1 else b * pow b (e - 1);
  digits = n: if n < 10 then [ n ] else digits (n / 10) ++ [ (mod n 10) ];
  gcd = a: b: if b == 0 then a else gcd b (mod a b);
  # Prime factors with multiplicity.
  factor = n:
    let
      go = m: p:
        if m == 1 then [ ]
        else if p * p > m then [ m ]
        else if mod m p == 0 then [ p ] ++ go (m / p) p
        else go m (p + 1);
    in
    go n 2;
  isCarmichael = n:
    let
      fs = factor n;
      uniq = builtins.length (builtins.attrNames (builtins.listToAttrs (map (p: { name = toString p; value = true; }) fs)));
    in
    builtins.length fs >= 2 && uniq == builtins.length fs
    && builtins.all (p: mod (n - 1) (p - 1) == 0) fs;
in
builtins.filter isCarmichael (builtins.filter (n: mod n 2 == 1) (range 3 2999))
