let
  name = "World";

  # inside a `''...''` string, a literal `${` must be written as
  # `''${` so it isn't parsed as interpolation.
  literalDollar = ''
    price: ''${amount}
    hello: ${name}
  '';

  # multi-line strings strip the common leading indentation of all
  # lines, so this renders without the six-space margin below.
  block = ''
    line one
      line two, indented one more level
    line three
  '';
in
  {
    inherit literalDollar block;
  }
