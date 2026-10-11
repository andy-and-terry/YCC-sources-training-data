let
  gcd = a: b: if b == 0 then a else gcd b (a - (a / b) * b);
  lcm = a: b: a / gcd a b * b;
in
{
  l = builtins.foldl' lcm 1 [ 2 3 4 5 6 ];
  g = builtins.foldl' gcd 0 [ 84 126 210 ];
}
