let
  extGcd = a: b:
    if b == 0 then { gcd = a; x = 1; y = 0; }
    else
      let
        q = a / b;
        r = a - q * b;
        sub = extGcd b r;
      in
        { gcd = sub.gcd; x = sub.y; y = sub.x - q * sub.y; };

  result1 = extGcd 30 20;
  result2 = extGcd 240 46;
in
{
  gcd1 = result1.gcd;
  bezout1 = 30 * result1.x + 20 * result1.y;
  gcd2 = result2.gcd;
  bezout2 = 240 * result2.x + 46 * result2.y;
}
