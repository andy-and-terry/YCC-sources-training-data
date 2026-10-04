let
  fix = f: let x = f x; in x;

  # self-referential attrset without `rec`
  config = fix (self: {
    host = "example.org";
    port = 8080;
    url = "http://${self.host}:${toString self.port}/";
  });

  # recursion through the fixed point
  factorial = fix (self: n: if n <= 1 then 1 else n * self (n - 1));

  # extensible fixed point: overriding a field updates dependants
  extend = f: g: self: let super = f self; in super // g self super;
  base = self: { a = 1; b = self.a + 1; };
  extended = fix (extend base (self: super: { a = 10; }));
in
{ inherit config extended; fact5 = factorial 5; }
