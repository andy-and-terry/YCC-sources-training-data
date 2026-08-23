let
  fizzbuzz = n:
    if n - (n / 15) * 15 == 0 then "FizzBuzz"
    else if n - (n / 3) * 3 == 0 then "Fizz"
    else if n - (n / 5) * 5 == 0 then "Buzz"
    else builtins.toString n;
in
  map fizzbuzz (builtins.genList (i: i + 1) 20)
