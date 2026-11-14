let
  base = { a = 1; b = { x = 1; }; };
  extra = { b = { y = 2; }; c = 3; };
in
base // extra // { b = base.b // extra.b; }
