let
  equilibriumIndex = nums:
    let
      total = builtins.foldl' (a: b: a + b) 0 nums;
      go = i: left: rest:
        if rest == [ ] then -1
        else if left == total - left - builtins.head rest then i
        else go (i + 1) (left + builtins.head rest) (builtins.tail rest);
    in go 0 0 nums;
in equilibriumIndex [ 1 7 3 6 5 6 ] # 3
