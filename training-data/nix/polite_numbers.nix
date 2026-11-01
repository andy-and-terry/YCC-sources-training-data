# Ways to write n as a sum of two or more consecutive positive integers.
let
  range = a: b: if a > b then [ ] else [ a ] ++ range (a + 1) b;
  mod = a: b: a - (a / b) * b;
  politeWays = n:
    builtins.length (builtins.filter
      (k: k * (k + 1) / 2 <= n && mod (n - k * (k - 1) / 2) k == 0)
      (range 2 n));
in
builtins.concatStringsSep " " (map (n: toString (politeWays n)) (range 1 16))
