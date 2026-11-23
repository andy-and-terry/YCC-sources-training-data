# 6n(n-1)+1
# Evaluate with: nix-instantiate --eval --strict star_numbers.nix
let
  term = n: ((6 * n) * (n - 1)) + 1;
in
  builtins.genList (i: term (i + 1)) 15
