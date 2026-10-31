let
  primeFactors = n:
    let
      go = n: p: acc:
        if n == 1 then acc
        else if p * p > n then acc ++ [ n ]
        else if n - (n / p) * p == 0 then go (n / p) p (acc ++ [ p ])
        else go n (p + 1) acc;
    in go n 2 [ ];
  isSphenic = n:
    let fs = primeFactors n;
    in builtins.length fs == 3 && builtins.length (builtins.attrNames (builtins.listToAttrs (map (f: { name = toString f; value = true; }) fs))) == 3;
in
builtins.filter isSphenic (builtins.genList (i: i + 2) 78)
