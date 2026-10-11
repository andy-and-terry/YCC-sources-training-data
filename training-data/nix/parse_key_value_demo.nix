let
  text = "name=nix\nversion=2.18\nlicense=LGPL";
  lines = builtins.filter (l: l != "") (builtins.split "\n" text);
  parseLine = l: let m = builtins.match "([^=]+)=(.*)" l; in
    { name = builtins.elemAt m 0; value = builtins.elemAt m 1; };
in
builtins.listToAttrs (map parseLine (builtins.filter builtins.isString lines))
