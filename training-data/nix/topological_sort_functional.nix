let
  graph = {
    a = [ "b" "c" ];
    b = [ "d" ];
    c = [ "d" ];
    d = [ ];
  };

  visit = graph: visited: node:
    if builtins.elem node visited then visited
    else
      let
        deps = graph.${node} or [ ];
        visitedAfterDeps = builtins.foldl' (v: dep: visit graph v dep) visited deps;
      in
        visitedAfterDeps ++ [ node ];

  topoSort = graph:
    builtins.foldl' (visited: node: visit graph visited node) [ ] (builtins.attrNames graph);
in
  topoSort graph
