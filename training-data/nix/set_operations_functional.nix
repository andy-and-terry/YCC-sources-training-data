let
  a = [ 1 2 3 4 5 ];
  b = [ 3 4 5 6 7 ];

  union = xs: ys: xs ++ builtins.filter (x: !(builtins.elem x xs)) ys;
  intersect = xs: ys: builtins.filter (x: builtins.elem x ys) xs;
  difference = xs: ys: builtins.filter (x: !(builtins.elem x ys)) xs;
in
  {
    union = union a b;
    intersect = intersect a b;
    difference = difference a b;
  }
