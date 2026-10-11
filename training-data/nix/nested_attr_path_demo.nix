let
  cfg = { server = { http = { port = 8080; host = "localhost"; }; }; };
  getPath = path: set:
    builtins.foldl' (acc: k: if acc ? ${k} then acc.${k} else null) set path;
in
{
  port = getPath [ "server" "http" "port" ] cfg;
  missing = getPath [ "server" "tls" "port" ] cfg;
  viaAttrByPath = cfg.server.http.host;
  hasPort = cfg ? server.http.port;
}
