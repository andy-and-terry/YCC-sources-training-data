let
  config = builtins.fromTOML ''
    title = "demo"

    [server]
    host = "localhost"
    port = 8080
    tags = ["a", "b"]
  '';
in
  {
    title = config.title;
    port = config.server.port;
    tagCount = builtins.length config.server.tags;
  }
