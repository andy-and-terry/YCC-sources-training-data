let
  replicate = n: x: builtins.genList (_: x) n;
  repeatStr = n: s: builtins.concatStringsSep "" (replicate n s);
in
{
  fives = replicate 4 5;
  bar = repeatStr 10 "=";
  grid = replicate 2 (replicate 3 0);
}
