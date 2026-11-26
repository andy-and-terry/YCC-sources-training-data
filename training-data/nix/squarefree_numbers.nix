# Squarefree numbers up to 100; expect 61.
# Evaluate with: nix-instantiate --eval <file>
let
  mod = a: b: a - (a / b) * b;
  range = lo: hi: if lo > hi then [] else builtins.genList (i: lo + i) (hi - lo + 1);
  isPrime = n:
    n > 1 && builtins.all (d: mod n d != 0) (builtins.filter (d: d * d <= n) (range 2 (n / 2 + 1)));
  count = pred: xs: builtins.length (builtins.filter pred xs);
  squarefree = n: builtins.all (d: mod n (d * d) != 0) (builtins.filter (d: d * d <= n) (range 2 10));
in
count squarefree (range 1 100)
