# Bead (gravity) sort.
let
  count = p: l: builtins.length (builtins.filter p l);
  nums = [ 5 3 1 4 2 ];
  cols = builtins.genList (i: count (n: n >= i + 1) nums) 5;
in
builtins.genList (r: count (c: c >= 5 - r) cols) 5
