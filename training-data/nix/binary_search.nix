let
  sorted = [ 1 3 5 7 9 11 13 ];

  search = target:
    let
      go = low: high:
        if low > high then -1
        else
          let
            mid = (low + high) / 2;
            val = builtins.elemAt sorted mid;
          in
            if val == target then mid
            else if val < target then go (mid + 1) high
            else go low (mid - 1);
    in
      go 0 (builtins.length sorted - 1);
in
  { found = search 7; missing = search 4; }
