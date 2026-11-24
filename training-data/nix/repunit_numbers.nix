# Repunits: R_n = 11...1 (n ones), built as R_{n-1}*10 + 1.
let
  repunit = n: if n == 0 then 0 else repunit (n - 1) * 10 + 1;
in
builtins.genList (i: repunit (i + 1)) 8
