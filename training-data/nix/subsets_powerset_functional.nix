let
  powerset = list:
    if list == [ ] then [ [ ] ]
    else
      let
        x = builtins.head list;
        rest = builtins.tail list;
        withoutX = powerset rest;
      in
        withoutX ++ map (s: [ x ] ++ s) withoutX;
in
  powerset [ 1 2 3 ]
