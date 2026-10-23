# Van Eck's sequence: a(0) = 0, then each term is the distance since the previous
# occurrence of the last term, or 0 if the last term was new
let
  count = 20;

  go = acc:
    let
      n = builtins.length acc;
      last = builtins.elemAt acc (n - 1);
      # scan backwards from the term before the last one
      find = k:
        if k < 0 then 0
        else if builtins.elemAt acc k == last then n - 1 - k
        else find (k - 1);
    in
      if n >= count then acc else go (acc ++ [ (find (n - 2)) ]);
in
  go [ 0 ]
