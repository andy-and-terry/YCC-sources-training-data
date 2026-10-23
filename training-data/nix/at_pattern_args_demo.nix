let
  describe = args@{ name, version ? "1.0", ... }:
    "${name}-${version} has ${toString (builtins.length (builtins.attrNames args))} args";

  withRest = { a, b, ... }@all: a + b + builtins.length (builtins.attrNames all);
in
  {
    one = describe { name = "foo"; };
    two = describe { name = "bar"; version = "2.1"; extra = true; };
    sum = withRest { a = 1; b = 2; c = 3; };
  }
