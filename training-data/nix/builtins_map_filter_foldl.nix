let
  xs = builtins.genList (i: i + 1) 8;
in {
  evens = builtins.filter (x: x - (x / 2) * 2 == 0) xs;
  squares = map (x: x * x) xs;
  total = builtins.foldl' (a: b: a + b) 0 xs;
}
