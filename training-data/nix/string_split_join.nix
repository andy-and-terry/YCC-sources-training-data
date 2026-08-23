let
  s = "Hello, Nix World!";
  parts = builtins.filter (p: builtins.isString p) (builtins.split " " s);
  joined = builtins.concatStringsSep "-" parts;
in
  {
    inherit parts joined;
    length = builtins.stringLength s;
    upper = builtins.replaceStrings [ "a" "e" "i" "o" "u" ] [ "A" "E" "I" "O" "U" ] s;
  }
