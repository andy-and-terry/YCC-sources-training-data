let
  s = "banana$";
  n = builtins.stringLength s;
  rots = builtins.genList (i: builtins.substring i n s + builtins.substring 0 i s) n;
  sorted = builtins.sort (a: b: a < b) rots;
in
builtins.concatStringsSep "" (map (r: builtins.substring (n - 1) 1 r) sorted)
