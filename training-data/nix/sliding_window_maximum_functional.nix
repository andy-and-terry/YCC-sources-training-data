let
  arr = [ 1 3 (-1) (-3) 5 3 6 7 ];
  k = 3;
  n = builtins.length arr;

  # A monotonic deque of indices (front holds the max of the current
  # window), simulated with plain lists since Nix has no mutation.
  step = state: i:
    let
      inWindow = builtins.filter (j: j > i - k) state.deque;

      dropBack = d:
        if d == [ ] then [ ]
        else
          let last = builtins.elemAt d (builtins.length d - 1); in
          if builtins.elemAt arr last <= builtins.elemAt arr i
          then dropBack (builtins.sublist 0 (builtins.length d - 1) d)
          else d;

      newDeque = (dropBack inWindow) ++ [ i ];
      newResults =
        if i >= k - 1
        then state.results ++ [ builtins.elemAt arr (builtins.head newDeque) ]
        else state.results;
    in
      { deque = newDeque; results = newResults; };

  final = builtins.foldl' step { deque = [ ]; results = [ ]; } (builtins.genList (i: i) n);
in
  final.results
