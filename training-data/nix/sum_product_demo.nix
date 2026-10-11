let
  sum = builtins.foldl' (a: b: a + b) 0;
  product = builtins.foldl' (a: b: a * b) 1;
  xs = builtins.genList (i: i + 1) 6;
in
{ inherit xs; total = sum xs; fact6 = product xs; mean = (sum xs) / 6.0; }
