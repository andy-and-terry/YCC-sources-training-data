let
  names = [ "alpha" "beta" "gamma" ];
  # listToAttrs with nameValuePair
  lengths = builtins.listToAttrs (map (n: { name = n; value = builtins.stringLength n; }) names);
  # genAttrs-style: attribute for each name computed from the name
  genAttrs = ns: f: builtins.listToAttrs (map (n: { name = n; value = f n; }) ns);
  upper = genAttrs names (n: "<" + n + ">");
in
{
  inherit lengths upper;
  keys = builtins.attrNames lengths;
  values = builtins.attrValues lengths;
  total = builtins.foldl' (a: b: a + b) 0 (builtins.attrValues lengths);
}
