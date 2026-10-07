let
  # prices.(i) is the sale price of a rod of length (i + 1).
  prices = [ 1 5 8 9 10 17 17 20 ];

  cutRod = n:
    if n == 0 then 0
    else
      let
        options = builtins.genList
          (i:
            let len = i + 1; in
            if len > n then null
            else (builtins.elemAt prices i) + cutRod (n - len))
          (builtins.length prices);
        valid = builtins.filter (x: x != null) options;
      in
        builtins.foldl' (a: b: if b > a then b else a) (builtins.head valid) valid;
in
  cutRod 8
