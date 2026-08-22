let
  fibHelper = n: a: b:
    if n == 0 then a
    else fibHelper (n - 1) b (a + b);
  fib = n: fibHelper n 0 1;
in
  builtins.genList fib 11
