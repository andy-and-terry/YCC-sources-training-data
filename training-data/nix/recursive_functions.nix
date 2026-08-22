let
  factorial = n: if n <= 1 then 1 else n * factorial (n - 1);
  fibonacci = n:
    if n < 2 then n
    else fibonacci (n - 1) + fibonacci (n - 2);
in
  {
    fact5 = factorial 5;
    fib10 = fibonacci 10;
  }
