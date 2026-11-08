let
  xs = [ 10 12 15 15 20 ];
  encode = l: [ (builtins.head l) ] ++ (builtins.genList (i: builtins.elemAt l (i + 1) - builtins.elemAt l i) (builtins.length l - 1));
  decode = ds: builtins.foldl' (acc: d: acc ++ [ ((if acc == [ ] then 0 else builtins.elemAt acc (builtins.length acc - 1)) + d) ]) [ ] ds;
in
{ encoded = encode xs; decoded = decode (encode xs); }
