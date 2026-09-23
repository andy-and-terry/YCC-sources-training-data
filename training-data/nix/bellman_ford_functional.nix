let
  inf = 999999;

  # Edges as a flat list; Bellman-Ford relaxes every edge (n - 1) times,
  # which (unlike Dijkstra) tolerates negative weights.
  edges = [
    { from = "a"; to = "b"; weight = 4; }
    { from = "a"; to = "c"; weight = 5; }
    { from = "b"; to = "c"; weight = -3; }
    { from = "c"; to = "d"; weight = 2; }
    { from = "b"; to = "d"; weight = 6; }
  ];

  nodes = [ "a" "b" "c" "d" ];

  relaxOnce = dist:
    builtins.foldl'
      (d: e:
        let
          fromDist = d.${e.from} or inf;
          toDist = d.${e.to} or inf;
          via = fromDist + e.weight;
        in
          if fromDist != inf && via < toDist then d // { ${e.to} = via; } else d)
      dist
      edges;

  relaxTimes = n: dist:
    if n == 0 then dist else relaxTimes (n - 1) (relaxOnce dist);

  initial = { a = 0; };
  final = relaxTimes (builtins.length nodes - 1) initial;
in
  {
    distances = final;
    b = final.b or inf;
    c = final.c or inf;
    d = final.d or inf;
  }
