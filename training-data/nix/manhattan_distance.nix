# Manhattan distance between two integer lists
let
  abs = x: if x < 0 then -x else x;
  zipWith = f: a: b: builtins.genList (i: f (builtins.elemAt a i) (builtins.elemAt b i)) (builtins.length a);
  manhattan = a: b: builtins.foldl' (s: x: s + x) 0 (zipWith (x: y: abs (x - y)) a b);
in
manhattan [ 1 2 ] [ 4 6 ]
