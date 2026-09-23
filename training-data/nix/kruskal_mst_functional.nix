let
  edges = [
    { from = "a"; to = "b"; weight = 4; }
    { from = "a"; to = "c"; weight = 1; }
    { from = "c"; to = "b"; weight = 2; }
    { from = "b"; to = "d"; weight = 5; }
    { from = "c"; to = "d"; weight = 8; }
    { from = "d"; to = "e"; weight = 3; }
  ];

  nodes = [ "a" "b" "c" "d" "e" ];

  sortedEdges = builtins.sort (a: b: a.weight < b.weight) edges;

  # Union-find over an attrset parent map, looked up with plain
  # (non-path-compressed) recursion, which is fine for these small graphs.
  find = parent: x:
    if parent.${x} == x then x else find parent parent.${x};

  union = parent: x: y:
    let
      rootX = find parent x;
      rootY = find parent y;
    in
      if rootX == rootY then parent else parent // { ${rootX} = rootY; };

  initialParent = builtins.listToAttrs (map (n: { name = n; value = n; }) nodes);

  step = acc: edge:
    let
      rootFrom = find acc.parent edge.from;
      rootTo = find acc.parent edge.to;
    in
      if rootFrom == rootTo then acc
      else {
        parent = union acc.parent edge.from edge.to;
        mst = acc.mst ++ [ edge ];
        total = acc.total + edge.weight;
      };

  result = builtins.foldl' step { parent = initialParent; mst = [ ]; total = 0; } sortedEdges;
in
  {
    mst = result.mst;
    total = result.total;
  }
