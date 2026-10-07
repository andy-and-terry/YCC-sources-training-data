let
  xs = [ 3 8 12 5 ];
  anyEven = builtins.any (x: x - (x / 2) * 2 == 0) xs;
  allPositive = builtins.all (x: x > 0) xs;
  allBig = builtins.all (x: x > 5) xs;
  firstBig = builtins.head (builtins.filter (x: x > 5) xs);
in
{ inherit anyEven allPositive allBig firstBig; }
