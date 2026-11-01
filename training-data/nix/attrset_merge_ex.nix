let
  base = { a = 1; b = 2; };
  extra = { b = 20; c = 3; };
in {
  merged = base // extra;
  names = builtins.attrNames (base // extra);
  hasC = (base // extra) ? c;
  mapped = builtins.mapAttrs (n: v: v * 10) base;
}
