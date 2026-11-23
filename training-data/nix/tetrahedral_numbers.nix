# n(n+1)(n+2)/6
# Evaluate with: nix-instantiate --eval --strict tetrahedral_numbers.nix
let
  term = n: builtins.div ((n * (n + 1)) * (n + 2)) 6;
in
  builtins.genList (i: term (i + 1)) 15
