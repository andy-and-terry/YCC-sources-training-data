let
  pts = [ [ 0 0 ] [ 4 0 ] [ 4 3 ] [ 0 3 ] ];
  n = builtins.length pts;
  at = i: builtins.elemAt pts (builtins.stringLength "" + (i - (i / n) * n));
  term = i: let p = at i; q = at (i + 1); in (builtins.elemAt p 0) * (builtins.elemAt q 1) - (builtins.elemAt q 0) * (builtins.elemAt p 1);
  total = builtins.foldl' (a: i: a + term i) 0 (builtins.genList (i: i) n);
in
(if total < 0 then -total else total) / 2
