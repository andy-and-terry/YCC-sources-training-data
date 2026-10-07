let
  n = 5;
  edges = [
    { from = 0; to = 1; weight = 6; }
    { from = 0; to = 3; weight = 7; }
    { from = 1; to = 2; weight = 5; }
    { from = 1; to = 3; weight = 8; }
    { from = 1; to = 4; weight = -4; }
    { from = 2; to = 1; weight = -2; }
    { from = 3; to = 2; weight = -3; }
    { from = 3; to = 4; weight = 9; }
    { from = 4; to = 0; weight = 2; }
    { from = 4; to = 2; weight = 7; }
  ];
  inf = 999999;

  relax = dist:
    builtins.foldl'
      (d: e:
        let
          du = builtins.elemAt d e.from;
          dv = builtins.elemAt d e.to;
        in
          if du != inf && du + e.weight < dv then
            builtins.genList (k: if k == e.to then du + e.weight else builtins.elemAt d k) n
          else
            d)
      dist
      edges;

  initDist = builtins.genList (i: if i == 0 then 0 else inf) n;

  finalDist = builtins.foldl' (d: _: relax d) initDist (builtins.genList (i: i) (n - 1));
in
  finalDist
