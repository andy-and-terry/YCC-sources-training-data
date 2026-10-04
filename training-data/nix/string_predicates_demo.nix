let
  hasPrefix = p: s: builtins.substring 0 (builtins.stringLength p) s == p;
  hasSuffix = suf: s:
    let ls = builtins.stringLength s; lsuf = builtins.stringLength suf;
    in ls >= lsuf && builtins.substring (ls - lsuf) lsuf s == suf;
  contains = sub: s: builtins.match ".*${sub}.*" s != null;
  files = [ "main.c" "util.h" "readme.md" "test.c" ];
in
{
  cFiles = builtins.filter (hasSuffix ".c") files;
  notC = builtins.filter (f: !(hasSuffix ".c" f)) files;
  withT = builtins.filter (contains "t") files;
  startsWithR = builtins.filter (hasPrefix "r") files;
  upperCase = builtins.replaceStrings [ "a" "b" ] [ "A" "B" ] "abcab";
}
