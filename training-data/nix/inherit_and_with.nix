let
  x = 1; y = 2;
  set = { inherit x y; z = 3; };
in with set; x + y + z
