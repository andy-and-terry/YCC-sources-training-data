let
  fix = f: let x = f x; in x;
  result = fix (self: {
    a = 1;
    b = self.a + 1;
    c = self.b * 10;
  });
  factorial = fix (self: n: if n <= 1 then 1 else n * self (n - 1));
in
{ inherit result; fact6 = factorial 6; }
