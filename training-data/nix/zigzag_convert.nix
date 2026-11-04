let
  lib = (import <nixpkgs> { }).lib;
  chars = s: lib.stringToCharacters s;
  zigzag = s: rows:
    let
      cs = chars s;
      n = builtins.length cs;
      period = 2 * (rows - 1);
      rowOf = i: let k = lib.mod i period; in if k < rows then k else period - k;
      indexed = lib.imap0 (i: c: { row = rowOf i; inherit c; }) cs;
    in
    if rows == 1 || rows >= n then s
    else lib.concatStrings (map (r: lib.concatStrings (map (x: x.c) (builtins.filter (x: x.row == r) indexed))) (lib.range 0 (rows - 1)));
in
zigzag "PAYPALISHIRING" 3
