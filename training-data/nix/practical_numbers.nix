# Practical numbers: every m in 1..n is a sum of distinct divisors of n.
# reach is a boolean list: reach[i] <=> i is a subset sum of the divisors so far.
let
  isPractical = n:
    let
      step = reach: d:
        if n - (n / d) * d == 0
        then builtins.genList (i: builtins.elemAt reach i || (i >= d && builtins.elemAt reach (i - d))) (n + 1)
        else reach;
      start = builtins.genList (i: i == 0) (n + 1);
      final = builtins.foldl' step start (builtins.genList (i: i + 1) n);
    in builtins.all (x: x) final;
in
builtins.concatStringsSep " " (map toString (builtins.filter isPractical (builtins.genList (i: i + 1) 40)))
