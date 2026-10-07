{
  csv = builtins.concatStringsSep "," (map toString [ 1 2 3 ]);
  lines = builtins.concatStringsSep "\n" [ "a" "b" ];
  flat = builtins.concatMap (x: [ x x ]) [ 1 2 3 ];
  joined = builtins.concatLists [ [ 1 ] [ 2 3 ] [ ] ];
  glued = builtins.concatStringsSep "" [ "x" "y" ];
}
