# Affine cipher y = (5x + 8) mod 26 over uppercase letters
let
  alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
  index = c:
    let go = i: if builtins.substring i 1 alphabet == c then i else go (i + 1);
    in go 0;
  mod = a: b: a - (a / b) * b;
  encrypt = a: b: s:
    builtins.concatStringsSep "" (builtins.genList
      (i: builtins.substring (mod (a * (index (builtins.substring i 1 s)) + b) 26) 1 alphabet)
      (builtins.stringLength s));
in
encrypt 5 8 "AFFINE"
