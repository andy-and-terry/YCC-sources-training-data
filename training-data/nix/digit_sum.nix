let
  digitSum = n:
    if n < 10 then n
    else n - (n / 10) * 10 + digitSum (n / 10);
in
  digitSum 12345
