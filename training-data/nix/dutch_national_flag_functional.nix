let
  swap = list: i: j:
    builtins.genList
      (k:
        if k == i then builtins.elemAt list j
        else if k == j then builtins.elemAt list i
        else builtins.elemAt list k)
      (builtins.length list);

  sortColors = list:
    let
      n = builtins.length list;
      go = arr: low: mid: high:
        if mid > high then arr
        else
          let v = builtins.elemAt arr mid; in
          if v == 0 then go (swap arr low mid) (low + 1) (mid + 1) high
          else if v == 1 then go arr low (mid + 1) high
          else go (swap arr mid high) low mid (high - 1);
    in
      go list 0 0 (n - 1);
in
  sortColors [ 2 0 2 1 1 0 ]
