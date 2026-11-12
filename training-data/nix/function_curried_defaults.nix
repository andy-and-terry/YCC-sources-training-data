let
  greet = { name, greeting ? "hello" }: "${greeting}, ${name}";
  add = a: b: a + b;
in [ (greet { name = "ann"; }) (add 1 2) ]
