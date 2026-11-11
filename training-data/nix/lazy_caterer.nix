# Lazy caterer sequence: max pieces from n cuts
let
  term = n: ((n * (n + 1))/2) + 1;
in
builtins.genList term 10
