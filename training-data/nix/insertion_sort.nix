let
  insert = list: x:
    if list == [ ] then [ x ]
    else if x <= builtins.head list then [ x ] ++ list
    else [ (builtins.head list) ] ++ insert (builtins.tail list) x;

  insertionSort = list:
    builtins.foldl' insert [ ] list;
in
  insertionSort [ 12 11 13 5 6 ]
