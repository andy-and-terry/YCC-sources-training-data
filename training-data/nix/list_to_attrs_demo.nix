let
  words = [ "apple" "banana" "cherry" ];
  lengths = builtins.listToAttrs (map (w: { name = w; value = builtins.stringLength w; }) words);
  indexed = builtins.listToAttrs (
    builtins.genList (i: { name = builtins.elemAt words i; value = i; }) (builtins.length words));
in
{ inherit lengths indexed; }
