# Repunits: R_k = (10^k - 1) / 9, built as r = 10r + 1.
let
  go = k: r: if k == 0 then [ ] else [ r ] ++ go (k - 1) (r * 10 + 1);
in
builtins.concatStringsSep " " (map toString (go 8 1))
