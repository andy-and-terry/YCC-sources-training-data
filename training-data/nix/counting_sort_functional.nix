let
  data = [ 4 2 2 8 3 3 1 ];

  maxVal = builtins.foldl' (a: b: if b > a then b else a) 0 data;

  counts = builtins.foldl'
    (acc: x: acc // { ${toString x} = (acc.${toString x} or 0) + 1; })
    { }
    data;

  sorted = builtins.concatMap
    (i: builtins.genList (_: i) (counts.${toString i} or 0))
    (builtins.genList (i: i) (maxVal + 1));
in
  sorted
