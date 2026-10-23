let
  config = { host = "localhost"; port = 8080; debug = false; };
  keys = [ "host" "port" ];
  picked = builtins.listToAttrs (map (k: { name = k; value = builtins.getAttr k config; }) keys);
  key = "debug";
  dynamic = { ${key} = true; "${key}_level" = 3; };
in
  {
    inherit picked dynamic;
    viaGetAttr = builtins.getAttr "port" config;
    viaSelect = config.${"host"};
    missing = config.timeout or 30;
    hasPort = config ? port;
  }
