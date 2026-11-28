let
  escape = cr: ci:
    let
      go = zr: zi: n:
        if n == 30 || zr * zr + zi * zi >= 4.0 then n
        else go (zr * zr - zi * zi + cr) (2.0 * zr * zi + ci) (n + 1);
    in go 0.0 0.0 0;
  range = a: b: builtins.genList (i: a + i) (b - a + 1);
  row = yi: builtins.concatStringsSep ""
    (map (xi: if escape (xi / 20.0) (yi / 5.0) == 30 then "#" else ".") (range (-40) 12));
in
builtins.concatStringsSep "\n" (map row (range (-5) 5))
