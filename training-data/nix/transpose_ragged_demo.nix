let
  maxLen = xss: builtins.foldl' (m: r: if builtins.length r > m then builtins.length r else m) 0 xss;
  transpose = xss:
    builtins.genList (j:
      builtins.concatMap (r: if j < builtins.length r then [ (builtins.elemAt r j) ] else [ ]) xss)
      (maxLen xss);
in
transpose [ [ 1 2 3 ] [ 4 5 ] [ 6 ] ]
