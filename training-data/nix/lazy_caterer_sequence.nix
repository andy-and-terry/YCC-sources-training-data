# n(n+1)/2+1
# Evaluate with: nix-instantiate --eval --strict lazy_caterer_sequence.nix
let
  term = n: (builtins.div (n * (n + 1)) 2) + 1;
in
  builtins.genList (i: term (i + 1)) 15
