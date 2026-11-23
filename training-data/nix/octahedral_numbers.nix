# n(2n^2+1)/3
# Evaluate with: nix-instantiate --eval --strict octahedral_numbers.nix
let
  term = n: builtins.div (n * (((2 * n) * n) + 1)) 3;
in
  builtins.genList (i: term (i + 1)) 15
