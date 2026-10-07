let
  p = "/home/user/projects/app/main.rs";
in
{
  dir = builtins.dirOf p;
  base = baseNameOf p;
  stem = builtins.head (builtins.match "(.*)\\.[^.]*" (baseNameOf p));
  ext = builtins.head (builtins.match ".*\\.([^.]*)" p);
  parts = builtins.filter (s: s != "" && builtins.isString s) (builtins.split "/" p);
  joined = "${builtins.dirOf p}/lib.rs";
  isAbs = builtins.substring 0 1 p == "/";
}
