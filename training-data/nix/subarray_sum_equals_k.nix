# Count contiguous subarrays whose sum equals k (running sums from each start).
let
  lib = (import <nixpkgs> { }).lib;
  countSubarrays = nums: k:
    let
      n = builtins.length nums;
      sumRange = i: j: builtins.foldl' (a: x: a + x) 0 (lib.sublist i (j - i + 1) nums);
      hits = lib.concatMap
        (i: builtins.filter (j: sumRange i j == k) (lib.range i (n - 1)))
        (lib.range 0 (n - 1));
    in builtins.length hits;
in
countSubarrays [ 1 1 1 ] 2
