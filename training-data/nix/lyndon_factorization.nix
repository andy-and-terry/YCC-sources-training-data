let
  isLyndon = w:
    let n = builtins.stringLength w;
    in builtins.all (i: w < builtins.substring i n w) (builtins.genList (i: i + 1) (n - 1));
  factor = s:
    if s == "" then [ ] else
    let
      n = builtins.stringLength s;
      lens = builtins.filter (l: isLyndon (builtins.substring 0 l s)) (builtins.genList (i: n - i) n);
      len = builtins.head lens;
    in [ (builtins.substring 0 len s) ] ++ factor (builtins.substring len n s);
in
factor "banana"
