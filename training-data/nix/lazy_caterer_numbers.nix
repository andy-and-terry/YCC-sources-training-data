# Lazy caterer's sequence: max pieces from n straight cuts, n(n+1)/2 + 1.
builtins.concatStringsSep " " (map (n: toString (n * (n + 1) / 2 + 1)) (builtins.genList (n: n) 10))
