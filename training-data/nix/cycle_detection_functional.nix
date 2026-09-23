let
  neighbors = graph: node: graph.${node} or [ ];

  # DFS with a recursion stack: WHITE (unvisited), GRAY (on the current
  # path) and BLACK (fully explored). Hitting a GRAY node means a back
  # edge, i.e. a cycle.
  hasCycle = graph: nodes:
    let
      visit = state: node:
        if state.ok == false then state
        else if (state.color.${node} or "white") == "black" then state
        else if (state.color.${node} or "white") == "gray" then { color = state.color; ok = false; }
        else
          let
            entered = state.color // { ${node} = "gray"; };
            afterChildren = builtins.foldl'
              visit
              { color = entered; ok = state.ok; }
              (neighbors graph node);
          in
            if afterChildren.ok == false then afterChildren
            else { color = afterChildren.color // { ${node} = "black"; }; ok = true; };

      final = builtins.foldl' visit { color = { }; ok = true; } nodes;
    in
      !final.ok;

  cyclic = { a = [ "b" ]; b = [ "c" ]; c = [ "a" ]; };
  acyclic = { a = [ "b" "c" ]; b = [ "d" ]; c = [ "d" ]; d = [ ]; };
in
  {
    cyclicHasCycle = hasCycle cyclic [ "a" "b" "c" ];
    acyclicHasCycle = hasCycle acyclic [ "a" "b" "c" "d" ];
  }
