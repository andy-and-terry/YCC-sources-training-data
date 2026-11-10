let
  pieces = cuts: (cuts * cuts + cuts + 2) / 2;
in
builtins.genList pieces 10
# [ 1 2 4 7 11 16 22 29 37 46 ]
