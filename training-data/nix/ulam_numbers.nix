# Ulam numbers: start with 1 and 2; each next term is the smallest integer
# that is the sum of two distinct earlier terms in exactly one way
let
  count = 15;

  # number of ways cand = a + b with a < b, both already in the sequence
  ways = acc: cand:
    builtins.length (builtins.filter (a: a < cand - a && builtins.elem (cand - a) acc) acc);

  go = acc: cand:
    if builtins.length acc >= count then acc
    else if ways acc cand == 1 then go (acc ++ [ cand ]) (cand + 1)
    else go acc (cand + 1);
in
  go [ 1 2 ] 3
