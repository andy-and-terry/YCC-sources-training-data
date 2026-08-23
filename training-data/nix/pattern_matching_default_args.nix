let
  greet = { name, greeting ? "Hello" }: "${greeting}, ${name}!";
in
  {
    default = greet { name = "World"; };
    custom = greet { name = "World"; greeting = "Hi"; };
  }
