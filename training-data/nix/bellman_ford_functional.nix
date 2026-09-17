let
  edges = [
    { from = "a"; to = "b"; weight = 4; }
    { from = "a"; to = "c"; weight = 5; }
    { from = "b"; to = "c"; weight = -3; }
    { from = "c"; to = "d"; weight = 4; }
    { from = "b"; to = "d"; weight = 6; }
  ];
  nodes = [ "a" "b" "c" "d" ];
  inf = 999999;

  relaxOnce = dist:
    builtins.foldl'
      (d: e:
        let
          du = d.${e.from} or inf;
          dv = d.${e.to} or inf;
        in
          if du != inf && du + e.weight < dv
          then d // { ${e.to} = du + e.weight; }
          else d)
      dist
      edges;

  relaxN = dist: n:
    if n == 0 then dist else relaxN (relaxOnce dist) (n - 1);

  initial = builtins.listToAttrs
    (map (n: { name = n; value = if n == "a" then 0 else inf; }) nodes);
in
  relaxN initial (builtins.length nodes - 1)
