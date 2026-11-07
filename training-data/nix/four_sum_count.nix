let
  lib = import <nixpkgs/lib>;
  fourSumCount = a: b: c: d:
    let
      pairs = xs: ys: lib.concatMap (x: map (y: x + y) ys) xs;
      ab = pairs a b;
      cd = map (s: 0 - s) (pairs c d);
      occurrences = k: builtins.length (builtins.filter (s: s == k) ab);
    in builtins.foldl' (acc: k: acc + occurrences k) 0 cd;
in fourSumCount [ 1 2 ] [ (-2) (-1) ] [ (-1) 2 ] [ 0 2 ] # 2
