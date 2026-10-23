# Evaluate with: nix-instantiate --eval --strict pell_numbers.nix
let
  # P(n) = 2*P(n-1) + P(n-2), with P(0) = 0 and P(1) = 1
  pell = n:
    let
      go = i: a: b: if i == n then [ ] else [ a ] ++ go (i + 1) b (2 * b + a);
    in
    go 0 0 1;
in
pell 15
