let
  lib = (import <nixpkgs> { }).lib;
  values = [ 3 1 4 1 5 9 2 6 ];
  prefix = [ 0 ] ++ (lib.foldl' (acc: v: acc ++ [ ((lib.last acc) + v) ]) [ 0 ] values |> builtins.tail);
  query = lo: hi: (builtins.elemAt prefix hi) - (builtins.elemAt prefix lo);
in
query 2 5
