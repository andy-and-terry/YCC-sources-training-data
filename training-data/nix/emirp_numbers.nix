# Emirps: primes whose digit reversal is a different prime.
let
  lib = (import <nixpkgs> { }).lib;
  isPrime = n: n >= 2 && builtins.all (i: lib.mod n i != 0) (lib.range 2 (n - 1));
  reverseDigits = n:
    lib.toInt (lib.concatStrings (lib.reverseList (lib.stringToCharacters (toString n))));
in
builtins.filter
  (n: let r = reverseDigits n; in r != n && isPrime n && isPrime r)
  (lib.range 2 99)
