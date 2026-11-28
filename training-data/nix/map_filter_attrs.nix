let
  xs = { a = 1; b = 2; c = 3; };
  big = builtins.filter (n: n > 1) (builtins.attrValues xs);
in {
  inherit big;
  doubled = builtins.mapAttrs (_: v: v * 2) xs;
}
