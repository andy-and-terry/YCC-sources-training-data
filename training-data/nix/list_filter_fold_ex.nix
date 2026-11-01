let
  lib = (import <nixpkgs> { }).lib;
  xs = [ 1 2 3 4 5 6 ];
in {
  evens = builtins.filter (x: lib.mod x 2 == 0) xs;
  total = builtins.foldl' (a: b: a + b) 0 xs;
  rev = lib.reverseList xs;
  any = builtins.any (x: x > 5) xs;
}
