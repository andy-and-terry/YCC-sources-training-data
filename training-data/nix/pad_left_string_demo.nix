let
  # Repeat a string n times by folding over a generated list.
  repeat = s: n: builtins.concatStringsSep "" (builtins.genList (_: s) n);

  # Left-pad to a fixed width using a chosen fill character.
  padLeft = width: fill: s:
    let missing = width - builtins.stringLength s;
    in if missing > 0 then repeat fill missing + s else s;

  padRight = width: fill: s:
    let missing = width - builtins.stringLength s;
    in if missing > 0 then s + repeat fill missing else s;

  rows = [
    { name = "nix"; n = 7; }
    { name = "haskell"; n = 42; }
    { name = "ml"; n = 1234; }
  ];

  formatRow = r: padRight 10 "." r.name + padLeft 6 " " (toString r.n);
in
  {
    zeroPadded = map (n: padLeft 4 "0" (toString n)) [ 3 42 512 ];
    table = builtins.concatStringsSep "\n" (map formatRow rows);
  }
