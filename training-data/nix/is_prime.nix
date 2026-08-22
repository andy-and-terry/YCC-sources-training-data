let
  isPrime = n:
    if n < 2 then false
    else
      let
        checkDivisor = i:
          if i * i > n then true
          else if n / i * i == n then false
          else checkDivisor (i + 1);
      in
        checkDivisor 2;
in
  builtins.filter isPrime (builtins.genList (n: n) 20)
