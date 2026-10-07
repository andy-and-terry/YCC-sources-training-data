let
  xs = [ 1 2 3 4 5 ];
  sum = builtins.foldl' (acc: x: acc + x) 0 xs;
  reversed = builtins.foldl' (acc: x: [ x ] ++ acc) [ ] xs;
  maxOf = builtins.foldl' (a: b: if b > a then b else a) 0 xs;
in
{ inherit sum reversed maxOf; }
