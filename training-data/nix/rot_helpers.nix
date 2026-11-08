let
  lib = (import <nixpkgs> { }).lib;
  rot13 = s: lib.concatStrings (map (c: rotMap.${c} or c) (lib.stringToCharacters s));
  alpha = lib.stringToCharacters "abcdefghijklmnopqrstuvwxyz";
  rotMap = lib.listToAttrs (lib.imap0 (i: c: { name = c; value = builtins.elemAt alpha (lib.mod (i + 13) 26); }) alpha);
in
rot13 "hello"
