let
  graph = {
    a = { b = 4; c = 1; };
    b = { d = 1; };
    c = { b = 2; d = 5; };
    d = { };
  };

  nodes = builtins.attrNames graph;
  inf = 999999;

  # pick the unvisited node with the smallest known distance
  pickMin = dist: visited:
    let
      candidates = builtins.filter (n: !(builtins.elem n visited)) nodes;
      step = acc: n:
        if acc == null then n
        else if builtins.getAttr n dist < builtins.getAttr acc dist then n
        else acc;
    in
      builtins.foldl' step null candidates;

  relax = dist: current: neighbor: weight:
    let
      newDist = builtins.getAttr current dist + weight;
    in
      if newDist < builtins.getAttr neighbor dist
      then dist // { ${neighbor} = newDist; }
      else dist;

  relaxAll = dist: current:
    let
      edges = builtins.getAttr current graph;
      neighbors = builtins.attrNames edges;
    in
      builtins.foldl'
        (d: n: relax d current n (builtins.getAttr n edges))
        dist
        neighbors;

  go = dist: visited:
    if builtins.length visited == builtins.length nodes then dist
    else
      let
        current = pickMin dist visited;
      in
        if current == null then dist
        else go (relaxAll dist current) (visited ++ [ current ]);

  initialDist = builtins.listToAttrs
    (map (n: { name = n; value = if n == "a" then 0 else inf; }) nodes);
in
  go initialDist [ ]
