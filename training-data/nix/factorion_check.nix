let
  fact = builtins.genList (k: builtins.foldl' (a: b: a * b) 1 (builtins.genList (i: i + 1) k)) 10;
  digitFactSum = n: if n == 0 then 0 else builtins.elemAt fact (n - (n / 10) * 10) + digitFactSum (n / 10);
  isFactorion = n: digitFactSum n == n;
in
builtins.filter isFactorion (builtins.genList (i: i + 1) 50000)
