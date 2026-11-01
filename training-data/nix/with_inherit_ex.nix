let
  cfg = { host = "localhost"; port = 8080; };
  inherit (cfg) host port;
in with builtins; {
  url = "http://${host}:${toString port}/";
  keys = attrNames cfg;
}
