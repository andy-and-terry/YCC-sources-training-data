let
  xs = [ 1 2 3 4 5 ];
  sum = builtins.foldl' (acc: x: acc + x) 0 xs;
  product = builtins.foldl' (acc: x: acc * x) 1 xs;
  maxOf = builtins.foldl' (a: b: if b > a then b else a) 0 xs;
  # build an attrset by folding
  counts = builtins.foldl'
    (acc: w: acc // { ${w} = (acc.${w} or 0) + 1; })
    { }
    [ "a" "b" "a" "c" "b" "a" ];
in
{ inherit sum product maxOf counts; }
