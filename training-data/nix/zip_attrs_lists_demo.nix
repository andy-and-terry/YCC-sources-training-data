let
  names = [ "a" "b" "c" ];
  values = [ 1 2 3 ];
  zipped = builtins.listToAttrs (
    builtins.genList (i: {
      name = builtins.elemAt names i;
      value = builtins.elemAt values i;
    }) (builtins.length names)
  );
in
zipped
