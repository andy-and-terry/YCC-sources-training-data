let
  s = { b = 2; a = 1; c = 3; };
in
{
  names = builtins.attrNames s;
  values = builtins.attrValues s;
  hasA = s ? a;
  hasZ = s ? z;
  withDefault = s.z or 0;
  count = builtins.length (builtins.attrNames s);
}
