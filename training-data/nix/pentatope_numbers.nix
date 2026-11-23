# n(n+1)(n+2)(n+3)/24
# Evaluate with: nix-instantiate --eval --strict pentatope_numbers.nix
let
  term = n: builtins.div (((n * (n + 1)) * (n + 2)) * (n + 3)) 24;
in
  builtins.genList (i: term (i + 1)) 15
