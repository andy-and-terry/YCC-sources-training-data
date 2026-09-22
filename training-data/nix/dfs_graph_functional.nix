let
  # Adjacency list keyed by node index; complements bfs_graph_functional.nix
  # by exploring as deep as possible before backtracking.
  graph = [
    [ 1 2 ]   # 0
    [ 3 ]     # 1
    [ 3 ]     # 2
    [ 4 ]     # 3
    [ ]       # 4
  ];

  dfs = start:
    let
      go = visited: node:
        if builtins.elem node visited then visited
        else
          let
            visited' = visited ++ [ node ];
            neighbors = builtins.elemAt graph node;
          in
            builtins.foldl' go visited' neighbors;
    in
      go [ ] start;
in
  {
    order = dfs 0;
  }
