let
  n = 8;
  pascalMod2 = r: c: if c == 0 || c == r then 1 else
    builtins.bitXor (pascalMod2 (r - 1) (c - 1)) (pascalMod2 (r - 1) c);
  range = a: b: builtins.genList (i: a + i) (b - a + 1);
  row = r:
    (builtins.concatStringsSep "" (builtins.genList (_: " ") (n - r - 1)))
    + builtins.concatStringsSep "" (map (c: if pascalMod2 r c == 1 then "* " else "  ") (range 0 r));
in
builtins.concatStringsSep "\n" (map row (range 0 (n - 1)))
