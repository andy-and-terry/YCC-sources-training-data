let
  range = lo: hi: builtins.genList (i: lo + i) (hi - lo + 1);
  evens = builtins.filter (n: n - (n / 2) * 2 == 0) (range 1 10);
  table = map (i: map (j: i * j) (range 1 3)) (range 1 3);
  powersOfTwo = builtins.genList (i: builtins.foldl' (a: _: a * 2) 1 (range 1 i)) 6;
in
{
  r = range 3 7;
  inherit evens table powersOfTwo;
  total = builtins.foldl' builtins.add 0 (range 1 100);
}
