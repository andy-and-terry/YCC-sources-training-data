let
  removeAt = xs: i:
    (builtins.sublist 0 i xs) ++ (builtins.sublist (i + 1) (builtins.length xs - i - 1) xs);

  permutations = xs:
    if xs == [ ] then [ [ ] ]
    else
      builtins.concatMap
        (i:
          let
            x = builtins.elemAt xs i;
            rest = removeAt xs i;
          in
            map (p: [ x ] ++ p) (permutations rest))
        (builtins.genList (n: n) (builtins.length xs));
in
  permutations [ 1 2 3 ]
