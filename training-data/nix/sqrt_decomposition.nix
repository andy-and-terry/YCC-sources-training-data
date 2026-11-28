let
  a = [ 5 3 8 1 9 2 7 4 6 0 3 5 ];
  bs = 4;
  sum = builtins.foldl' (x: y: x + y) 0;
  slice = from: len: builtins.genList (i: builtins.elemAt a (from + i)) len;
  blocks = builtins.genList (b: sum (slice (b * bs) bs)) 3;
  # query [2, 9]: elements 2,3 + block 1 + elements 8,9
  total = sum (slice 2 2) + builtins.elemAt blocks 1 + sum (slice 8 2);
in
total
