# Euler zigzag numbers via the Seidel-Entringer boustrophedon.
let
  # running sums of the reversed row, starting from 0
  step = row:
    builtins.foldl' (acc: x: acc ++ [ (builtins.elemAt acc (builtins.length acc - 1) + x) ]) [ 0 ]
      (lib_reverse row);
  lib_reverse = l: builtins.genList (i: builtins.elemAt l (builtins.length l - 1 - i)) (builtins.length l);
  go = k: row:
    if k == 0 then [ ]
    else [ (builtins.elemAt row (builtins.length row - 1)) ] ++ go (k - 1) (step row);
in
builtins.concatStringsSep " " (map toString (go 10 [ 1 ]))
