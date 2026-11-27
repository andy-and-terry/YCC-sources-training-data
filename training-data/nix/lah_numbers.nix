let
  fact = n: if n <= 1 then 1 else n * fact (n - 1);
  comb = n: k: (fact n) / ((fact k) * (fact (n - k)));
  lah = n: k: (comb (n - 1) (k - 1)) * (fact n) / (fact k);
  range = a: b: builtins.genList (i: a + i) (b - a + 1);
in
  map (n: map (k: lah n k) (range 1 n)) (range 1 5)
