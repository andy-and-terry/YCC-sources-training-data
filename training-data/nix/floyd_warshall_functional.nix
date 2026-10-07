let
  inf = 999999;

  # Adjacency matrix as a list of rows; inf means "no direct edge".
  initial = [
    [ 0   3   inf inf ]
    [ inf 0   1   inf ]
    [ inf inf 0   7   ]
    [ 2   inf inf 0   ]
  ];

  n = builtins.length initial;

  at = m: i: j: builtins.elemAt (builtins.elemAt m i) j;

  setAt = m: i: j: v:
    builtins.genList
      (row:
        if row != i then builtins.elemAt m row
        else
          builtins.genList
            (col: if col == j then v else at m row col)
            n)
      n;

  relax = m: k: i: j:
    let
      viaK = at m i k + at m k j;
    in
      if viaK < at m i j then setAt m i j viaK else m;

  relaxAllJ = m: k: i:
    builtins.foldl' (acc: j: relax acc k i j) m (builtins.genList (j: j) n);

  relaxAllI = m: k:
    builtins.foldl' (acc: i: relaxAllJ acc k i) m (builtins.genList (i: i) n);

  final = builtins.foldl' relaxAllI initial (builtins.genList (k: k) n);
in
  {
    distances = final;
    shortestZeroToTwo = at final 0 2;
  }
