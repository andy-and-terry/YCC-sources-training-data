# Lattice paths via binomial recursion f(r, c) = f(r-1, c) + f(r, c-1).
let
  f = r: c: if r == 0 || c == 0 then 1 else f (r - 1) c + f r (c - 1);
in
f 3 3
