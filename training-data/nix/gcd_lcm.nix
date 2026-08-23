let
  gcd = a: b: if b == 0 then (if a < 0 then -a else a) else gcd b (a - (a / b) * b);
  lcm = a: b: (if a * b < 0 then -(a * b) else a * b) / gcd a b;
in
  {
    gcdResult = gcd 48 18;
    lcmResult = lcm 4 6;
  }
