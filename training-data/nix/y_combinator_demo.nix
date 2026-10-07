let
  # A fixed-point combinator: lets a function refer to itself for
  # recursion without needing a named binding (no `let rec` in Nix).
  fix = f: (x: f (y: (x x) y)) (x: f (y: (x x) y));

  factorial = fix (self: n: if n == 0 then 1 else n * self (n - 1));
  fib = fix (self: n: if n < 2 then n else self (n - 1) + self (n - 2));
in
  {
    factorial5 = factorial 5;
    fib10 = fib 10;
  }
