let
  inf = 999999;
  graph = [
    [ 0 4 1 0 0 ]
    [ 4 0 2 1 0 ]
    [ 1 2 0 5 0 ]
    [ 0 1 5 0 3 ]
    [ 0 0 0 3 0 ]
  ];
  n = builtins.length graph;

  dijkstra = src:
    let
      initDist = builtins.genList (i: if i == src then 0 else inf) n;

      step = dist: visited:
        if builtins.length visited == n then dist
        else
          let
            unvisited = builtins.filter (i: !(builtins.elem i visited)) (builtins.genList (i: i) n);
            u = builtins.foldl'
              (best: i: if builtins.elemAt dist i < builtins.elemAt dist best then i else best)
              (builtins.head unvisited)
              unvisited;
            row = builtins.elemAt graph u;
            newDist = builtins.genList
              (i:
                let
                  w = builtins.elemAt row i;
                  through = builtins.elemAt dist u + w;
                in
                  if w != 0 && through < builtins.elemAt dist i then through else builtins.elemAt dist i)
              n;
          in
            step newDist (visited ++ [ u ]);
    in
      step initDist [ ];
in
  dijkstra 0
