let
  greet = { name, greeting ? "Hello" }: "${greeting}, ${name}!";
in greet { name = "Nix"; }
