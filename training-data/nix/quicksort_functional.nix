let
  quicksort = list:
    if list == [ ] then [ ]
    else
      let
        pivot = builtins.head list;
        rest = builtins.tail list;
        smaller = builtins.filter (x: x < pivot) rest;
        larger = builtins.filter (x: x >= pivot) rest;
      in
        quicksort smaller ++ [ pivot ] ++ quicksort larger;
in
  quicksort [ 5 2 9 1 5 6 ]
