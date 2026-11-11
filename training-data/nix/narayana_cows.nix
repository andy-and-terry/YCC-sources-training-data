# Narayana's cows N(n)=N(n-1)+N(n-3)
let
  extend = acc:
    let n = builtins.length acc; in
    acc ++ [ (builtins.elemAt acc (n - 1) + builtins.elemAt acc (n - 3)) ];
in
builtins.foldl' (acc: _: extend acc) [ 1 1 1 ] (builtins.genList (i: i) 7)
