# Start with odds, then delete every k-th survivor for each surviving k
let
  limit = 50;

  sieve = nums: i:
    if i >= builtins.length nums || builtins.elemAt nums i > builtins.length nums then nums
    else
      let
        step = builtins.elemAt nums i;
        kept = builtins.filter (p: (p.fst + 1) - step * ((p.fst + 1) / step) != 0)
          (builtins.genList (j: { fst = j; snd = builtins.elemAt nums j; }) (builtins.length nums));
      in
        sieve (map (p: p.snd) kept) (i + 1);

  odds = builtins.genList (i: 2 * i + 1) ((limit + 1) / 2);
in
  builtins.concatStringsSep " " (map toString (sieve odds 1))
