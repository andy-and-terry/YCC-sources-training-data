let
  merge = left: right:
    if left == [ ] then right
    else if right == [ ] then left
    else if builtins.head left <= builtins.head right
      then [ (builtins.head left) ] ++ merge (builtins.tail left) right
      else [ (builtins.head right) ] ++ merge left (builtins.tail right);

  mergeSort = list:
    if builtins.length list <= 1 then list
    else
      let
        mid = builtins.length list / 2;
        left = builtins.genList (i: builtins.elemAt list i) mid;
        right = builtins.genList (i: builtins.elemAt list (i + mid)) (builtins.length list - mid);
      in
        merge (mergeSort left) (mergeSort right);
in
  mergeSort [ 5 2 9 1 5 6 ]
