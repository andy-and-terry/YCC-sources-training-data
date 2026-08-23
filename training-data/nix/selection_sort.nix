let
  selectionSort = list:
    if list == [ ] then [ ]
    else
      let
        minVal = builtins.foldl' (a: b: if b < a then b else a) (builtins.head list) list;
        rest = builtins.filter (x: x != minVal) list
          ++ builtins.genList (i: minVal) ((builtins.length (builtins.filter (x: x == minVal) list)) - 1);
      in
        [ minVal ] ++ selectionSort (builtins.filter (x: x != minVal) list);
in
  selectionSort [ 5 3 8 1 9 2 ]
