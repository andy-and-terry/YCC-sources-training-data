let
  fix = f: let x = f x; in x;
  fact = fix (self: n: if n <= 1 then 1 else n * self (n - 1));
in
fact 6
