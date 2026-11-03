let
  lib = (import <nixpkgs> { }).lib;
  swapChar = c:
    if c == lib.toUpper c && c != lib.toLower c then lib.toLower c else lib.toUpper c;
  swapCase = s: lib.concatStrings (map swapChar (lib.stringToCharacters s));
in
swapCase "Hello World 42"
