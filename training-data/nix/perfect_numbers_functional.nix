let
  divisorSum = n: builtins.foldl' (a: d: if n - (n / d) * d == 0 then a + d else a) 0
    (builtins.genList (i: i + 1) (n - 1));
  isPerfect = n: n > 1 && divisorSum n == n;
in
builtins.filter isPerfect (builtins.genList (i: i + 1) 500)
