# Centered square numbers 2n(n+1)+1
let
  term = n: ((2 * n) * (n + 1)) + 1;
in
builtins.genList term 10
