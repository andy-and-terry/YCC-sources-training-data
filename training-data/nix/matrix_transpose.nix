let
  matrix = [ [ 1 2 ] [ 3 4 ] ];

  transpose = m:
    let
      rows = builtins.length m;
      cols = builtins.length (builtins.head m);
    in
      builtins.genList
        (c: builtins.genList (r: builtins.elemAt (builtins.elemAt m r) c) rows)
        cols;
in
  transpose matrix
