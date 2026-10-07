let
  candidates = [ 2 3 6 7 ];
  target = 7;

  combos = start: remaining:
    if remaining == 0 then [ [ ] ]
    else if remaining < 0 || start >= builtins.length candidates then [ ]
    else
      let
        c = builtins.elemAt candidates start;
        withC = map (combo: [ c ] ++ combo) (combos start (remaining - c));
        withoutC = combos (start + 1) remaining;
      in
        withC ++ withoutC;
in
  combos 0 target
