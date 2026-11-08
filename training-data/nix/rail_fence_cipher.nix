let
  lib = (import <nixpkgs> { }).lib;
  s = "WEAREDISCOVERED";
  chars = lib.stringToCharacters s;
  rails = 3;
  period = 2 * (rails - 1);
  rail = i: let m = lib.mod i period; in if m < rails then m else period - m;
  indexed = lib.imap0 (i: c: { r = rail i; inherit i c; }) chars;
  rows = map (r: lib.concatMapStrings (e: e.c) (builtins.filter (e: e.r == r) indexed)) (lib.range 0 (rails - 1));
in
lib.concatStrings rows
