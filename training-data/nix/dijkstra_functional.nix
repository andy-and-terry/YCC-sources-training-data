let
  inf = 999999;

  graph = {
    a = { b = 4; c = 1; };
    b = { d = 1; };
    c = { b = 2; d = 5; };
    d = { };
  };

  nodes = builtins.attrNames graph;

  neighbors = node: graph.${node} or { };

  # One relaxation pass over every unvisited node: pick the closest one,
  # relax its outgoing edges into `dist`, and recurse on the rest.
  dijkstra = dist: unvisited:
    if unvisited == [ ] then dist
    else
      let
        withDist = map (n: { name = n; d = dist.${n} or inf; }) unvisited;
        closest = builtins.foldl'
          (best: cur: if cur.d < best.d then cur else best)
          (builtins.head withDist)
          (builtins.tail withDist);
        rest = builtins.filter (n: n != closest.name) unvisited;
        edges = builtins.attrNames (neighbors closest.name);
        relaxed = builtins.foldl'
          (d: nbr:
            let
              via = closest.d + (neighbors closest.name).${nbr};
              cur = d.${nbr} or inf;
            in
              if via < cur then d // { ${nbr} = via; } else d)
          dist
          edges;
      in
        dijkstra relaxed rest;
in
  dijkstra { a = 0; } nodes
