let
  config = {
    server = {
      host = "localhost";
      ports = { http = 8080; https = 8443; };
    };
    debug = false;
  };

  # walk a list of keys down into nested attrsets
  getPath = path: default: set:
    let
      step = acc: key:
        if acc.found && builtins.isAttrs acc.value && acc.value ? ${key}
        then { found = true; value = acc.value.${key}; }
        else { found = false; value = null; };
      result = builtins.foldl' step { found = true; value = set; } path;
    in
    if result.found then result.value else default;

  hasPath = path: set:
    let
      go = s: keys:
        if keys == [ ] then true
        else
          let k = builtins.head keys; in
          builtins.isAttrs s && s ? ${k} && go s.${k} (builtins.tail keys);
    in
    go set path;
in
{
  https = getPath [ "server" "ports" "https" ] 0 config;
  missing = getPath [ "server" "tls" "cert" ] "none" config;
  throughScalar = getPath [ "debug" "level" ] "n/a" config;
  hasHost = hasPath [ "server" "host" ] config;
  hasUser = hasPath [ "server" "user" ] config;
}
