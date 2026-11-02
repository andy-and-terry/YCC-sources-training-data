let
  prices = { apple = 3; pear = 5; fig = 9; };
in
  builtins.mapAttrs (_: v: v * 2) (
    removeAttrs prices [ "fig" ]
  )
