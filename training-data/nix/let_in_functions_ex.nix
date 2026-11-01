let
  add = a: b: a + b;
  inc = add 1;
  square = x: x * x;
in {
  a = inc 41;
  b = square 7;
  c = map square [ 1 2 3 ];
}
