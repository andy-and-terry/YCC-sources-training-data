let
  last = xs: builtins.elemAt xs (builtins.length xs - 1);
  init = xs: builtins.genList (i: builtins.elemAt xs i) (builtins.length xs - 1);
in
{ last = last [ 1 2 3 ]; init = init [ 1 2 3 ]; }
