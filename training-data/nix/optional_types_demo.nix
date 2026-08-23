let
  safeDivide = a: b: if b == 0 then null else a / b;

  results = [
    (safeDivide 10 2)
    (safeDivide 5 0)
  ];
in
  results
