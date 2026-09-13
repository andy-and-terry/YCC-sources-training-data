let
  fix = f: let x = f x; in x;

  base = self: {
    greeting = "Hello";
    greet = name: "${self.greeting}, ${name}!";
  };

  withOverride = self: (base self) // { greeting = "Howdy"; };
in
  {
    original = (fix base).greet "World";
    overridden = (fix withOverride).greet "World";
  }
