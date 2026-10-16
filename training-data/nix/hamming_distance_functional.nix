let
  hamming = a: b:
    assert builtins.stringLength a == builtins.stringLength b;
    builtins.length (builtins.filter (i: builtins.substring i 1 a != builtins.substring i 1 b)
      (builtins.genList (i: i) (builtins.stringLength a)));
in
{ d1 = hamming "karolin" "kathrin"; d2 = hamming "1011101" "1001001"; }
