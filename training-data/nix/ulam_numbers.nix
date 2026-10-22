# Next term: smallest value with exactly one representation as a sum of two distinct terms
let
  count = 15;

  ways = terms: cand:
    let
      n = builtins.length terms;
      at = builtins.elemAt terms;
      pairs = builtins.concatLists (builtins.genList (a:
        builtins.genList (k: at a + at (a + 1 + k)) (n - a - 1)) n);
    in
      builtins.length (builtins.filter (s: s == cand) pairs);

  go = terms: cand:
    if builtins.length terms >= count then terms
    else if ways terms cand == 1 then go (terms ++ [ cand ]) (cand + 1)
    else go terms (cand + 1);
in
  builtins.concatStringsSep " " (map toString (go [ 1 2 ] 3))
