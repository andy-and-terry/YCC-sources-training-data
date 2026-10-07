let
  graph = {
    a = [ "b" "c" ];
    b = [ "d" ];
    c = [ "d" ];
    d = [ ];
  };

  bfs = graph: start:
    let
      go = visited: queue:
        if queue == [ ] then visited
        else
          let
            node = builtins.head queue;
            rest = builtins.tail queue;
          in
            if builtins.elem node visited then go visited rest
            else
              let
                neighbors = graph.${node} or [ ];
              in
                go (visited ++ [ node ]) (rest ++ neighbors);
    in
      go [ ] [ start ];
in
  {
    order = bfs graph "a";
  }
