let
  gcd = a: b: if b == 0 then (if a < 0 then -a else a) else gcd b (a - (a / b) * b);
  gcdAll = builtins.foldl' gcd 0;
in
{
  first = gcdAll [ 12 18 24 ];
  second = gcdAll [ 7 13 ];
}
