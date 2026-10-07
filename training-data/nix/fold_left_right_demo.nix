let
  xs = [ 1 2 3 4 ];
  sum = builtins.foldl' (acc: x: acc + x) 0 xs;
  # foldl' walks left to right, so subtraction nests to the left
  leftSub = builtins.foldl' (acc: x: acc - x) 10 xs;
  # a right fold can be built from foldl' by flipping the list
  rightSub = builtins.foldl' (acc: x: x - acc) 0 (builtins.genList (i: builtins.elemAt xs (3 - i)) 4);
  maxOf = builtins.foldl' (a: b: if b > a then b else a) 0 [ 3 9 4 ];
in
{ inherit sum leftSub rightSub maxOf; }
