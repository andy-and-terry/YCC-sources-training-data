# Amicable pairs: d(a) == b and d(b) == a with a != b.
let
  lib = (import <nixpkgs> { }).lib;
  d = n: builtins.foldl' (s: i: if lib.mod n i == 0 then s + i else s) 0 (lib.range 1 (n - 1));
in
builtins.filter (p: p != null) (map
  (a:
    let b = d a;
    in if b > a && d b == a then [ a b ] else null)
  (lib.range 2 1499))
