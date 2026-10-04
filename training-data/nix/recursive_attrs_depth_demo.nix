let
  depth = v:
    if builtins.isAttrs v then
      1 + builtins.foldl' (m: n: if n > m then n else m) 0 (map depth (builtins.attrValues v))
    else 0;
  tree = { a = { b = { c = 1; }; }; d = 2; };
in
{ depth = depth tree; flat = depth 5; }
