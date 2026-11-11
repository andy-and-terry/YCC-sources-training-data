# Fermat primality test; Carmichael number 561 fools it.
let
  lib = (import <nixpkgs> { }).lib;
  powmod = b: e: m:
    if e == 0 then lib.mod 1 m
    else
      let
        half = powmod b (e / 2) m;
        sq = lib.mod (half * half) m;
      in if lib.mod e 2 == 0 then sq else lib.mod (sq * b) m;
  probablyPrime = n: n > 2 && powmod 2 (n - 1) n == 1;
in
map (n: { inherit n; prime = probablyPrime n; }) [ 97 91 561 ]
