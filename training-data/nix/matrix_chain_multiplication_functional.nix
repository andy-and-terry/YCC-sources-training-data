let
  dims = [ 40 20 30 10 30 ];
  n = builtins.length dims - 1;

  cost = i: j:
    if i == j then 0
    else
      let
        splits = builtins.genList (k: i + k) (j - i);
        vals = map
          (k:
            cost i k + cost (k + 1) j
            + builtins.elemAt dims i * builtins.elemAt dims (k + 1) * builtins.elemAt dims (j + 1))
          splits;
      in
        builtins.foldl' (a: b: if b < a then b else a) (builtins.head vals) vals;
in
  cost 0 (n - 1)
