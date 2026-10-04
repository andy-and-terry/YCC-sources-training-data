let
  set = { b = 2; a = 1; c = 3; };
in
{
  names = builtins.attrNames set;
  values = builtins.attrValues set;
  hasA = builtins.hasAttr "a" set;
  getB = builtins.getAttr "b" set;
  total = builtins.foldl' (s: n: s + set.${n}) 0 (builtins.attrNames set);
  pairs = builtins.map (n: { name = n; value = set.${n}; }) (builtins.attrNames set);
}
