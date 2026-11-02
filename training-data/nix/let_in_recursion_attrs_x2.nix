let
  fact = n: if n <= 1 then 1 else n * fact (n - 1);
  nums = builtins.genList (i: i + 1) 5;
in
  builtins.map fact nums
