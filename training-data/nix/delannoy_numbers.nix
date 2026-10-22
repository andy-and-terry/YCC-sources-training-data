# Central Delannoy numbers: D(m,n) = D(m-1,n) + D(m,n-1) + D(m-1,n-1)
let
  # lazy table: each cell refers to earlier cells of the same table
  table = builtins.genList (m: builtins.genList (n: delannoy m n) 10) 10;
  delannoy = m: n:
    if m == 0 || n == 0 then 1
    else builtins.elemAt (builtins.elemAt table (m - 1)) n
      + builtins.elemAt (builtins.elemAt table m) (n - 1)
      + builtins.elemAt (builtins.elemAt table (m - 1)) (n - 1);
in
  builtins.concatStringsSep " " (builtins.genList (k: toString (delannoy k k)) 10)
