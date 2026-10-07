let
  lib = {
    hasPrefix = pre: s: builtins.substring 0 (builtins.stringLength pre) s == pre;
    hasSuffix = suf: s:
      let n = builtins.stringLength s; m = builtins.stringLength suf;
      in n >= m && builtins.substring (n - m) m s == suf;
    contains = sub: s: builtins.match ".*${sub}.*" s != null;
  };
in
{
  prefix = lib.hasPrefix "nix" "nixpkgs";
  suffix = lib.hasSuffix ".nix" "default.nix";
  notSuffix = lib.hasSuffix ".py" "default.nix";
  has = lib.contains "pkg" "nixpkgs";
  upperish = builtins.replaceStrings [ "a" "b" ] [ "A" "B" ] "abcab";
}
