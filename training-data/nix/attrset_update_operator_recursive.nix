let
  a = { x = 1; y = { p = 1; }; };
  b = { y = { q = 2; }; z = 3; };
in {
  shallow = a // b;
  names = builtins.attrNames (a // b);
  hasZ = (a // b) ? z;
}
