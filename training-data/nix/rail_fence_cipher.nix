let
  lib = (import <nixpkgs> { }).lib;
  rails = 3;
  period = 2 * (rails - 1);
  chars = lib.stringToCharacters "WEAREDISCOVERED";
  railOf = i: let m = lib.mod i period; in if m < rails then m else period - m;
  indexed = lib.imap0 (i: c: { r = railOf i; inherit i c; }) chars;
  sorted = lib.sort (a: b: a.r < b.r || (a.r == b.r && a.i < b.i)) indexed;
in
  lib.concatMapStrings (x: x.c) sorted
