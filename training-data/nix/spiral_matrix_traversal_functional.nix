let
  matrix = [
    [ 1 2 3 ]
    [ 4 5 6 ]
    [ 7 8 9 ]
  ];

  rows = builtins.length matrix;
  cols = builtins.length (builtins.head matrix);
  at = r: c: builtins.elemAt (builtins.elemAt matrix r) c;

  spiral = top: bottom: left: right:
    if top > bottom || left > right then [ ]
    else
      let
        topRow = builtins.genList (c: at top (left + c)) (right - left + 1);
        rightCol =
          if top < bottom then builtins.genList (r: at (top + 1 + r) right) (bottom - top)
          else [ ];
        bottomRow =
          if top < bottom && left < right then
            builtins.genList (c: at bottom (right - 1 - c)) (right - left)
          else [ ];
        leftCol =
          if top < bottom && left < right then
            builtins.genList (r: at (bottom - 1 - r) left) (bottom - top - 1)
          else [ ];
      in
        topRow ++ rightCol ++ bottomRow ++ leftCol ++ spiral (top + 1) (bottom - 1) (left + 1) (right - 1);
in
  spiral 0 (rows - 1) 0 (cols - 1)
