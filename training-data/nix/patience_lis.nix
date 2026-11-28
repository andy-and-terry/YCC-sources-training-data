let
  insert = tails: x:
    let
      idx = builtins.length (builtins.filter (t: t < x) tails);
    in
    if idx == builtins.length tails
    then tails ++ [ x ]
    else (builtins.genList (i: builtins.elemAt tails i) idx) ++ [ x ]
         ++ (builtins.genList (i: builtins.elemAt tails (idx + 1 + i)) (builtins.length tails - idx - 1));
in
builtins.length (builtins.foldl' insert [ ] [ 10 9 2 5 3 7 101 18 ])
