let
  range = a: b: builtins.genList (i: a + i) (b - a + 1);
  sum = builtins.foldl' (a: b: a + b) 0;
  squares = map (x: x * x) (range 1 10);
in
  {
    inherit squares;
    sumOfSquares = sum squares;
    squareOfSum = let s = sum (range 1 10); in s * s;
    evens = builtins.filter (x: x - 2 * (x / 2) == 0) squares;
  }
