let
  name = "Ada";
  n = 3;
in {
  interp = "Hello ${name}, ${toString n} items";
  multi = ''
    line one
      indented ${name}
    ''${escaped}
  '';
  upper = builtins.replaceStrings [ "a" "b" ] [ "A" "B" ] "abcab";
  split = builtins.split "," "a,b,c";
  concat = builtins.concatStringsSep "-" [ "x" "y" "z" ];
  sub = builtins.substring 1 3 "hello";
  len = builtins.stringLength "hello";
  match = builtins.match "([a-z]+)([0-9]+)" "abc123";
  noMatch = builtins.match "[0-9]+" "abc";
  path = toString ./.;
  hasPrefix = builtins.substring 0 2 "hello" == "he";
  num = builtins.fromJSON "42";
  json = builtins.toJSON { a = [ 1 2 ]; b = null; };
  version = builtins.compareVersions "1.2.3" "1.10.0";
  parse = builtins.tryEval (builtins.throw "never");
}
