let
  name = "World";

  # inside a `''...''` string, a literal `${` must be written as
  # `''${` so it isn't parsed as interpolation.
  literalDollar = ''
    price: ''${amount}
    hello: ${name}
  '';

  # multi-line strings strip the common leading indentation shared by
  # every line, so the four-space margin below disappears and only
  # "line two"'s extra two spaces of relative indentation survive.
  block = ''
    line one
      line two, indented one more level
    line three
  '';
in
  {
    inherit literalDollar block;
  }
