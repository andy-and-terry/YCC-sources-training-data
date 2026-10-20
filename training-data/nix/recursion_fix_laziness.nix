let
  fix = f: let x = f x; in x;
  fact = fix (self: n: if n <= 1 then 1 else n * self (n - 1));
  fib = n: if n < 2 then n else fib (n - 1) + fib (n - 2);
  range = a: b: if a >= b then [ ] else [ a ] ++ range (a + 1) b;
  take = n: l: if n == 0 || l == [ ] then [ ] else [ (builtins.head l) ] ++ take (n - 1) (builtins.tail l);
  nats = let go = n: { head = n; tail = go (n + 1); }; in go 0;
  unused = throw "never evaluated because lazy";
  firstN = n: s: if n == 0 then [ ] else [ s.head ] ++ firstN (n - 1) s.tail;
in {
  f10 = fact 10;
  fib15 = fib 15;
  r = range 0 6;
  t = take 2 [ 1 2 3 ];
  lazy = firstN 5 nats;
  ignores = (x: 1) unused;
  selfRef = (rec { a = 1; b = a + 1; }).b;
}
