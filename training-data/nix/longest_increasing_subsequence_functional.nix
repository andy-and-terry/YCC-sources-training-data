let
  lis = arr:
    let
      n = builtins.length arr;
      dp = builtins.genList
        (i:
          let
            a = builtins.elemAt arr i;
            prevIndices = builtins.filter (j: builtins.elemAt arr j < a) (builtins.genList (k: k) i);
            best = builtins.foldl' (m: j: let v = builtins.elemAt dp j; in if v > m then v else m) 0 prevIndices;
          in
            best + 1)
        n;
    in
      builtins.foldl' (m: x: if x > m then x else m) 0 dp;
in
  lis [ 10 9 2 5 3 7 101 18 ]
