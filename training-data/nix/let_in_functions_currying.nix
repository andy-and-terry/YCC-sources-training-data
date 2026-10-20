let
  add = a: b: a + b;
  inc = add 1;
  compose = f: g: x: f (g x);
  twice = f: compose f f;
  apply = { f, x }: f x;
  mkPoint = { x ? 0, y ? 0, ... }: { inherit x y; norm2 = x * x + y * y; };
in {
  inc5 = inc 5;
  composed = (compose inc (add 10)) 1;
  twiceInc = twice inc 0;
  applied = apply { f = inc; x = 41; };
  point = mkPoint { x = 3; y = 4; z = 99; };
  defaulted = mkPoint { };
}
