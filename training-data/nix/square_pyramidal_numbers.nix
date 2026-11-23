# n(n+1)(2n+1)/6
# Evaluate with: nix-instantiate --eval --strict square_pyramidal_numbers.nix
let
  term = n: builtins.div ((n * (n + 1)) * ((2 * n) + 1)) 6;
in
  builtins.genList (i: term (i + 1)) 15
