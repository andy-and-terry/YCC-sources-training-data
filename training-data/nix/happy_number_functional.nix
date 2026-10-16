let
  digits = n: if n < 10 then [ n ] else digits (n / 10) ++ [ (n - (n / 10) * 10) ];
  step = n: builtins.foldl' (a: d: a + d * d) 0 (digits n);
  isHappy = n:
    let go = seen: x:
      if x == 1 then true
      else if builtins.elem x seen then false
      else go (seen ++ [ x ]) (step x);
    in go [ ] n;
in
builtins.filter isHappy (builtins.genList (i: i + 1) 50)
