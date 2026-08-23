let
  power = base: exp:
    if exp == 0 then 1
    else if exp - (exp / 2) * 2 == 0
      then let half = power base (exp / 2); in half * half
      else base * power base (exp - 1);
in
  {
    result1 = power 2 10;
    result2 = power 3 5;
  }
