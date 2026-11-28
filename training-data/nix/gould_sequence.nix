let
  popcount = n: if n == 0 then 0 else (n - (n / 2) * 2) + popcount (n / 2);
  pow2 = k: if k == 0 then 1 else 2 * pow2 (k - 1);
in
  builtins.genList (n: pow2 (popcount n)) 16
