# Highest value reached by the Collatz (hailstone) sequence from n.
let
  lib = (import <nixpkgs> { }).lib;
  step = n: if lib.mod n 2 == 0 then n / 2 else 3 * n + 1;
  peak = n: best:
    if n == 1 then best
    else let next = step n; in peak next (lib.max best next);
in
peak 27 27
