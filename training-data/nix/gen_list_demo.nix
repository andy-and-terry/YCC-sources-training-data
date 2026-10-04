let
  squares = builtins.genList (i: i * i) 6;
  identity3 = builtins.genList (r: builtins.genList (c: if r == c then 1 else 0) 3) 3;
in
{ inherit squares identity3; }
