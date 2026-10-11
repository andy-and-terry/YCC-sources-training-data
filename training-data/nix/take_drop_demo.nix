let
  take = n: xs: builtins.genList (i: builtins.elemAt xs i) (if n > builtins.length xs then builtins.length xs else n);
  drop = n: xs: builtins.genList (i: builtins.elemAt xs (i + n)) (if n > builtins.length xs then 0 else builtins.length xs - n);
  xs = [ 1 2 3 4 5 6 ];
in
{ first3 = take 3 xs; rest = drop 4 xs; over = take 10 xs; }
