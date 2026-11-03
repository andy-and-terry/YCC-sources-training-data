let
  lib = (import <nixpkgs> { }).lib;
  items = [ 1 2 2 3 3 4 ];
  counts = lib.foldl' (acc: x:
    let k = toString x; in acc // { ${k} = (acc.${k} or 0) + 1; }) { } items;
  top = lib.foldl' lib.max 0 (builtins.attrValues counts);
in
builtins.filter (k: counts.${k} == top) (builtins.attrNames counts)
