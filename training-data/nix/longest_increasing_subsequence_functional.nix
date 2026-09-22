let
  arr = [ 10 9 2 5 3 7 101 18 ];
  n = builtins.length arr;

  # dp.(i) = length of the longest increasing subsequence ending at i.
  # Self-referential like memoized_fibonacci_attrset.nix: each entry
  # only ever looks at strictly smaller indices, so laziness resolves
  # the dependency order for us.
  lengthAt = i:
    let
      earlier = builtins.genList (k: k) i;
      candidates = builtins.filter
        (j: builtins.elemAt arr j < builtins.elemAt arr i)
        earlier;
      best = builtins.foldl'
        (acc: j: let l = builtins.elemAt dp j; in if l > acc then l else acc)
        0
        candidates;
    in
      best + 1;

  dp = builtins.genList lengthAt n;

  longest = builtins.foldl' (acc: l: if l > acc then l else acc) 0 dp;
in
  {
    lengths = dp;
    longest = longest;
  }
