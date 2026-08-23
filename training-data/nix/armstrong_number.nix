let
  digits = n: if n < 10 then [ n ] else digits (n / 10) ++ [ (n - (n / 10) * 10) ];

  pow = base: exp: if exp == 0 then 1 else base * pow base (exp - 1);

  isArmstrong = n:
    let
      ds = digits n;
      power = builtins.length ds;
      total = builtins.foldl' (acc: d: acc + pow d power) 0 ds;
    in
      total == n;
in
  {
    r153 = isArmstrong 153;
    r154 = isArmstrong 154;
  }
