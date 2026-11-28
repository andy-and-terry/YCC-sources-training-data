let
  name = "world";
  list = [ "a" "b" "c" ];
in {
  greeting = "hello ${name}";
  joined = builtins.concatStringsSep "-" list;
  multi = ''
    line one
    ${toString (builtins.length list)} items
  '';
}
