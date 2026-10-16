let
  hasPrefix = p: s: builtins.substring 0 (builtins.stringLength p) s == p;
  hasSuffix = x: s:
    let lx = builtins.stringLength x; ls = builtins.stringLength s;
    in ls >= lx && builtins.substring (ls - lx) lx s == x;
  removePrefix = p: s: if hasPrefix p s then builtins.substring (builtins.stringLength p) (-1) s else s;
in
{
  a = hasPrefix "lib" "libfoo.so";
  b = hasSuffix ".so" "libfoo.so";
  c = removePrefix "lib" "libfoo.so";
}
