let
  toBin = n: if n < 2 then toString n else toBin (n / 2) + toString (n - (n / 2) * 2);
  fromBin = s: builtins.foldl' (acc: c: acc * 2 + builtins.fromJSON c) 0
    (builtins.genList (i: builtins.substring i 1 s) (builtins.stringLength s));
in
{ b10 = toBin 10; b255 = toBin 255; back = fromBin "101101"; }
