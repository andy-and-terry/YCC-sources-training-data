# Hofstadter Q sequence: Q(1) = Q(2) = 1, Q(n) = Q(n - Q(n-1)) + Q(n - Q(n-2))
let
  count = 20;

  # 1-indexed lookup
  at = xs: i: builtins.elemAt xs (i - 1);

  step = q: n: q ++ [ (at q (n - at q (n - 1)) + at q (n - at q (n - 2))) ];
in
  builtins.foldl' step [ 1 1 ] (builtins.genList (i: i + 3) (count - 2))
