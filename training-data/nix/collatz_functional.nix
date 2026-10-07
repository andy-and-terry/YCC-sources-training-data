let
  step = n: if n - 2 * (n / 2) == 0 then n / 2 else 3 * n + 1;
  collatz = n: if n == 1 then [ 1 ] else [ n ] ++ collatz (step n);
in
  {
    seq6 = collatz 6;
    steps27 = builtins.length (collatz 27) - 1;
  }
