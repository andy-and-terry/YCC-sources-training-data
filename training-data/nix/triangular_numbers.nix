let
  lib = (import <nixpkgs> { }).lib;
  triangular = count: map (n: n * (n + 1) / 2) (lib.range 1 count);
in
triangular 10
