let
  lib = import <nixpkgs/lib>;
  minimumTotal = triangle:
    let
      rows = lib.reverseList triangle;
      step = below: row:
        lib.imap0 (i: v:
          let l = builtins.elemAt below i; r = builtins.elemAt below (i + 1);
          in v + (if l < r then l else r)) row;
    in builtins.head (builtins.foldl' step (builtins.head rows) (builtins.tail rows));
in minimumTotal [ [ 2 ] [ 3 4 ] [ 6 5 7 ] [ 4 1 8 3 ] ] # 11
