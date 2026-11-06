# Repunits: numbers made only of the digit 1.
let
  repunits = n: builtins.genList (i: (builtins.foldl' (acc: _: acc * 10 + 1) 0 (builtins.genList (x: x) (i + 1)))) n;
in
repunits 5
