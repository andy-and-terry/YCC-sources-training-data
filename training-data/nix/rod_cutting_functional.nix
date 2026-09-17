let
  prices = [ 1 5 8 9 10 17 17 20 ];

  bestCut = len:
    if len == 0 then 0
    else
      let
        cuts = builtins.genList (i: i + 1) len;
        revenues = map (cut: (builtins.elemAt prices (cut - 1)) + bestCut (len - cut)) cuts;
      in
        builtins.foldl' (a: b: if a > b then a else b) (builtins.head revenues) revenues;
in
  bestCut (builtins.length prices)
