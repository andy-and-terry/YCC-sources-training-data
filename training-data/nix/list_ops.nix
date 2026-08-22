let
  numbers = builtins.genList (n: n + 1) 10;
  doubled = map (x: x * 2) numbers;
  evens = builtins.filter (x: builtins.bitAnd x 1 == 0) numbers;
  sum = builtins.foldl' (acc: x: acc + x) 0 numbers;
in
  {
    inherit doubled evens sum;
  }
