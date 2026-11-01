let
  s = "Hello, Nix";
in {
  len = builtins.stringLength s;
  sub = builtins.substring 0 5 s;
  parts = builtins.split ", " s;
  replaced = builtins.replaceStrings [ "Nix" ] [ "World" ] s;
  multi = ''
    line one
    line two
  '';
}
