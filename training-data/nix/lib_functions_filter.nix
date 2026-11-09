let
  xs = [ 1 2 3 4 5 6 ];
in {
  evens = builtins.filter (x: x - (x / 2) * 2 == 0) xs;
  sum = builtins.foldl' (a: b: a + b) 0 xs;
  len = builtins.length xs;
  sorted = builtins.sort (a: b: a > b) xs;
}
