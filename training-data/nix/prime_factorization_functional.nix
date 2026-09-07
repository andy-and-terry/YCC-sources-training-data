let
  factorize = n: divisor:
    if n <= 1 then [ ]
    else if divisor * divisor > n then [ n ]
    else if n - (n / divisor) * divisor == 0 then
      [ divisor ] ++ factorize (n / divisor) divisor
    else
      factorize n (divisor + 1);

  primeFactors = n: factorize n 2;
in
{
  factors360 = primeFactors 360;
  factors97 = primeFactors 97;
  factors1 = primeFactors 1;
}
