let
  gcd = a: b:
    if b == 0 then a
    else gcd b (a - b * (a / b));
in
  {
    result1 = gcd 48 18;
    result2 = gcd 100 75;
  }
