let
  double = x: x * 2;
  add = a: b: a + b;
in {
  a = double 21;
  b = add 1 2;
  c = builtins.map double [ 1 2 3 ];
}
