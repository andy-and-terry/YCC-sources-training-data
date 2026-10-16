let
  mapi = f: xs: builtins.genList (i: f i (builtins.elemAt xs i)) (builtins.length xs);
in
mapi (i: x: "${toString i}:${x}") [ "a" "b" "c" ]
