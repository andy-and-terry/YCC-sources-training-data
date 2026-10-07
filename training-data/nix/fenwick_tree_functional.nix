let
  n = 8;

  lowbit = x: builtins.bitAnd x (-x);

  update = tree: i: delta:
    let
      go = t: idx: if idx > n then t else go (builtins.genList (k: if k == idx then builtins.elemAt t k + delta else builtins.elemAt t k) (n + 1)) (idx + lowbit idx);
    in
      go tree i;

  prefixSum = tree: i:
    let
      go = idx: sum: if idx <= 0 then sum else go (idx - lowbit idx) (sum + builtins.elemAt tree idx);
    in
      go i 0;

  emptyTree = builtins.genList (i: 0) (n + 1);
  values = [ 3 2 (-1) 6 5 4 (-3) 3 ]; # 0-indexed values, stored at Fenwick position i+1
  tree = builtins.foldl' (t: i: update t (i + 1) (builtins.elemAt values i)) emptyTree (builtins.genList (i: i) n);
in
{
  prefixSum4 = prefixSum tree 4;
  prefixSum8 = prefixSum tree 8;
}
