let
  sieve = candidates:
    if candidates == [ ] then [ ]
    else
      let
        p = builtins.head candidates;
        rest = builtins.filter (x: x < p * p || x - (x / p) * p != 0) (builtins.tail candidates);
      in
        [ p ] ++ sieve rest;

  limit = 50;
  candidates = builtins.genList (i: i + 2) (limit - 1);
in
  sieve candidates
