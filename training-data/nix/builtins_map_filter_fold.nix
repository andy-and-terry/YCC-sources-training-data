with builtins;
{
  sq = map (x: x * x) [ 1 2 3 4 ];
  ev = filter (x: x - (x / 2) * 2 == 0) [ 1 2 3 4 ];
  total = foldl' (a: b: a + b) 0 [ 1 2 3 ];
}
