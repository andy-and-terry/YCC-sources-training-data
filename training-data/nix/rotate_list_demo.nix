let
  rotate = k: xs:
    let n = builtins.length xs; s = k - (k / n) * n;
    in builtins.genList (i: builtins.elemAt xs (let j = i + s; in if j >= n then j - n else j)) n;
in
{ left2 = rotate 2 [ 1 2 3 4 5 ]; wrap = rotate 7 [ 1 2 3 4 5 ]; }
