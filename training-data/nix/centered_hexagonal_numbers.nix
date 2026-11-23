# 3n(n-1)+1
# Evaluate with: nix-instantiate --eval --strict centered_hexagonal_numbers.nix
let
  term = n: ((3 * n) * (n - 1)) + 1;
in
  builtins.genList (i: term (i + 1)) 15
