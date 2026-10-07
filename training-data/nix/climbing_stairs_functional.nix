let
  climb = n:
    if n <= 2 then n
    else
      let
        fibs = [ 1 2 ] ++ builtins.genList (i: builtins.elemAt fibs i + builtins.elemAt fibs (i + 1)) (n - 2);
      in
        builtins.elemAt fibs (n - 1);
in
  builtins.genList (i: climb (i + 1)) 10
