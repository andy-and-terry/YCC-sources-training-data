let
  lib = import <nixpkgs/lib>;
  addBinary = a: b:
    let
      toInt = s: builtins.foldl' (acc: c: acc * 2 + lib.toInt c) 0 (lib.stringToCharacters s);
      toBin = n: if n < 2 then toString n else toBin (n / 2) + toString (n - (n / 2) * 2);
    in toBin (toInt a + toInt b);
in addBinary "1010" "1011" # "10101"
