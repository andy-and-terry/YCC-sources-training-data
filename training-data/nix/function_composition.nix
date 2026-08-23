let
  compose = f: g: x: f (g x);
  double = x: x * 2;
  increment = x: x + 1;
  doubleThenIncrement = compose increment double;
in
  doubleThenIncrement 5
