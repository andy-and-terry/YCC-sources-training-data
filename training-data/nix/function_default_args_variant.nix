let
  f = { name, greeting ? "hi", ... }: "${greeting} ${name}";
in {
  a = f { name = "ann"; };
  b = f { name = "bob"; greeting = "yo"; extra = 1; };
}
