let
  lisLength = list:
    let
      n = builtins.length list;

      lengthEndingAt = i:
        let
          xi = builtins.elemAt list i;
          candidates = builtins.filter (j: builtins.elemAt list j < xi)
            (builtins.genList (j: j) i);
          lens = map (j: 1 + lengthEndingAt j) candidates;
        in
          if candidates == [ ] then 1
          else builtins.foldl' (a: b: if b > a then b else a) (builtins.head lens) lens;

      allLengths = builtins.genList lengthEndingAt n;
    in
      if allLengths == [ ] then 0
      else builtins.foldl' (a: b: if b > a then b else a) (builtins.head allLengths) allLengths;

  data = [ 10 9 2 5 3 7 101 18 ];
in
  lisLength data
