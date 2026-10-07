let
  houses = [ 2 7 9 3 1 ];
  n = builtins.length houses;

  best = i:
    if i < 0 then 0
    else
      let
        take = builtins.elemAt houses i + best (i - 2);
        skip = best (i - 1);
      in
        if take > skip then take else skip;
in
  best (n - 1)
