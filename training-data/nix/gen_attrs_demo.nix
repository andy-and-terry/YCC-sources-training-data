let
  names = [ "web" "db" "cache" ];
  ports = { web = 80; db = 5432; cache = 6379; };
in
{
  services = builtins.listToAttrs (map (n: {
    name = n;
    value = { port = ports.${n}; url = "http://${n}:${toString ports.${n}}"; };
  }) names);
  dynamicKey = { "${builtins.head names}-primary" = true; };
}
