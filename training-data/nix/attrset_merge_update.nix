let
  base = { a = 1; b = 2; };
  extra = { b = 3; c = 4; };
in {
  merged = base // extra;
  names = builtins.attrNames (base // extra);
  hasA = base ? a;
}
