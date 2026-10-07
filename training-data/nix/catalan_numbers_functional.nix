let
  catalan = n:
    if n <= 1 then 1
    else
      builtins.foldl'
        (acc: i: acc + (catalan i) * (catalan (n - 1 - i)))
        0
        (builtins.genList (i: i) n);

  results = builtins.genList catalan 8;
in
  results
