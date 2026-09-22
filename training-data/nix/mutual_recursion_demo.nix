let
  # a `rec` attrset lets its bindings refer to each other, which is
  # how mutual recursion is expressed without a `let rec` keyword.
  helpers = rec {
    isEven = n: if n == 0 then true else isOdd (n - 1);
    isOdd = n: if n == 0 then false else isEven (n - 1);
  };
in
  {
    evenResults = map helpers.isEven [ 0 1 2 3 4 ];
    oddResults = map helpers.isOdd [ 0 1 2 3 4 ];
  }
