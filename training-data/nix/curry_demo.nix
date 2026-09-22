let
  # every Nix function takes exactly one argument; multi-argument
  # functions are just nested single-argument functions (currying),
  # so partial application falls out for free.
  add3 = a: b: c: a + b + c;

  addFive = add3 5;
  addFiveAndTwo = addFive 2;

  compose2 = f: g: x: f (g x);
  incr = x: x + 1;
  double = x: x * 2;
  incrThenDouble = compose2 double incr;
in
  {
    direct = add3 1 2 3;
    partial1 = addFive 10 20;
    partial2 = addFiveAndTwo 3;
    composed = incrThenDouble 4;
  }
