let
  fix = f: let x = f x; in x;
  fibs = fix (self: { a = 1; b = self.a + 1; c = self.a + self.b; });
  fact = fix (self: n: if n <= 1 then 1 else n * self (n - 1));
in
{
  inherit fibs;
  f6 = fact 6;
}
