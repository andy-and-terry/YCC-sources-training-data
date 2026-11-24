# Fibbinary numbers: no two adjacent 1 bits.
let
  range = lo: hi: builtins.genList (i: lo + i) (hi - lo + 1);
in
builtins.filter (n: builtins.bitAnd n (n / 2) == 0) (range 0 49)
