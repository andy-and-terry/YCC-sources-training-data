let
  fix = f: let x = f x; in x;
  # attribute sets can refer to their own final result via fix
  config = fix (self: {
    name = "svc";
    port = 9000;
    url = "http://${self.name}:${toString self.port}";
    healthUrl = "${self.url}/health";
  });
  factorial = fix (self: n: if n <= 1 then 1 else n * self (n - 1));
in
{
  inherit config;
  fact6 = factorial 6;
}
