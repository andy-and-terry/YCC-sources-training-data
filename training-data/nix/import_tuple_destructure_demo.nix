let
  # function with an attrset pattern, defaults, and ellipsis capturing the rest
  describe = { name, version ? "0.1", ... }@args:
    "${name}-${version} (${toString (builtins.length (builtins.attrNames args))} attrs)";

  # nested destructuring through let bindings
  config = { server = { host = "localhost"; port = 80; }; debug = true; };
  inherit (config.server) host port;
  inherit (config) debug;
in
{
  a = describe { name = "foo"; };
  b = describe { name = "bar"; version = "2.0"; extra = true; };
  endpoint = "${host}:${toString port}";
  inherit debug;
}
