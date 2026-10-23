# Kolakoski sequence: a self-describing sequence of 1s and 2s whose run lengths are the sequence itself
let
  count = 20;

  # i is the index of the term giving the next run length; even runs are 1s, odd runs are 2s
  go = seq: i:
    if builtins.length seq >= count then seq
    else
      let
        run = builtins.elemAt seq i;
        symbol = if i - (i / 2) * 2 == 0 then 1 else 2;
      in
        go (seq ++ builtins.genList (_: symbol) run) (i + 1);
in
  builtins.genList (i: builtins.elemAt (go [ 1 2 2 ] 2) i) count
