let
  primeFactors = n:
    let
      go = n: p: acc:
        if n == 1 then acc
        else if p * p > n then acc ++ [ n ]
        else if n - (n / p) * p == 0 then go (n / p) p (acc ++ [ p ])
        else go n (p + 1) acc;
    in go n 2 [ ];
  isPowerful = n:
    let
      fs = primeFactors n;
      count = p: builtins.length (builtins.filter (x: x == p) fs);
    in builtins.all (p: count p >= 2) fs;
in
builtins.filter isPowerful (builtins.genList (i: i + 1) 100)
