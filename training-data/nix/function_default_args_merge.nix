let
  mk = { name, port ? 8080, debug ? false, ... }: {
    inherit name port debug;
    url = "http://${name}:${toString port}";
  };
in
  mk { name = "api"; debug = true; extra = 1; }
