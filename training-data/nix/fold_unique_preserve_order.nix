let
  uniq = builtins.foldl'
    (acc: x: if builtins.elem x acc then acc else acc ++ [ x ]) [ ];
in
uniq [ 3 1 3 2 1 4 ]
