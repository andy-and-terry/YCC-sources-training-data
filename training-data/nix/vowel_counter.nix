let
  lib = (import <nixpkgs> { }).lib;
  chars = lib.stringToCharacters (lib.toLower "Education is beautiful");
  countOf = v: lib.length (builtins.filter (c: c == v) chars);
in
lib.genAttrs [ "a" "e" "i" "o" "u" ] countOf
