# Unsigned Lah numbers L(n, k) = C(n-1, k-1) * n! / k!  (row n = 5).
let
  fact = n: if n <= 1 then 1 else n * fact (n - 1);
  comb = n: k: fact n / (fact k * fact (n - k));
  n = 5;
in
builtins.concatStringsSep " " (map (k: toString (comb (n - 1) (k - 1) * fact n / fact k))
  (builtins.genList (i: i + 1) n))
