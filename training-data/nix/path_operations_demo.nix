let
  p = /usr/local/lib/libfoo.so.1;
in
{
  base = baseNameOf p;
  dir = dirOf p;
  isPath = builtins.isPath p;
  joined = /etc + "/nixos/configuration.nix";
  asString = toString p;
  extension = builtins.elemAt (builtins.match ".*\\.(so)\\..*" (baseNameOf p)) 0;
  hasPrefix = builtins.substring 0 4 (toString p) == "/usr";
}
