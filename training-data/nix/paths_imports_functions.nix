let
  lib = {
    mapAttrsToList = f: attrs: map (n: f n attrs.${n}) (builtins.attrNames attrs);
    filterAttrs = pred: attrs: builtins.listToAttrs (map (n: { name = n; value = attrs.${n}; }) (builtins.filter (n: pred n attrs.${n}) (builtins.attrNames attrs)));
    optional = c: x: if c then [ x ] else [ ];
    optionalString = c: s: if c then s else "";
    unique = builtins.foldl' (acc: x: if builtins.elem x acc then acc else acc ++ [ x ]) [ ];
    hasSuffix = suf: s: let l = builtins.stringLength suf; sl = builtins.stringLength s; in sl >= l && builtins.substring (sl - l) l s == suf;
    concatStrings = builtins.concatStringsSep "";
  };
in {
  pairs = lib.mapAttrsToList (n: v: "${n}=${toString v}") { a = 1; b = 2; };
  big = lib.filterAttrs (n: v: v > 1) { a = 1; b = 2; c = 3; };
  opt = lib.optional true "x" ++ lib.optional false "y";
  str = lib.optionalString false "no" + lib.optionalString true "yes";
  uniq = lib.unique [ 1 2 1 3 2 ];
  suffix = lib.hasSuffix ".nix" "default.nix";
  p = ./relative/path;
  abs = /etc/hosts;
  base = baseNameOf "/a/b/c.txt";
  dir = dirOf "/a/b/c.txt";
}
