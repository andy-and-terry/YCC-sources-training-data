let
  permutations = list:
    if list == [ ] then [ [ ] ]
    else
      builtins.concatLists
        (map
          (x:
            let rest = builtins.filter (y: y != x) list; in
            map (p: [ x ] ++ p) (permutations rest))
          list);
in
  permutations [ 1 2 3 ]
