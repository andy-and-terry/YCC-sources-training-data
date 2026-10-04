let
  lib = {
    hasPrefix = p: s: builtins.substring 0 (builtins.stringLength p) s == p;
    hasSuffix = suf: s:
      let ls = builtins.stringLength s; lx = builtins.stringLength suf;
      in ls >= lx && builtins.substring (ls - lx) lx s == suf;
    hasInfix = needle: s: builtins.match ".*${needle}.*" s != null;
  };
in
{
  prefix = lib.hasPrefix "foo" "foobar";
  suffix = lib.hasSuffix ".nix" "default.nix";
  infix = lib.hasInfix "oba" "foobar";
  none = lib.hasInfix "zzz" "foobar";
}
