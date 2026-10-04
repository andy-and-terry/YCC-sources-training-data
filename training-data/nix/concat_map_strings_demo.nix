let
  items = [ "a" "b" "c" ];
  joined = builtins.concatStringsSep ", " items;
  lines = builtins.concatStringsSep "\n" (map (i: "- ${i}") items);
  expanded = builtins.concatMap (x: [ x x ]) items;
  upperFirst = s: (builtins.substring 0 1 s) + builtins.substring 1 (-1) s;
in
{ inherit joined lines expanded; }
