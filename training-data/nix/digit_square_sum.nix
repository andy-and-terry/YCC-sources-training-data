let
  lib = (import <nixpkgs> { }).lib;
  digitSquareSum = n:
    let
      m = if n < 0 then -n else n;
      digits = map lib.toInt (lib.stringToCharacters (toString m));
    in
    lib.foldl' (acc: d: acc + d * d) 0 digits;
in
[ (digitSquareSum 123) (digitSquareSum (-99)) ]
