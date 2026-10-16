let
  intersperse = sep: xs:
    if xs == [ ] then [ ]
    else builtins.foldl' (acc: x: acc ++ [ sep x ]) [ (builtins.head xs) ] (builtins.tail xs);
in
{
  list = intersperse 0 [ 1 2 3 4 ];
  joined = builtins.concatStringsSep ", " [ "x" "y" "z" ];
  viaInter = builtins.concatStringsSep "" (intersperse "-" [ "a" "b" "c" ]);
}
