let
  digitProduct = n: if n == 0 then 1 else (n - (n / 10) * 10) * digitProduct (n / 10);
  persistence = n: if n < 10 then 0 else 1 + persistence (digitProduct n);
in
builtins.map persistence [ 39 77 999 10 ]
