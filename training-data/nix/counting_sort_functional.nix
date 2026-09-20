let
  countingSort = list:
    let
      counts = builtins.foldl'
        (acc: x:
          let k = toString x; in
          acc // { ${k} = (acc.${k} or 0) + 1; })
        { }
        list;

      maxVal = builtins.foldl' (a: b: if b > a then b else a) (builtins.head list) list;

      expand = n:
        if n > maxVal then [ ]
        else
          let
            k = toString n;
            c = counts.${k} or 0;
          in
            (builtins.genList (_: n) c) ++ expand (n + 1);
    in
      expand 0;

  data = [ 4 2 2 8 3 3 1 0 ];
in
  countingSort data
