let
  ordinal = n:
    let
      r100 = n - (n / 100) * 100;
      r10 = n - (n / 10) * 10;
      suffix =
        if r100 >= 11 && r100 <= 13 then "th"
        else if r10 == 1 then "st"
        else if r10 == 2 then "nd"
        else if r10 == 3 then "rd"
        else "th";
    in
    "${toString n}${suffix}";
in
builtins.concatStringsSep " " (map ordinal [ 1 2 3 4 11 12 13 21 101 111 ])
