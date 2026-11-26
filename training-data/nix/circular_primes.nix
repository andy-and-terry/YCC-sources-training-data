# Circular primes below 100 (one- and two-digit rotations); expect 13.
# Evaluate with: nix-instantiate --eval <file>
let
  mod = a: b: a - (a / b) * b;
  range = lo: hi: if lo > hi then [] else builtins.genList (i: lo + i) (hi - lo + 1);
  isPrime = n:
    n > 1 && builtins.all (d: mod n d != 0) (builtins.filter (d: d * d <= n) (range 2 (n / 2 + 1)));
  count = pred: xs: builtins.length (builtins.filter pred xs);
  circular = n:
    if n < 10 then isPrime n
    else isPrime n && isPrime ((mod n 10) * 10 + n / 10);
in
count circular (range 2 99)
