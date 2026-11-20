# Manhattan distance.
let
  abs = x: if x < 0 then -x else x;
  a = [ 1 2 ];
  b = [ 4 6 ];
in
builtins.foldl' builtins.add 0 (builtins.genList (i: abs (builtins.elemAt a i - builtins.elemAt b i)) 2)
