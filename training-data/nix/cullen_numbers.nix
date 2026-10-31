let
  pow2 = n: if n == 0 then 1 else 2 * pow2 (n - 1);
  cullen = n: n * pow2 n + 1;
in
builtins.map cullen [ 1 2 3 4 5 ]
