let
  pts = [ [ 0 0 ] [ 4 0 ] [ 4 3 ] [ 0 3 ] ];
  n = builtins.length pts;
  at = builtins.elemAt;
  term = i:
    let
      a = at pts i;
      b = at pts (if i + 1 == n then 0 else i + 1);
    in (at a 0) * (at b 1) - (at b 0) * (at a 1);
  s = builtins.foldl' (acc: i: acc + term i) 0 (builtins.genList (i: i) n);
  abs = x: if x < 0 then -x else x;
in
  (abs s) / 2
