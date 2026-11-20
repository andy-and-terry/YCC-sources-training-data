# Shoelace polygon area (doubled to avoid float formatting).
let
  pts = [ [ 0 0 ] [ 4 0 ] [ 4 3 ] [ 0 3 ] ];
  n = builtins.length pts;
  at = builtins.elemAt;
  terms = builtins.genList (i:
    let a = at pts i; b = at pts (if i + 1 == n then 0 else i + 1);
    in (at a 0) * (at b 1) - (at b 0) * (at a 1)) n;
  s = builtins.foldl' builtins.add 0 terms;
in
(if s < 0 then -s else s) / 2
