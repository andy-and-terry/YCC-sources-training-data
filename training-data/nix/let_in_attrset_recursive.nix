let
  base = 10;
  cfg = rec {
    a = base;
    b = a * 2;
    c = a + b;
  };
in
  cfg
