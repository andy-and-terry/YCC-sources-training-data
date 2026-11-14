let
  nums = builtins.genList (i: i + 1) 5;
in
builtins.foldl' (a: b: a + b) 0 nums
