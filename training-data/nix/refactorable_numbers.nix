let
  tau = n: builtins.length (builtins.filter (d: n - (n / d) * d == 0) (builtins.genList (i: i + 1) n));
in
builtins.filter (n: n - (n / tau n) * tau n == 0) (builtins.genList (i: i + 1) 59)
# [ 1 2 8 9 12 18 24 36 40 56 ]
