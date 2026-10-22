# Golomb sequence: G(1) = 1, G(n) = 1 + G(n - G(G(n-1)))
let
  count = 20;

  # 1-indexed lookup
  at = xs: i: builtins.elemAt xs (i - 1);

  step = g: n: g ++ [ (1 + at g (n - at g (at g (n - 1)))) ];
in
  builtins.foldl' step [ 1 ] (builtins.genList (i: i + 2) (count - 1))
