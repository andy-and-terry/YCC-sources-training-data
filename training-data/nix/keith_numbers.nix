# Keith numbers: n appears in the Fibonacci-like sequence seeded by its digits.
let
  range = lo: hi: builtins.genList (i: lo + i) (hi - lo + 1);
  mod = a: b: a - (a / b) * b;
  sum = builtins.foldl' (a: b: a + b) 0;
  pow = b: e: if e == 0 then 1 else b * pow b (e - 1);
  digits = n: if n < 10 then [ n ] else digits (n / 10) ++ [ (mod n 10) ];
  gcd = a: b: if b == 0 then a else gcd b (mod a b);
  isKeith = n:
    let
      k = builtins.length (digits n);
      go = seq:
        let last = builtins.elemAt seq (builtins.length seq - 1); in
        if last >= n then last == n
        else go (seq ++ [ (sum (builtins.genList (i: builtins.elemAt seq (builtins.length seq - k + i)) k)) ]);
    in
    go (digits n);
in
builtins.filter isKeith (range 10 1199)
