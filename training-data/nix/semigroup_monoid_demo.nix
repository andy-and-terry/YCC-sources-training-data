let
  monoidList = { empty = [ ]; append = a: b: a ++ b; };
  monoidSum = { empty = 0; append = a: b: a + b; };
  monoidStr = { empty = ""; append = a: b: a + b; };
  mconcat = m: xs: builtins.foldl' m.append m.empty xs;
in
{
  l = mconcat monoidList [ [ 1 ] [ 2 3 ] [ ] ];
  s = mconcat monoidSum [ 1 2 3 4 ];
  t = mconcat monoidStr [ "a" "b" "c" ];
}
