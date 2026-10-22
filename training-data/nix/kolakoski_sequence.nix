# Kolakoski over {1, 2}: the run lengths of the sequence describe itself
let
  count = 20;

  go = acc: idx:
    if builtins.length acc >= count then builtins.genList (i: builtins.elemAt acc i) count
    else
      let
        sym = 3 - builtins.elemAt acc (builtins.length acc - 1);
        run = builtins.genList (_: sym) (builtins.elemAt acc idx);
      in
        go (acc ++ run) (idx + 1);
in
  builtins.concatStringsSep " " (map toString (go [ 1 2 2 ] 2))
