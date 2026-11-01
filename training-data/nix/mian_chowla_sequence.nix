# Greedy sequence whose pairwise sums are all distinct.
let
  elem = builtins.elem;
  unique = l: builtins.foldl' (acc: x: if elem x acc then acc else acc ++ [ x ]) [ ] l;
  build = count: seq: sums: cand:
    if builtins.length seq == count then seq
    else
      let
        fresh = map (x: x + cand) (seq ++ [ cand ]);
        distinct = builtins.length (unique fresh) == builtins.length fresh;
        clash = builtins.any (s: elem s sums) fresh;
      in
      if distinct && !clash
      then build count (seq ++ [ cand ]) (sums ++ fresh) (cand + 1)
      else build count seq sums (cand + 1);
in
builtins.concatStringsSep " " (map toString (build 8 [ ] [ ] 1))
