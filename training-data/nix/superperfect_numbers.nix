let
  sigma = n: builtins.foldl' (a: b: a + b) 0
    (builtins.filter (d: n - (n / d) * d == 0) (builtins.genList (i: i + 1) n));
in
builtins.filter (n: sigma (sigma n) == 2 * n) (builtins.genList (i: i + 1) 99)
# [ 2 4 16 64 ]
