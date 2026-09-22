let
  fibs = [ 0 1 ] ++ builtins.genList (i: builtins.elemAt fibs i + builtins.elemAt fibs (i + 1)) 8;
in
  fibs
