# Stern's diatomic sequence: s(0) = 0, s(1) = 1, s(2n) = s(n), s(2n+1) = s(n) + s(n+1)
let
  count = 20;

  step = acc: n:
    let
      h = n / 2;
      term =
        if n - h * 2 == 0
        then builtins.elemAt acc h
        else builtins.elemAt acc h + builtins.elemAt acc (h + 1);
    in
      acc ++ [ term ];
in
  builtins.foldl' step [ 0 1 ] (builtins.genList (i: i + 2) (count - 2))
