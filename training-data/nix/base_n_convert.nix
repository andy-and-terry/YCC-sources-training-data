let
  digits = "0123456789abcdefghijklmnopqrstuvwxyz";
  toBase = base: n:
    let
      go = k: acc:
        if k == 0 then acc
        else go (k / base) (builtins.substring (k - (k / base) * base) 1 digits + acc);
    in
    if n == 0 then "0" else go n "";
in
builtins.listToAttrs (map (b: { name = "base${toString b}"; value = toBase b 255; }) [ 2 8 16 36 ])
