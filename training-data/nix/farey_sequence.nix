# Farey sequence F_n: reduced fractions in [0,1] with denominator <= n
let
  n = 5;

  go = a: b: c: d:
    let
      k = (n + b) / d;
      rest = if c > n then [ ] else go c d (k * c - a) (k * d - b);
    in
      [ "${toString a}/${toString b}" ] ++ rest;
in
  builtins.concatStringsSep " " (go 0 1 1 n)
