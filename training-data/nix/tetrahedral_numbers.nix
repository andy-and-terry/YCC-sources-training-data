# Tetrahedral numbers n(n+1)(n+2)/6
let
  term = n: ((n * (n + 1)) * (n + 2))/6;
in
builtins.genList term 10
