let
  arr = [ 1 3 5 7 9 11 13 15 ];
  target = 9;

  search = lo: hi:
    if lo > hi then -1
    else
      let
        third = (hi - lo) / 3;
        m1 = lo + third;
        m2 = hi - third;
        v1 = builtins.elemAt arr m1;
        v2 = builtins.elemAt arr m2;
      in
        if v1 == target then m1
        else if v2 == target then m2
        else if target < v1 then search lo (m1 - 1)
        else if target > v2 then search (m2 + 1) hi
        else search (m1 + 1) (m2 - 1);
in
  search 0 (builtins.length arr - 1)
