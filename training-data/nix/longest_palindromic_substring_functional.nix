let
  s = "babad";
  n = builtins.stringLength s;

  expand = left: right:
    if left < 0 || right >= n || builtins.substring left 1 s != builtins.substring right 1 s then
      { start = left + 1; length = right - left - 1; }
    else
      expand (left - 1) (right + 1);

  centers = builtins.genList (i: [ (expand i i) (expand i (i + 1)) ]) n;
  flat = builtins.concatLists centers;
  best = builtins.foldl' (a: b: if b.length > a.length then b else a) { start = 0; length = 1; } flat;
in
  builtins.substring best.start best.length s
