let
  lib = (import <nixpkgs> { }).lib;
  isPrime = n:
    n >= 2 && builtins.all (i: lib.mod n i != 0) (builtins.genList (i: i + 2) (n - 2));
  rev = n: lib.toInt (lib.concatStrings (lib.reverseList (lib.stringToCharacters (toString n))));
in
  builtins.filter (p: isPrime p && rev p != p && isPrime (rev p)) (lib.range 2 99)
