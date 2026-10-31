let
  primeFactorCount = n:
    let
      go = n: p: count:
        if p * p > n then (if n > 1 then count + 1 else count)
        else if n - (n / p) * p == 0 then go (n / p) p (count + 1)
        else go n (p + 1) count;
    in go n 2 0;
in
builtins.filter (n: primeFactorCount n == 2) (builtins.genList (i: i + 2) 28)
