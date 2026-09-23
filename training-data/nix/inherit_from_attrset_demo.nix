let
  config = {
    host = "localhost";
    port = 8080;
    protocol = "https";
    unused = "ignore me";
  };
in
  let
    # `inherit (config) host port;` pulls just those attributes out of
    # `config` and binds them as plain names, equivalent to writing
    # `host = config.host; port = config.port;`.
    inherit (config) host port;
  in
    {
      inherit host port;
      url = "${config.protocol}://${host}:${toString port}";

      # `inherit` also works directly inside an attrset literal to copy
      # names from the surrounding scope into it.
      summary = { inherit host port; };
    }
