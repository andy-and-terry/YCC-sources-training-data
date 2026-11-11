# Population count (number of set bits) for 0..15
let
  bits = n: if n == 0 then 0 else (n - (n / 2) * 2) + bits (n / 2);
in
builtins.genList bits 16
