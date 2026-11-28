let
  lib = (import <nixpkgs> { }).lib;
  isPrime = n:
    n >= 2 && builtins.all (i: lib.mod n i != 0) (builtins.genList (i: i + 2) (n - 2));
  cuban = y: 3 * y * y + 3 * y + 1;
in
  builtins.filter isPrime (map cuban (lib.range 1 12))
