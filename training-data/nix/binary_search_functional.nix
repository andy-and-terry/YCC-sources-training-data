let
  binarySearch = arr: target:
    let
      go = low: high:
        if low > high then -1
        else
          let
            mid = (low + high) / 2;
            midVal = builtins.elemAt arr mid;
          in
            if midVal == target then mid
            else if midVal < target then go (mid + 1) high
            else go low (mid - 1);
    in
      go 0 (builtins.length arr - 1);

  data = [ 1 3 5 7 9 11 ];
in
  binarySearch data 7
