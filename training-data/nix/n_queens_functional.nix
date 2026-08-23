let
  isSafe = queens: col:
    let
      n = builtins.length queens;
      indexed = builtins.genList (i: { q = builtins.elemAt queens i; dist = n - i; }) n;
    in
      builtins.all (e: e.q != col && (if e.q - col < 0 then col - e.q else e.q - col) != e.dist) indexed;

  solve = queens: n:
    if builtins.length queens == n then 1
    else
      builtins.foldl'
        (acc: col: if isSafe queens col then acc + solve (queens ++ [ col ]) n else acc)
        0
        (builtins.genList (i: i) n);
in
  solve [ ] 6
