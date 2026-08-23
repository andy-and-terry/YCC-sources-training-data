let
  items = [ (-2) 1 (-3) 4 (-1) 2 1 (-5) 4 ];

  kadane = list:
    let
      go = state: x:
        let
          current = if x > state.current + x then x else state.current + x;
          best = if state.best > current then state.best else current;
        in
          { inherit current best; };
      result = builtins.foldl' go { current = builtins.head list; best = builtins.head list; } (builtins.tail list);
    in
      result.best;
in
  kadane items
