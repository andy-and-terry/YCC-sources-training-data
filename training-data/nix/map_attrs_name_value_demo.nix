let
  prices = { apple = 3; pear = 5; plum = 8; };

  # mapAttrs gets (name, value) and rewrites each value, keeping the keys.
  withTax = builtins.mapAttrs (name: price: price * 12 / 10) prices;

  # The name argument can be used to build richer values.
  labelled = builtins.mapAttrs (name: price: "${name}: ${toString price}") prices;

  # To rename keys, go through a list of { name; value; } pairs instead.
  upperKeys = builtins.listToAttrs (
    map (n: {
      name = "item_" + n;
      value = prices.${n};
    }) (builtins.attrNames prices)
  );

  # Nested mapAttrs transforms an attrset of attrsets.
  nested = builtins.mapAttrs
    (_: v: builtins.mapAttrs (_: x: x * 2) v)
    { a = { x = 1; y = 2; }; b = { x = 3; }; };
in
  { inherit withTax labelled upperKeys nested; }
