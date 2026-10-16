let
  a = { x = 1; y = 2; z = 3; };
  b = { y = 20; z = 30; w = 40; };
in
{
  inter = builtins.intersectAttrs a b;
  removed = removeAttrs a [ "x" ];
  keysOnlyInA = builtins.filter (k: !(b ? ${k})) (builtins.attrNames a);
}
