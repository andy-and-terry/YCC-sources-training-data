let
  scope = { a = 1; b = 2; c = 3; };
  result = with scope; a + b + c;
in
  result
