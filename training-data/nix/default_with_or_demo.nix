let
  config = {
    server = { port = 8080; };
  };
in
{
  port = config.server.port or 80;
  host = config.server.host or "localhost";
  deep = config.database.credentials.user or "anonymous";
  # `or` also guards list-free attribute lookups with dynamic names
  dynamic = config.${"server"}.${"port"} or 0;
  # `?` tests for presence without evaluating the value
  hasPort = config ? server.port;
  hasDb = config ? database.url;
}
