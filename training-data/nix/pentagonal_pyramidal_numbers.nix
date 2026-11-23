# n^2(n+1)/2
# Evaluate with: nix-instantiate --eval --strict pentagonal_pyramidal_numbers.nix
let
  term = n: builtins.div ((n * n) * (n + 1)) 2;
in
  builtins.genList (i: term (i + 1)) 15
