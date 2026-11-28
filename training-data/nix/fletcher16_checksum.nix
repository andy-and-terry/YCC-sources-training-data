# Fletcher-16 over a list of byte values (nix has no native bytes type).
let
  fletcher16 = bytes:
    let
      step = acc: b:
        let a = (acc.s1 + b) - ((builtins.div (acc.s1 + b) 255) * 255);
        in { s1 = a; s2 = (acc.s2 + a) - ((builtins.div (acc.s2 + a) 255) * 255); };
      r = builtins.foldl' step { s1 = 0; s2 = 0; } bytes;
    in r.s2 * 256 + r.s1;
in
  fletcher16 [ 97 98 99 100 101 ] # 51440 (0xc8f0)
