let
  lib = (import <nixpkgs> { }).lib;
  isPerfectSquare = n: n >= 0 && lib.any (r: r * r == n) (lib.range 0 n);
in
builtins.filter isPerfectSquare (lib.range 0 29)
