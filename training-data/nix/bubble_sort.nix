let
  swapAt = list: i:
    let
      a = builtins.elemAt list i;
      b = builtins.elemAt list (i + 1);
    in
      (builtins.genList (idx:
        if idx == i then b
        else if idx == i + 1 then a
        else builtins.elemAt list idx) (builtins.length list));

  bubblePass = list:
    builtins.foldl'
      (acc: i:
        if builtins.elemAt acc i > builtins.elemAt acc (i + 1)
        then swapAt acc i
        else acc)
      list
      (builtins.genList (i: i) (builtins.length list - 1));

  bubbleSort = list:
    builtins.foldl' (acc: _: bubblePass acc) list (builtins.genList (i: i) (builtins.length list));
in
  bubbleSort [ 5 2 9 1 5 6 ]
