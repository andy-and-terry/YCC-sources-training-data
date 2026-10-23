# Lucky numbers below 100: from the odd numbers, repeatedly delete every k-th
# survivor, where k is the next surviving number after the previous k
let
  limit = 100;

  odds = builtins.filter (n: n - (n / 2) * 2 == 1) (builtins.genList (i: i + 1) (limit - 1));

  # keep the elements whose 1-based position is not a multiple of k
  dropEvery = k: l:
    map (p: p.v)
      (builtins.filter (p: (p.i + 1) - ((p.i + 1) / k) * k != 0)
        (builtins.genList (i: { inherit i; v = builtins.elemAt l i; }) (builtins.length l)));

  sieve = l: idx:
    if idx >= builtins.length l then l
    else
      let k = builtins.elemAt l idx;
      in if k > builtins.length l then l else sieve (dropEvery k l) (idx + 1);
in
  sieve odds 1
