let
  letters = "abcdefghijklmnopqrstuvwxyz";
  at = i: builtins.substring i 1 letters;
  idx = c: builtins.head (builtins.filter (i: at i == c) (builtins.genList (i: i) 26));
  shiftChar = k: c:
    if builtins.match "[a-z]" c == null then c
    else at (let r = idx c + k; in r - (r / 26) * 26);
  encode = k: s: builtins.concatStringsSep ""
    (builtins.genList (i: shiftChar k (builtins.substring i 1 s)) (builtins.stringLength s));
in
{ enc = encode 3 "hello, world"; dec = encode 23 (encode 3 "hello, world"); }
