let
  path = "/usr/local/lib/libfoo.so";
in
  {
    base = baseNameOf path;
    dir = dirOf path;
    isString = builtins.isString path;
    isBool = builtins.isBool (1 < 2);
    nullCheck = builtins.isNull null;
  }
