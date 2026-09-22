let
  quicksort = xs:
    if xs == [ ] then [ ]
    else
      let
        pivot = builtins.head xs;
        rest = builtins.tail xs;
        smaller = builtins.filter (x: x < pivot) rest;
        larger = builtins.filter (x: x >= pivot) rest;
      in
        quicksort smaller ++ [ pivot ] ++ quicksort larger;
in
  quicksort [ 5 3 8 1 9 2 7 ]
