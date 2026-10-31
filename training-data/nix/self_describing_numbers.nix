let
  digits = s: builtins.genList (i: builtins.fromJSON (builtins.substring i 1 s)) (builtins.stringLength s);
  isSelfDescribing = s:
    let ds = digits s;
    in builtins.all (i: builtins.length (builtins.filter (d: d == i) ds) == builtins.elemAt ds i)
         (builtins.genList (i: i) (builtins.length ds));
in
builtins.map isSelfDescribing [ "1210" "2020" "21200" "1211" ]
