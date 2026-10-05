let
  p = "/usr/local/lib/libfoo.so";
  base = baseNameOf p;
in
  {
    base = base;
    dir = dirOf p;
    stem = builtins.head (builtins.match "(.*)\\.so" base);
    hasPrefix = builtins.substring 0 4 p == "/usr";
    sub = builtins.substring 5 5 p;
    hash = builtins.hashString "sha256" "hello";
    parts = builtins.filter (s: builtins.isString s && s != "") (builtins.split "/" p);
  }
