# Repeatedly replace n by the sum of its proper divisors until 0
let
  aliquot = n:
    builtins.foldl' (acc: d: if n - d * (n / d) == 0 then acc + d else acc) 0
      (builtins.genList (i: i + 1) (n / 2));

  go = acc: n:
    if n == 0 then acc ++ [ 0 ] else go (acc ++ [ n ]) (aliquot n);
in
  builtins.concatStringsSep " " (map toString (go [ ] 12))
