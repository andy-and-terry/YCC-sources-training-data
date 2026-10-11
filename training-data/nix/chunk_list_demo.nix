let
  chunk = n: xs:
    builtins.genList (i: builtins.genList (j: builtins.elemAt xs (i * n + j))
      (let rest = builtins.length xs - i * n; in if rest < n then rest else n))
      ((builtins.length xs + n - 1) / n);
in
chunk 3 [ 1 2 3 4 5 6 7 ]
