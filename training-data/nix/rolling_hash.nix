let
  s = "abcabc";
  k = 3;
  chars = builtins.genList (i: builtins.substring i 1 s) (builtins.stringLength s);
  code = c: builtins.getAttr c { a = 97; b = 98; c = 99; };
  hashWindow = i:
    builtins.foldl' (h: j: builtins.rem (h * 31 + code (builtins.elemAt chars j)) 1000003) 0
      (builtins.genList (x: i + x) k);
in
builtins.genList hashWindow (builtins.stringLength s - k + 1)
