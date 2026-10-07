let
  # `builtins.mapAttrs` applies a function to every value in an attrset,
  # passing both the attribute name and its value, and keeps the same
  # keys — the attrset analogue of `map` over a list.
  prices = { apple = 2; banana = 1; cherry = 5; };

  doubled = builtins.mapAttrs (name: value: value * 2) prices;

  labeled = builtins.mapAttrs (name: value: "${name}: $${toString value}") prices;
in
  {
    inherit doubled labeled;
  }
