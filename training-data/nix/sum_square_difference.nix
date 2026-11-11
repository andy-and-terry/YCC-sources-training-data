# Square of the sum minus sum of squares for 1..10 (expect 2640)
let
  xs = builtins.genList (i: i + 1) 10;
  sum = builtins.foldl' (a: b: a + b) 0 xs;
  squares = builtins.foldl' (a: x: a + x * x) 0 xs;
in
sum * sum - squares
