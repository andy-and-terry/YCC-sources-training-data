# Pernicious numbers: the popcount is prime.
let
  range = a: b: if a > b then [ ] else [ a ] ++ range (a + 1) b;
  isPrime = n:
    n >= 2 && builtins.all (d: lib_mod n d != 0) (builtins.filter (d: d * d <= n) (range 2 n));
  lib_mod = a: b: a - (a / b) * b;
  popcount = n: if n == 0 then 0 else lib_mod n 2 + popcount (n / 2);
in
builtins.concatStringsSep " " (map toString (
  builtins.filter (n: isPrime (popcount n)) (range 1 20)
))
