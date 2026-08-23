let
  numbers = builtins.genList (i: i + 1) 20;
  evens = builtins.filter (n: n - (n / 2) * 2 == 0) numbers;
  squares = map (n: n * n) evens;
  total = builtins.foldl' (a: b: a + b) 0 squares;
in
  {
    inherit evens squares total;
  }
