builtins.foldl' (acc: x: acc // { ${x} = builtins.stringLength x; }) { } [ "a" "bb" "ccc" ]
