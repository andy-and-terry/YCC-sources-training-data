let
  graph = {
    a = [ "b" "c" ];
    b = [ "a" "d" ];
    c = [ "a" "d" ];
    d = [ "b" "c" ];
  };

  bfs = graph: start:
    let
      step = state:
        if state.queue == [ ] then state.visited
        else
          let
            node = builtins.head state.queue;
            rest = builtins.tail state.queue;
            neighbors = graph.${node} or [ ];
            fresh = builtins.filter
              (n: !(builtins.elem n state.visited) && !(builtins.elem n rest))
              neighbors;
          in
            step {
              visited = state.visited ++ [ node ];
              queue = rest ++ fresh;
            };
    in
      step { visited = [ ]; queue = [ start ]; };
in
  bfs graph "a"
