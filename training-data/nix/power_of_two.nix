let
  isPowerOfTwo = n:
    if n <= 0 then false
    else if n == 1 then true
    else if n - (n / 2) * 2 != 0 then false
    else isPowerOfTwo (n / 2);
in
  {
    r16 = isPowerOfTwo 16;
    r18 = isPowerOfTwo 18;
  }
