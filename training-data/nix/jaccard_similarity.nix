# Jaccard similarity of two integer lists (as sets)
let
  uniq = xs: builtins.foldl' (acc: x: if builtins.elem x acc then acc else acc ++ [ x ]) [ ] xs;
  jaccard = a: b:
    let
      inter = builtins.filter (x: builtins.elem x b) (uniq a);
      union = uniq (a ++ b);
    in
    (builtins.length inter) * 1.0 / (builtins.length union);
in
jaccard [ 1 2 3 4 ] [ 3 4 5 ]
