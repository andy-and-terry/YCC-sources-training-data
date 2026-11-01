# Positive n expressible as a*a + b*b with a, b >= 0.
let
  range = a: b: if a > b then [ ] else [ a ] ++ range (a + 1) b;
  representable = n:
    builtins.any (a: builtins.any (b: a * a + b * b == n) (range a 6)) (range 0 6);
in
builtins.concatStringsSep " " (map toString (builtins.filter representable (range 1 30)))
