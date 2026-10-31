let
  digits = n: if n == 0 then [ ] else digits (n / 10) ++ [ (n - (n / 10) * 10) ];
  alternatingDigitSum = n:
    let
      ds = builtins.genList (i: builtins.elemAt (digits n) (builtins.length (digits n) - 1 - i)) (builtins.length (digits n));
    in builtins.foldl' (acc: i: acc + (if i - (i / 2) * 2 == 0 then 1 else -1) * builtins.elemAt ds i) 0 (builtins.genList (i: i) (builtins.length ds));
in
builtins.map alternatingDigitSum [ 1234 99999 1000 ]
