let
  # `builtins.partition pred list` splits a list into
  # `{ right = ...; wrong = ...; }`, the elements that satisfy `pred`
  # and the elements that don't, preserving order in each group.
  numbers = builtins.genList (i: i + 1) 15;

  byThreeOrEven = builtins.partition (n: n - (n / 3) * 3 == 0) numbers;
  byEvenOdd = builtins.partition (n: n - (n / 2) * 2 == 0) numbers;
in
  {
    multiplesOfThree = byThreeOrEven.right;
    notMultiplesOfThree = byThreeOrEven.wrong;
    evens = byEvenOdd.right;
    odds = byEvenOdd.wrong;
  }
