let
  nextRow = row:
    let
      padded = [ 0 ] ++ row;
      padded2 = row ++ [ 0 ];
    in
      builtins.genList (i: builtins.elemAt padded i + builtins.elemAt padded2 i) (builtins.length row + 1);
  rows = n: builtins.genList (i: i) n;
  pascal = n:
    builtins.foldl' (acc: _: acc ++ [ (nextRow (builtins.elemAt acc (builtins.length acc - 1))) ]) [ [ 1 ] ] (rows (n - 1));
in
  pascal 6
