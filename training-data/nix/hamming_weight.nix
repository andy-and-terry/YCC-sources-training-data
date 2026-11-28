# Population count by repeated halving
let
  popcount = n: if n == 0 then 0 else (builtins.bitAnd n 1) + popcount (n / 2);
in
popcount 183
