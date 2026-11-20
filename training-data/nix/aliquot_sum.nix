# Aliquot sum classification.
let
  aliquot = n: builtins.foldl' builtins.add 0
    (builtins.filter (d: n - (n / d) * d == 0) (builtins.genList (i: i + 1) (n - 1)));
  kind = n: let a = aliquot n; in
    if a == n then "perfect" else if a > n then "abundant" else "deficient";
in
map (n: { inherit n; aliquot = aliquot n; kind = kind n; }) [ 6 12 15 28 ]
