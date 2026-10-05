let
  f = { name, greeting ? "Hello", ... }: "${greeting}, ${name}!";
  g = x: x;
  # call a function with only the arguments it declares
  callWith = fn: args:
    let
      declared = builtins.functionArgs fn;
      picked = builtins.intersectAttrs declared args;
    in
      fn picked;
in
  {
    args = builtins.functionArgs f;
    plainArgs = builtins.functionArgs g;
    result = callWith f { name = "Nix"; unrelated = 1; };
  }
