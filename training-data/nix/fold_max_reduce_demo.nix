let
  # Reduce a list to its maximum / minimum using foldl' with the first
  # element as the seed, since Nix has no built-in max for lists.
  maxOf = xs: builtins.foldl' (a: b: if b > a then b else a) (builtins.head xs) xs;
  minOf = xs: builtins.foldl' (a: b: if b < a then b else a) (builtins.head xs) xs;

  # Track several accumulators at once by folding into an attrset.
  stats = xs: builtins.foldl'
    (acc: x: {
      sum = acc.sum + x;
      count = acc.count + 1;
      max = if x > acc.max then x else acc.max;
    })
    { sum = 0; count = 0; max = builtins.head xs; }
    xs;

  nums = [ 4 17 9 2 23 11 ];
in
  {
    max = maxOf nums;
    min = minOf nums;
    stats = stats nums;
    longest = maxOf (map builtins.stringLength [ "a" "abcd" "ab" ]);
  }
