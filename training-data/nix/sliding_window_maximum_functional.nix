let
  xs = [ 1 3 (-1) (-3) 5 3 6 7 ];
  k = 3;

  windowMax = start:
    let
      window = builtins.sublist start k xs;
    in
      builtins.foldl' (a: b: if a > b then a else b) (builtins.head window) window;

  numWindows = builtins.length xs - k + 1;
in
  map windowMax (builtins.genList (n: n) numWindows)
