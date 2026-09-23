let
  neighbors = graph: node: graph.${node} or [ ];

  # BFS 2-coloring: color the start 0, every neighbor the opposite color,
  # and fail as soon as an edge connects two same-colored nodes.
  isBipartite = graph: start:
    let
      go = state: queue:
        if queue == [ ] then state
        else
          let
            node = builtins.head queue;
            rest = builtins.tail queue;
            myColor = state.colors.${node};
            nbrs = neighbors graph node;
            conflict = builtins.any (n: (state.colors.${n} or null) == myColor) nbrs;
            uncolored = builtins.filter (n: !(builtins.hasAttr n state.colors)) nbrs;
            newColors = builtins.foldl'
              (acc: n: acc // { ${n} = 1 - myColor; })
              state.colors
              uncolored;
          in
            if conflict then { colors = state.colors; ok = false; }
            else go { colors = newColors; ok = true; } (rest ++ uncolored);
    in
      (go { colors = { ${start} = 0; }; ok = true; } [ start ]).ok;

  evenCycle = { a = [ "b" "d" ]; b = [ "a" "c" ]; c = [ "b" "d" ]; d = [ "a" "c" ]; };
  oddCycle = { a = [ "b" "c" ]; b = [ "a" "c" ]; c = [ "a" "b" ]; };
in
  {
    evenCycleIsBipartite = isBipartite evenCycle "a";
    oddCycleIsBipartite = isBipartite oddCycle "a";
  }
