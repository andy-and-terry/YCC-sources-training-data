# Perrin sequence P(n)=P(n-2)+P(n-3)
let
  extend = acc:
    let n = builtins.length acc; in
    acc ++ [ (builtins.elemAt acc (n - 2) + builtins.elemAt acc (n - 3)) ];
in
builtins.foldl' (acc: _: extend acc) [ 3 0 2 ] (builtins.genList (i: i) 7)
