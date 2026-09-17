let
  xs = [ 10 9 2 5 3 7 101 18 ];

  lisEndingAt = i:
    if i == 0 then 1
    else
      let
        x = builtins.elemAt xs i;
        prevLengths = map
          (j: if builtins.elemAt xs j < x then (lisEndingAt j) + 1 else 1)
          (builtins.genList (n: n) i);
      in
        builtins.foldl' (a: b: if a > b then a else b) 1 prevLengths;

  lengths = map lisEndingAt (builtins.genList (n: n) (builtins.length xs));
in
  builtins.foldl' (a: b: if a > b then a else b) 0 lengths
