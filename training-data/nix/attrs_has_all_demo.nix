let
  required = [ "name" "version" "src" ];
  hasAll = keys: set: builtins.all (k: builtins.hasAttr k set) keys;
  missing = keys: set: builtins.filter (k: !(builtins.hasAttr k set)) keys;
  pkg = { name = "hello"; version = "2.12"; };
in
{ ok = hasAll required pkg; missing = missing required pkg; }
