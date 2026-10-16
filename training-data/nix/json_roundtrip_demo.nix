let
  data = { name = "pkg"; deps = [ "a" "b" ]; opts = { debug = false; level = 3; }; nothing = null; };
  json = builtins.toJSON data;
  back = builtins.fromJSON json;
in
{ inherit json; same = back == data; level = back.opts.level; }
