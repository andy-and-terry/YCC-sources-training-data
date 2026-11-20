# Wilson's theorem primality test.
let
  wilson = n:
    n >= 2 && (builtins.foldl' (f: i: (f * i) - ((f * i) / n) * n) 1 (builtins.genList (i: i + 2) (n - 2))) == n - 1;
in
builtins.filter wilson (builtins.genList (i: i + 2) 18)
