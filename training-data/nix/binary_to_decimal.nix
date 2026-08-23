let
  binaryToDecimal = s:
    let
      chars = builtins.genList (i: builtins.substring i 1 s) (builtins.stringLength s);
    in
      builtins.foldl' (acc: c: acc * 2 + builtins.fromJSON c) 0 chars;
in
  binaryToDecimal "1011"
