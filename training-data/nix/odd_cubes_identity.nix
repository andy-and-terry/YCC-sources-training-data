let
  cubeFromOdds = n:
    let start = n * n - n + 1;
    in builtins.foldl' (acc: i: acc + start + 2 * i) 0 (builtins.genList (i: i) n);
in
builtins.map (n: { inherit n; cube = cubeFromOdds n; ok = cubeFromOdds n == n * n * n; }) [ 1 2 3 4 5 ]
