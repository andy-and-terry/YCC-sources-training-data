# Chebyshev distance: largest coordinate difference
let
  abs = x: if x < 0 then -x else x;
  zipWith = f: a: b: builtins.genList (i: f (builtins.elemAt a i) (builtins.elemAt b i)) (builtins.length a);
  chebyshev = a: b: builtins.foldl' (m: d: if d > m then d else m) 0 (zipWith (x: y: abs (x - y)) a b);
in
chebyshev [ 1 2 ] [ 4 6 ]
