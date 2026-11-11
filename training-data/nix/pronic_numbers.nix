# Pronic numbers n(n+1)
let
  term = n: n * (n + 1);
in
builtins.genList term 10
