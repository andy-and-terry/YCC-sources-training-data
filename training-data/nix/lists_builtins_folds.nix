let
  xs = [ 5 3 8 1 9 2 ];
in {
  sorted = builtins.sort (a: b: a < b) xs;
  mapped = map (x: x * x) xs;
  filtered = builtins.filter (x: x > 4) xs;
  sum = builtins.foldl' (a: b: a + b) 0 xs;
  len = builtins.length xs;
  head = builtins.head xs;
  tail = builtins.tail xs;
  elemAt = builtins.elemAt xs 2;
  has = builtins.elem 8 xs;
  concat = xs ++ [ 100 ];
  flat = builtins.concatLists [ [ 1 ] [ 2 3 ] [ ] ];
  concatMap = builtins.concatMap (x: [ x x ]) [ 1 2 ];
  all = builtins.all (x: x > 0) xs;
  any = builtins.any (x: x > 8) xs;
  partition = builtins.partition (x: x > 4) xs;
  groupBy = builtins.groupBy (x: if x > 4 then "big" else "small") xs;
  zip = builtins.genList (i: [ (builtins.elemAt xs i) (builtins.elemAt (builtins.tail xs) i) ]) 3;
}
