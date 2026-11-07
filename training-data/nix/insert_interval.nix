let
  insertInterval = ivs: new:
    let
      before = builtins.filter (iv: iv.hi < new.lo) ivs;
      after = builtins.filter (iv: iv.lo > new.hi) ivs;
      overlap = builtins.filter (iv: iv.hi >= new.lo && iv.lo <= new.hi) ivs;
      minOf = builtins.foldl' (a: b: if b < a then b else a);
      maxOf = builtins.foldl' (a: b: if b > a then b else a);
      merged = {
        lo = minOf new.lo (map (iv: iv.lo) overlap);
        hi = maxOf new.hi (map (iv: iv.hi) overlap);
      };
    in before ++ [ merged ] ++ after;
in insertInterval [ { lo = 1; hi = 3; } { lo = 6; hi = 9; } ] { lo = 2; hi = 5; }
# [ { hi = 5; lo = 1; } { hi = 9; lo = 6; } ]
