let
  lib = (import <nixpkgs> { }).lib;
  isPrime = n: n > 1 && lib.all (d: lib.mod n d != 0) (lib.range 2 (n - 1) |> builtins.filter (d: d * d <= n));
  countPrimesBelow = n: lib.length (builtins.filter isPrime (lib.range 2 (n - 1)));
in
countPrimesBelow 100
